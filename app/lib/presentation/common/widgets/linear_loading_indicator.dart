import 'package:flutter/material.dart';

/// Indeterminate linear loading indicator with top spacing.
class LinearLoadingIndicator extends StatelessWidget {
  const LinearLoadingIndicator({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: const [
        SizedBox(height: 15),
        LinearProgressIndicator(
          color: Colors.white,
        ),
      ],
    );
  }
}
