// Copyright 2014 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

// Copyright 2021 Maxim Saplin - changes and modifications to original Flutter implementation of DataTable

// ignore_for_file: parameter_assignments

import 'dart:math' as math;

import 'package:flutter/material.dart';

/// Relative size of a column determines the share of total table width allocated
/// to each individual column. When determining column widths ratios between S, M and L
/// columns are kept (i.e. Large columns are set to 1.2x width of Medium ones)
/// - see [DataTable2.smRatio], [DataTable2.lmRatio] and same properties on [PaginatedDataTable2].
/// Default S/M ratio is 0.67,L/M ratio is 1.2
enum ColumnSize { S, M, L }

/// Extension of stock [DataColumn], adds the capability to set relative column
/// size via [size] property
@immutable
class CustomDataColumn extends DataColumn {
  /// Creates the configuration for a column of a [DataTable2].
  ///
  /// The [label] argument must not be null.
  const CustomDataColumn({
    required super.label,
    super.tooltip,
    super.numeric = false,
    super.onSort,
    this.size = ColumnSize.M,
    this.fixedWidth,
  });

  /// Column sizes are determined based on available width by distributing it
  /// to individual columns accounting for their relative sizes (see [ColumnSize])
  final ColumnSize size;

  /// Defines absolute width of the column in pixel (as opposed to relative size used by default).
  /// Warning, if the width happens to be larger than available total width other
  /// columns can be clipped
  final double? fixedWidth;
}

/// Extension of standard [DataRow], adds row level tap events. Also there're
/// onSecondaryTap and onSecondaryTapDown which are not available in DataCells and
/// which can be useful in Desktop settings when a reaction to the right click is required.
@immutable
class CustomDataRow extends DataRow {
  //CustomDataRow.fromDataRow(DataRow row) : this.cells = row.cells;

  /// Creates the configuration for a row of a [DataTable2].
  ///
  /// The [cells] argument must not be null.
  const CustomDataRow({
    super.key,
    super.selected = false,
    super.onSelectChanged,
    super.color,
    required super.cells,
    this.specificRowHeight,
    this.onTap,
    this.onDoubleTap,
    super.onLongPress,
    this.onSecondaryTap,
    this.onSecondaryTapDown,
  });

  CustomDataRow.byIndex({
    super.index,
    super.selected = false,
    super.onSelectChanged,
    super.color,
    required super.cells,
    this.specificRowHeight,
    this.onTap,
    this.onDoubleTap,
    super.onLongPress,
    this.onSecondaryTap,
    this.onSecondaryTapDown,
  }) : super.byIndex();

  /// Specific row height, which will be used only if provided.
  /// If not provided, dataRowHeight will be applied.
  final double? specificRowHeight;

  /// Row tap handler, won't be called if tapped cell has any tap event handlers
  final GestureTapCallback? onTap;

  /// Row right click handler, won't be called if tapped cell has any tap event handlers
  final GestureTapCallback? onSecondaryTap;

  /// Row right mouse down handler, won't be called if tapped cell has any tap event handlers
  final GestureTapDownCallback? onSecondaryTapDown;

  /// Row double tap handler, won't be called if tapped cell has any tap event handlers
  final GestureTapCallback? onDoubleTap;

  // /// Row long press handler, won't be called if tapped cell has any tap event handlers
  // final GestureLongPressCallback? onLongPress;
}

/// In-place replacement of standard [DataTable] widget, mimics it API.
/// Has the header row always fixed and core of the table (with data rows)
/// scrollable and stretching to max width/height of it's container.
/// By using [CustomDataColumn] instead of [DataColumn] it is possible to control
/// relative column sizes (setting them to S, M and L). [CustomDataRow] provides
/// row-level tap event handlers.
class CustomDataTable extends DataTable {
  CustomDataTable({
    super.key,
    required super.columns,
    super.sortColumnIndex,
    super.sortAscending = true,
    super.onSelectAll,
    super.decoration,
    super.dataRowColor,
    super.dataRowHeight,
    super.dataTextStyle,
    super.headingRowColor,
    super.headingRowHeight,
    super.headingTextStyle,
    super.horizontalMargin,
    super.checkboxHorizontalMargin,
    this.bottomMargin,
    super.columnSpacing,
    super.showCheckboxColumn = true,
    super.showBottomBorder = false,
    super.dividerThickness,
    this.minWidth,
    this.scrollController,
    this.empty,
    this.border,
    this.smRatio = 0.67,
    this.lmRatio = 1.2,
    this.showDivider = true,
    required super.rows,
  });

  final bool showDivider;

  static final LocalKey _headingRowKey = UniqueKey();

  void _handleSelectAll(bool? checked, bool someChecked) {
    // If some checkboxes are checked, all checkboxes are selected. Otherwise,
    // use the new checked value but default to false if it's null.
    final bool effectiveChecked = someChecked || (checked ?? false);
    if (onSelectAll != null) {
      onSelectAll!(effectiveChecked);
    } else {
      for (final DataRow row in rows) {
        if (row.onSelectChanged != null && row.selected != effectiveChecked) {
          row.onSelectChanged!(effectiveChecked);
        }
      }
    }
  }

  /// The default height of the heading row.
  static const double _headingRowHeight = 30.0;

  /// The default horizontal margin between the edges of the table and the content
  /// in the first and last cells of each row.
  static const double _horizontalMargin = 24.0;

  /// The default horizontal margin between the contents of each data column.
  static const double _columnSpacing = 56.0;

  /// The default padding between the heading content and sort arrow.
  static const double _sortArrowPadding = 2.0;

  /// The default divider thickness.
  static const double _dividerThickness = 1.0;

  static const Duration _sortArrowAnimationDuration =
      Duration(milliseconds: 150);

  /// If set, the table will stop shrinking below the threshold and provide
  /// horizontal scrolling. Useful for the cases with narrow screens (e.g. portrait phone orientation)
  /// and lots of columns (that get messed with little space)
  final double? minWidth;

  /// If set the table will have empty space added after the the last row and allow scroll the
  /// core of the table higher (e.g. if you would like to have iOS navigation UI at the bottom overlapping the table and
  /// have the ability to slightly scroll up the bototm row to avoid the obstruction)
  final double? bottomMargin;

  /// Exposes scroll controller of the SingleChildScrollView that makes data rows horizontally scrollable
  final ScrollController? scrollController;

  /// Placeholder widget which is displayed whenever the data rows are empty.
  /// The widget will be displayed below column
  final Widget? empty;

  /// Set vertical and horizontal borders between cells, as well as outside borders around table.
  /// NOTE: setting this field will disable standard horizontal dividers which are controlled by
  /// themes and [dividerThickness] property
  @override
  // keep field in order to keep doc
  // ignore: overridden_fields
  final TableBorder? border;

  /// Determines ratio of Small column's width to Medium column's width.
  /// I.e. 0.5 means that Small column is twice narower than Medium column.
  final double smRatio;

  /// Determines ratio of Large column's width to Medium column's width.
  /// I.e. 2.0 means that Large column is twice wider than Medium column.
  final double lmRatio;

  Widget _buildCheckbox({
    required BuildContext context,
    required bool? checked,
    required VoidCallback? onRowTap,
    required ValueChanged<bool?>? onCheckboxChanged,
    required MaterialStateProperty<Color?>? overlayColor,
    required bool tristate,
  }) {
    final ThemeData themeData = Theme.of(context);
    final double effectiveHorizontalMargin = horizontalMargin ??
        themeData.dataTableTheme.horizontalMargin ??
        _horizontalMargin;
    Widget contents = Semantics(
      container: true,
      child: Padding(
        padding: EdgeInsetsDirectional.only(
          start: checkboxHorizontalMargin ?? effectiveHorizontalMargin,
          end: (checkboxHorizontalMargin ?? effectiveHorizontalMargin) / 2.0,
        ),
        child: Center(
          child: Checkbox(
            activeColor: themeData.colorScheme.primary,
            checkColor: themeData.colorScheme.onPrimary,
            value: checked,
            onChanged: onCheckboxChanged,
            tristate: tristate,
          ),
        ),
      ),
    );
    if (onRowTap != null) {
      contents = TableRowInkWell(
        onTap: onRowTap,
        overlayColor: overlayColor,
        child: contents,
      );
    }
    return TableCell(
      verticalAlignment: TableCellVerticalAlignment.fill,
      child: contents,
    );
  }

  Widget _buildHeadingCell({
    required BuildContext context,
    required EdgeInsetsGeometry padding,
    required Widget label,
    required String? tooltip,
    required bool numeric,
    required VoidCallback? onSort,
    required bool sorted,
    required bool ascending,
    required MaterialStateProperty<Color?>? overlayColor,
  }) {
    final ThemeData themeData = Theme.of(context);

    final row = Row(
      textDirection: numeric ? TextDirection.rtl : null,
      children: <Widget>[
        Flexible(child: label),
        if (onSort != null) ...<Widget>[
          _SortArrow(
            visible: sorted,
            up: sorted ? ascending : null,
            duration: _sortArrowAnimationDuration,
          ),
          const SizedBox(width: _sortArrowPadding),
        ],
      ],
    );

    final TextStyle effectiveHeadingTextStyle = headingTextStyle ??
        themeData.dataTableTheme.headingTextStyle ??
        themeData.textTheme.titleSmall!;
    final double effectiveHeadingRowHeight = headingRowHeight ??
        themeData.dataTableTheme.headingRowHeight ??
        _headingRowHeight;

    final container = Container(
      padding: padding,
      height: effectiveHeadingRowHeight,
      alignment:
          numeric ? Alignment.centerRight : AlignmentDirectional.centerStart,
      child: AnimatedDefaultTextStyle(
        style: effectiveHeadingTextStyle,
        softWrap: false,
        duration: _sortArrowAnimationDuration,
        child: row,
      ),
    );

    if (tooltip != null) {
      return Tooltip(
        message: tooltip,
        child: container,
      );
    }

    return InkWell(
      onTap: onSort,
      overlayColor: overlayColor,
      child: container,
    );
  }

  Widget _buildDataCell({
    required BuildContext context,
    required EdgeInsetsGeometry padding,
    required double? specificRowHeight,
    required Widget label,
    required bool numeric,
    required bool placeholder,
    required bool showEditIcon,
    required GestureTapCallback? onTap,
    required GestureTapCallback? onDoubleTap,
    required GestureLongPressCallback? onLongPress,
    required GestureTapDownCallback? onTapDown,
    required GestureTapCancelCallback? onTapCancel,
    required GestureTapCallback? onRowTap,
    required GestureTapCallback? onRowDoubleTap,
    required GestureLongPressCallback? onRowLongPress,
    required GestureTapCallback? onRowSecondaryTap,
    required GestureTapDownCallback? onRowSecondaryTapDown,
    required VoidCallback? onSelectChanged,
    required MaterialStateProperty<Color?>? overlayColor,
  }) {
    final ThemeData themeData = Theme.of(context);
    if (showEditIcon) {
      const Widget icon = Icon(Icons.edit, size: 18.0);
      label = Expanded(child: label);
      label = Row(
        textDirection: numeric ? TextDirection.rtl : null,
        children: <Widget>[label, icon],
      );
    }

    final TextStyle effectiveDataTextStyle = dataTextStyle ??
        themeData.dataTableTheme.dataTextStyle ??
        themeData.textTheme.bodyMedium!;
    final double effectiveDataRowHeight = specificRowHeight ??
        dataRowHeight ??
        themeData.dataTableTheme.dataRowHeight ??
        kMinInteractiveDimension;
    label = Container(
      padding: padding,
      height: effectiveDataRowHeight,
      alignment:
          numeric ? Alignment.centerRight : AlignmentDirectional.centerStart,
      child: DefaultTextStyle(
        style: effectiveDataTextStyle.copyWith(
          color: placeholder
              ? effectiveDataTextStyle.color!.withOpacity(0.6)
              : null,
        ),
        child: DropdownButtonHideUnderline(child: label),
      ),
    );

    // Wrap label intro InkResponse if there're cell or row level tap events
    if (onTap != null ||
        onDoubleTap != null ||
        onLongPress != null ||
        onTapDown != null ||
        onTapCancel != null) {
      // cell only
      label = InkWell(
        onTap: () {
          onTap?.call();
          onRowTap?.call();
        },
        onDoubleTap: () {
          onDoubleTap?.call();
          onRowDoubleTap?.call();
        },
        onLongPress: () {
          onLongPress?.call();
          onRowLongPress?.call();
        },
        onTapDown: onTapDown,
        onTapCancel: onTapCancel,
        overlayColor: overlayColor,
        child: label,
      );
      label =
          _addSecondaryTaps(onRowSecondaryTap, onRowSecondaryTapDown, label);
    } else if (onSelectChanged != null ||
        onRowTap != null ||
        onRowDoubleTap != null ||
        onRowLongPress != null ||
        onRowSecondaryTap != null ||
        onRowSecondaryTapDown != null) {
      label = TableRowInkWell(
        onTap: onRowTap == null && onSelectChanged == null
            ? null
            : () {
                onRowTap?.call();
                onSelectChanged?.call();
              },
        onDoubleTap: onRowDoubleTap,
        onLongPress: onRowLongPress,
        overlayColor: overlayColor,
        child: label,
      );

      label =
          _addSecondaryTaps(onRowSecondaryTap, onRowSecondaryTapDown, label);
    }
    return label;
  }

  Widget _addSecondaryTaps(
    GestureTapCallback? onRowSecondaryTap,
    GestureTapDownCallback? onRowSecondaryTapDown,
    Widget label,
  ) {
    if (onRowSecondaryTap != null || onRowSecondaryTapDown != null) {
      label = GestureDetector(
        onSecondaryTap: onRowSecondaryTap,
        onSecondaryTapDown: onRowSecondaryTapDown,
        child: label,
      );
    }
    return label;
  }

  @override
  Widget build(BuildContext context) {
    assert(debugCheckHasMaterial(context));

    final theme = Theme.of(context);
    final effectiveHeadingRowColor =
        headingRowColor ?? theme.dataTableTheme.headingRowColor;
    final effectiveDataRowColor =
        dataRowColor ?? theme.dataTableTheme.dataRowColor;
    final defaultRowColor = MaterialStateProperty.resolveWith(
      (Set<MaterialState> states) {
        if (states.contains(MaterialState.selected)) {
          return theme.colorScheme.primary.withOpacity(0.08);
        }
        return null;
      },
    );
    final anyRowSelectable =
        rows.any((DataRow row) => row.onSelectChanged != null);
    final displayCheckboxColumn = showCheckboxColumn && anyRowSelectable;
    final rowsWithCheckbox = displayCheckboxColumn
        ? rows.where((DataRow row) => row.onSelectChanged != null)
        : <CustomDataRow>[];
    final rowsChecked = rowsWithCheckbox.where((DataRow row) => row.selected);
    final allChecked =
        displayCheckboxColumn && rowsChecked.length == rowsWithCheckbox.length;
    final anyChecked = displayCheckboxColumn && rowsChecked.isNotEmpty;
    final someChecked = anyChecked && !allChecked;
    final effectiveHorizontalMargin = horizontalMargin ??
        theme.dataTableTheme.horizontalMargin ??
        _horizontalMargin;
    final effectiveColumnSpacing =
        columnSpacing ?? theme.dataTableTheme.columnSpacing ?? _columnSpacing;

    final tableColumns = List<TableColumnWidth>.filled(
      columns.length + (displayCheckboxColumn ? 1 : 0),
      const _NullTableColumnWidth(),
    );

    final headingRow = _buildHeadingRow(
      context,
      theme,
      effectiveHeadingRowColor,
      tableColumns,
    );

    final tableRows = _buildTableRows(
      anyRowSelectable,
      effectiveDataRowColor,
      context,
      theme,
      defaultRowColor,
      tableColumns,
    );

    final builder = LayoutBuilder(
      builder: (context, constraints) {
        var displayColumnIndex = 0;

        // size & build checkboxes in heading and leftmost column
        // to be substracted from total width available to columns
        final checkBoxWidth = _addCheckBoxes(
          displayCheckboxColumn,
          effectiveHorizontalMargin,
          tableColumns,
          headingRow,
          context,
          someChecked,
          allChecked,
          tableRows,
          effectiveDataRowColor,
        );

        if (checkBoxWidth > 0) displayColumnIndex += 1;

        // size data columns
        final widths = _calculateDataColumnSizes(
          constraints,
          checkBoxWidth,
          effectiveHorizontalMargin,
        );

        for (int dataColumnIndex = 0;
            dataColumnIndex < columns.length;
            dataColumnIndex++) {
          final DataColumn column = columns[dataColumnIndex];

          final double paddingStart;
          if (dataColumnIndex == 0 && displayCheckboxColumn) {
            paddingStart = effectiveHorizontalMargin / 2.0;
          } else if (dataColumnIndex == 0 && !displayCheckboxColumn) {
            paddingStart = effectiveHorizontalMargin;
          } else {
            paddingStart = effectiveColumnSpacing / 2.0;
          }

          final double paddingEnd;
          if (dataColumnIndex == columns.length - 1) {
            paddingEnd = effectiveHorizontalMargin;
          } else {
            paddingEnd = effectiveColumnSpacing / 2.0;
          }

          final EdgeInsetsDirectional padding = EdgeInsetsDirectional.only(
            start: paddingStart,
            end: paddingEnd,
          );

          tableColumns[displayColumnIndex] =
              FixedColumnWidth(widths[dataColumnIndex]);

          headingRow.children![displayColumnIndex] = _buildHeadingCell(
            context: context,
            padding: padding,
            label: column.label,
            tooltip: column.tooltip,
            numeric: column.numeric,
            onSort: column.onSort != null
                ? () => column.onSort!(
                      dataColumnIndex,
                      sortColumnIndex != dataColumnIndex || !sortAscending,
                    )
                : null,
            sorted: dataColumnIndex == sortColumnIndex,
            ascending: sortAscending,
            overlayColor: effectiveHeadingRowColor,
          );

          var rowIndex = 0;
          for (final DataRow row in rows) {
            final DataCell cell = row.cells[dataColumnIndex];
            tableRows[rowIndex].children![displayColumnIndex] = _buildDataCell(
              context: context,
              padding: padding,
              specificRowHeight:
                  row is CustomDataRow ? row.specificRowHeight : null,
              label: cell.child,
              numeric: column.numeric,
              placeholder: cell.placeholder,
              showEditIcon: cell.showEditIcon,
              onTap: cell.onTap,
              onDoubleTap: cell.onDoubleTap,
              onLongPress: cell.onLongPress,
              onTapDown: cell.onTapDown,
              onTapCancel: cell.onTapCancel,
              onRowTap: row is CustomDataRow ? row.onTap : null,
              onRowDoubleTap: row is CustomDataRow ? row.onDoubleTap : null,
              onRowLongPress: row.onLongPress,
              onRowSecondaryTap:
                  row is CustomDataRow ? row.onSecondaryTap : null,
              onRowSecondaryTapDown:
                  row is CustomDataRow ? row.onSecondaryTapDown : null,
              onSelectChanged: row.onSelectChanged != null
                  ? () => row.onSelectChanged!(!row.selected)
                  : null,
              overlayColor: row.color ?? effectiveDataRowColor,
            );
            rowIndex += 1;
          }
          displayColumnIndex += 1;
        }

        final widthsAsMap = tableColumns.asMap();

        TableBorder? headingBorder;
        TableBorder? dataRowsBorder;

        if (border != null) {
          headingBorder = TableBorder(
            top: border!.top,
            left: border!.left,
            right: border!.right,
            bottom: border!.horizontalInside,
            verticalInside: border!.verticalInside,
          );
          dataRowsBorder = TableBorder(
            left: border!.left,
            right: border!.right,
            bottom: border!.bottom,
            verticalInside: border!.verticalInside,
            horizontalInside: border!.horizontalInside,
          );
        }

        final dataRows = Table(
          columnWidths: widthsAsMap,
          children: tableRows,
          border: dataRowsBorder,
        );

        final marginedTable = bottomMargin != null && bottomMargin! > 0
            ? Column(
                mainAxisSize: MainAxisSize.min,
                children: [dataRows, SizedBox(height: bottomMargin)],
              )
            : dataRows;

        final t = Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(
              height: 30,
            ),
            Table(
              columnWidths: widthsAsMap,
              children: [headingRow],
              border: headingBorder,
            ),
            if (showDivider)
              const Divider(
                thickness: 0.5,
                color: Colors.grey,
              ),
            Flexible(
              child: tableRows.isEmpty
                  ? empty ?? const SizedBox()
                  : SingleChildScrollView(
                      controller: scrollController,
                      child: marginedTable,
                    ),
            )
          ],
        );

        if (decoration != null) {
          return DecoratedBox(
            decoration: decoration!,
            child: t,
          );
        }

        return t;
      },
    );

    return builder;
  }

  double _addCheckBoxes(
    bool displayCheckboxColumn,
    double effectiveHorizontalMargin,
    List<TableColumnWidth> tableColumns,
    TableRow headingRow,
    BuildContext context,
    bool someChecked,
    bool allChecked,
    List<TableRow> tableRows,
    MaterialStateProperty<Color?>? effectiveDataRowColor,
  ) {
    double checkBoxWidth = 0;

    if (displayCheckboxColumn) {
      checkBoxWidth = effectiveHorizontalMargin +
          Checkbox.width +
          effectiveHorizontalMargin / 2.0;
      tableColumns[0] = FixedColumnWidth(checkBoxWidth);
      headingRow.children![0] = _buildCheckbox(
        context: context,
        checked: someChecked ? null : allChecked,
        onRowTap: null,
        onCheckboxChanged: (bool? checked) =>
            _handleSelectAll(checked, someChecked),
        overlayColor: null,
        tristate: true,
      );
      var rowIndex = 0;
      for (final DataRow row in rows) {
        tableRows[rowIndex].children![0] = _buildCheckbox(
          context: context,
          checked: row.selected,
          onRowTap: () => row.onSelectChanged?.call(!row.selected),
          onCheckboxChanged: row.onSelectChanged,
          overlayColor: row.color ?? effectiveDataRowColor,
          tristate: false,
        );
        rowIndex += 1;
      }
    }
    return checkBoxWidth;
  }

  List<double> _calculateDataColumnSizes(
    BoxConstraints constraints,
    double checkBoxWidth,
    double effectiveHorizontalMargin,
  ) {
    var totalColAvailableWidth = constraints.maxWidth;
    if (minWidth != null && totalColAvailableWidth < minWidth!) {
      totalColAvailableWidth = minWidth!;
    }

    // full margins are added to side column widths when no check box column is
    // present, half-margin added to first data column width is check box column
    // is present and full margin added to the right

    totalColAvailableWidth = totalColAvailableWidth -
        checkBoxWidth -
        effectiveHorizontalMargin -
        (checkBoxWidth > 0
            ? effectiveHorizontalMargin / 2
            : effectiveHorizontalMargin);

    final columnWidth = totalColAvailableWidth / columns.length;
    var totalColCalculatedWidth = 0.0;
    final totalFixedWidth = columns.fold<double>(
      0.0,
      (previousValue, element) =>
          previousValue +
          (element is CustomDataColumn && element.fixedWidth != null
              ? element.fixedWidth!
              : 0.0),
    );

    assert(
      totalFixedWidth < totalColAvailableWidth,
      "DataTable2, combined width of columns of fixed width is greater than availble parent width. Table will be clipped",
    );

    totalColAvailableWidth =
        math.max(0.0, totalColAvailableWidth - totalFixedWidth);

    // adjust column sizes relative to S, M, L
    final widths = List<double>.generate(columns.length, (i) {
      var w = columnWidth;
      final column = columns[i];
      if (column is CustomDataColumn) {
        if (column.fixedWidth != null) {
          w = column.fixedWidth!;
        } else if (column.size == ColumnSize.S) {
          w *= smRatio;
        } else if (column.size == ColumnSize.L) {
          w *= lmRatio;
        }
      }

      // skip fixed width columns
      if (!(column is CustomDataColumn && column.fixedWidth != null)) {
        totalColCalculatedWidth += w;
      }
      return w;
    });

    // scale columns to fit the total lemnght into available width

    final ratio = totalColAvailableWidth / totalColCalculatedWidth;
    for (var i = 0; i < widths.length; i++) {
      // skip fixed width column
      if (!(columns[i] is CustomDataColumn &&
          (columns[i] as CustomDataColumn).fixedWidth != null)) {
        widths[i] *= ratio;
      }
    }

    // add margins to side columns
    if (widths.length == 1) {
      widths[0] = math.max(
        0,
        widths[0] +
            effectiveHorizontalMargin +
            (checkBoxWidth > 0
                ? effectiveHorizontalMargin / 2
                : effectiveHorizontalMargin),
      );
    } else if (widths.length > 1) {
      widths[0] = math.max(
        0,
        widths[0] +
            (checkBoxWidth > 0
                ? effectiveHorizontalMargin / 2
                : effectiveHorizontalMargin),
      );
      widths[widths.length - 1] =
          math.max(0, widths[widths.length - 1] + effectiveHorizontalMargin);
    }
    return widths;
  }

  List<TableRow> _buildTableRows(
    bool anyRowSelectable,
    MaterialStateProperty<Color?>? effectiveDataRowColor,
    BuildContext context,
    ThemeData theme,
    MaterialStateProperty<Color?> defaultRowColor,
    List<TableColumnWidth> tableColumns,
  ) {
    final List<TableRow> tableRows = List<TableRow>.generate(
      rows.length,
      (int index) {
        final bool isSelected = rows[index].selected;
        final bool isDisabled =
            anyRowSelectable && rows[index].onSelectChanged == null;
        final Set<MaterialState> states = <MaterialState>{
          if (isSelected) MaterialState.selected,
          if (isDisabled) MaterialState.disabled,
        };
        final Color? resolvedDataRowColor =
            (rows[index].color ?? effectiveDataRowColor)?.resolve(states);
        final Color? rowColor = resolvedDataRowColor;
        final BorderSide borderSide = Divider.createBorderSide(
          context,
          width: dividerThickness ??
              theme.dataTableTheme.dividerThickness ??
              _dividerThickness,
        );
        final Border border = showBottomBorder
            ? Border(bottom: borderSide)
            : Border(top: borderSide);
        return TableRow(
          key: rows[index].key,
          decoration: BoxDecoration(
            border: border,
            color: rowColor ?? defaultRowColor.resolve(states),
          ),
          children:
              List<Widget>.filled(tableColumns.length, const _NullWidget()),
        );
      },
    );
    return tableRows;
  }

  TableRow _buildHeadingRow(
    BuildContext context,
    ThemeData theme,
    MaterialStateProperty<Color?>? effectiveHeadingRowColor,
    List<TableColumnWidth> tableColumns,
  ) {
    final headingRow = TableRow(
      key: _headingRowKey,
      decoration: BoxDecoration(
        border: showBottomBorder && border == null
            ? Border(
                bottom: Divider.createBorderSide(
                  context,
                  width: dividerThickness ??
                      theme.dataTableTheme.dividerThickness ??
                      _dividerThickness,
                ),
              )
            : null,
        color: effectiveHeadingRowColor?.resolve(<MaterialState>{}),
      ),
      children: List<Widget>.filled(tableColumns.length, const _NullWidget()),
    );
    return headingRow;
  }
}

class _SortArrow extends StatefulWidget {
  const _SortArrow({
    required this.visible,
    required this.up,
    required this.duration,
  });

  final bool visible;

  final bool? up;

  final Duration duration;

  @override
  _SortArrowState createState() => _SortArrowState();
}

class _SortArrowState extends State<_SortArrow> with TickerProviderStateMixin {
  late AnimationController _opacityController;
  late Animation<double> _opacityAnimation;

  late AnimationController _orientationController;
  late Animation<double> _orientationAnimation;
  double _orientationOffset = 0.0;

  bool? _up;

  static final Animatable<double> _turnTween =
      Tween<double>(begin: 0.0, end: math.pi)
          .chain(CurveTween(curve: Curves.easeIn));

  @override
  void initState() {
    super.initState();
    _up = widget.up;
    _opacityAnimation = CurvedAnimation(
      parent: _opacityController = AnimationController(
        duration: widget.duration,
        vsync: this,
      ),
      curve: Curves.fastOutSlowIn,
    )..addListener(_rebuild);
    _opacityController.value = widget.visible ? 1.0 : 0.0;
    _orientationController = AnimationController(
      duration: widget.duration,
      vsync: this,
    );
    _orientationAnimation = _orientationController.drive(_turnTween)
      ..addListener(_rebuild)
      ..addStatusListener(_resetOrientationAnimation);
    if (widget.visible) _orientationOffset = widget.up! ? 0.0 : math.pi;
  }

  void _rebuild() {
    setState(() {
      // The animations changed, so we need to rebuild.
    });
  }

  void _resetOrientationAnimation(AnimationStatus status) {
    if (status == AnimationStatus.completed) {
      assert(_orientationAnimation.value == math.pi);
      _orientationOffset += math.pi;
      _orientationController.value = 0.0;
    }
  }

  @override
  void didUpdateWidget(_SortArrow oldWidget) {
    super.didUpdateWidget(oldWidget);
    bool skipArrow = false;
    final bool? newUp = widget.up ?? _up;
    if (oldWidget.visible != widget.visible) {
      if (widget.visible &&
          (_opacityController.status == AnimationStatus.dismissed)) {
        _orientationController.stop();
        _orientationController.value = 0.0;
        _orientationOffset = newUp! ? 0.0 : math.pi;
        skipArrow = true;
      }
      if (widget.visible) {
        _opacityController.forward();
      } else {
        _opacityController.reverse();
      }
    }
    if ((_up != newUp) && !skipArrow) {
      if (_orientationController.status == AnimationStatus.dismissed) {
        _orientationController.forward();
      } else {
        _orientationController.reverse();
      }
    }
    _up = newUp;
  }

  @override
  void dispose() {
    _opacityController.dispose();
    _orientationController.dispose();
    super.dispose();
  }

  static const double _arrowIconBaselineOffset = -1.5;
  static const double _arrowIconSize = 16.0;

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: _opacityAnimation.value,
      child: Transform(
        transform:
            Matrix4.rotationZ(_orientationOffset + _orientationAnimation.value)
              ..setTranslationRaw(0.0, _arrowIconBaselineOffset, 0.0),
        alignment: Alignment.center,
        child: const Icon(
          Icons.arrow_upward,
          size: _arrowIconSize,
        ),
      ),
    );
  }
}

class _NullTableColumnWidth extends TableColumnWidth {
  const _NullTableColumnWidth();

  @override
  double maxIntrinsicWidth(Iterable<RenderBox> cells, double containerWidth) =>
      throw UnimplementedError();

  @override
  double minIntrinsicWidth(Iterable<RenderBox> cells, double containerWidth) =>
      throw UnimplementedError();
}

class _NullWidget extends Widget {
  const _NullWidget();

  @override
  Element createElement() => throw UnimplementedError();
}
