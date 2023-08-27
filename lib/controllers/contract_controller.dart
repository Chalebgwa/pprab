import 'package:flutter/material.dart';

enum RegistrationStatus {
  initial,
  submitting,
  success,
  error,
}

class ContractorNotifier extends ChangeNotifier {
  final RegistrationStatus _status = RegistrationStatus.initial;
  RegistrationStatus get status => _status;
}
