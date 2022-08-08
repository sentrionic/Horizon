import 'package:flutter/material.dart';

/// Wraps the [children] in a [Column] with some horizontal margin.
class FormWrapper extends StatelessWidget {
  final List<Widget> children;

  const FormWrapper({super.key, required this.children});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(50.0),
      child: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: Center(
          child: Column(
            children: children,
          ),
        ),
      ),
    );
  }
}
