import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:horizon/presentation/core/app_colors.dart';

class PasswordFormField extends HookWidget {
  final String hint;
  final Function(String) onChanged;
  final String? Function() validator;

  const PasswordFormField(this.hint, this.onChanged, this.validator, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final showPassword = useState(false);
    return TextFormField(
      decoration: InputDecoration(
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
        hintText: hint,
        suffixIcon: Padding(
          padding: const EdgeInsets.only(right: 4),
          child: GestureDetector(
            onTap: () => showPassword.value = !showPassword.value,
            child: Icon(
              showPassword.value
                  ? Icons.visibility_off_rounded
                  : Icons.visibility_rounded,
              color: Colors.white70,
            ),
          ),
        ),
      ),
      textInputAction: TextInputAction.done,
      autocorrect: false,
      obscureText: !showPassword.value,
      onChanged: (value) => onChanged(value),
      validator: (_) => validator(),
    );
  }
}
