import 'package:flutter/material.dart';
import 'package:horizon/presentation/core/app_colors.dart';

class AuthFormField extends StatelessWidget {
  final String hint;
  final IconData icon;
  final Function(String) onChanged;
  final String? Function() validator;

  const AuthFormField({
    super.key,
    required this.hint,
    required this.icon,
    required this.onChanged,
    required this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        hintText: hint,
        border: const UnderlineInputBorder(
          borderRadius: BorderRadius.zero,
          borderSide: BorderSide.none,
        ),
        fillColor: ThemeColors.inputBackground,
        labelStyle: const TextStyle(
          color: Colors.white70,
        ),
        filled: true,
        errorStyle: const TextStyle(
          color: ThemeColors.errorRed,
        ),
        suffixIcon: Padding(
          padding: const EdgeInsets.only(right: 4),
          child: Icon(
            icon,
            color: Colors.white70,
          ),
        ),
      ),
      autocorrect: false,
      textInputAction: TextInputAction.next,
      onChanged: (value) => onChanged(value),
      validator: (_) => validator(),
    );
  }
}
