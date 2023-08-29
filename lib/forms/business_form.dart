import 'package:flutter/material.dart';
import 'package:pprab/forms/validator.dart';

class BusinessForm extends ChangeNotifier {
  Validator businessName = Validator(null, null);
  Validator businessType = Validator(null, null);
  Validator areYourRegisterdWithCipa = Validator(null, null);
  Validator cipaNumber = Validator(null, null);

  void validateBusinessName(String value) {
    if (value.isEmpty) {
      businessName = Validator(null, 'Business name is required');
    } else {
      businessName = Validator(value, null);
    }
    notifyListeners();
  }

  void validateBusinessType(String value) {
    if (value.isEmpty) {
      businessType = Validator(null, 'Business type is required');
    } else {
      businessType = Validator(value, null);
    }
    notifyListeners();
  }

  void validateAreYouRegisteredWithCipa(String value) {
    if (value.isEmpty) {
      areYourRegisterdWithCipa = Validator(null, 'This field is required');
    } else {
      areYourRegisterdWithCipa = Validator(value, null);
    }
    notifyListeners();
  }

  void validateCipaNumber(String value) {
    if (value.isEmpty) {
      cipaNumber = Validator(null, 'Cipa number is required');
    } else {
      cipaNumber = Validator(value, null);
    }
    notifyListeners();
  }

  bool get isValid =>
      businessName.isValid &&
      businessType.isValid &&
      areYourRegisterdWithCipa.isValid &&
      cipaNumber.isValid;

  // reset all validators
  void resetValidators() {
    businessName = Validator(null, null);
    businessType = Validator(null, null);
    areYourRegisterdWithCipa = Validator(null, null);
    cipaNumber = Validator(null, null);
    notifyListeners();
  }

  // submit form
  void submitForm() {
    if (isValid) {
      print('Form is valid');
    } else {
      print('Form is invalid');
    }
  }
}
