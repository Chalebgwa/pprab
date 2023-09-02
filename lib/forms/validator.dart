import 'dart:typed_data';

class Validator {
  Validator(this.value, this.error);

  final String? value;
  final String? error;

  bool get isValid => value != null && value!.isNotEmpty && error == null;
}

class FileValidator {
  FileValidator(this.value, this.error);

  final Uint8List? value;
  final String? error;

  bool get isValid => value != null && value!.isNotEmpty && error == null;
}
