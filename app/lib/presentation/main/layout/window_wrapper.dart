import 'package:flutter/material.dart';

import 'package:horizon/presentation/common/widgets/widget_sizes.dart';

class WindowWrapper extends StatelessWidget {
  final PreferredSizeWidget appBar;
  final ScrollController controller;
  final List<Widget> children;

  const WindowWrapper({
    super.key,
    required this.appBar,
    required this.controller,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: appBar,
      body: SizedBox(
        width: double.infinity,
        child: Scrollbar(
          thumbVisibility: true,
          controller: controller,
          child: ListView(
            padding: EdgeInsets.symmetric(
              horizontal: listViewPadding(context),
              vertical: 60.0,
            ),
            controller: controller,
            children: children,
          ),
        ),
      ),
    );
  }
}
