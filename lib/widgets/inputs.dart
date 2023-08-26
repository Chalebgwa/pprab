import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class TextInput extends StatelessWidget {
  const TextInput({
    super.key,
    this.label,
    this.initialValue,
    this.errorText,
    required this.obscureText,
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
