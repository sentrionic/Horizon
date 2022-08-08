import 'package:flutter/material.dart';
import 'package:horizon/presentation/core/app_colors.dart';

class UpdateAccountFormField extends StatelessWidget {
  final String label;
  final String initialValue;
  final Function(String) onChanged;
  final String? Function() validator;

  const UpdateAccountFormField({
    super.key,
    required this.label,
    required this.initialValue,
    required this.onChanged,
    required this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        TextFormField(
          initialValue: initialValue,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            labelStyle: TextStyle(
              color: Colors.white70,
            ),
            filled: true,
            errorStyle: TextStyle(
              color: ThemeColors.errorRed,
            ),
          ),
          autocorrect: false,
          onChanged: (value) => onChanged(value),
          validator: (_) => validator(),
        ),
      ],
    );
  }
}
