import 'package:flutter/material.dart';

class TextInput extends StatelessWidget {
  const TextInput({
    required this.obscureText, super.key,
    this.label,
    this.initialValue,
    this.errorText,
    this.onChanged,
    this.value,
  });

  final String? label;
  final String? initialValue;
  final String? errorText;
  final bool obscureText;
  final void Function(String)? onChanged;
  final String? value;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: initialValue,
      decoration: InputDecoration(
        labelText: label,
        errorText: errorText,
      ),
      obscureText: obscureText,
      onChanged: onChanged,
    );
  }
}
