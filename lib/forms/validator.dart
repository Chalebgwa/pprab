class Validator {
  Validator(this.value, this.error);

  final String? value;
  final String? error;

  bool get isValid => value != null && value!.isNotEmpty && error == null;
}
