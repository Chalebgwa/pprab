import 'package:flutter/material.dart';
import 'package:pprab/forms/validator.dart';

class DetailsOfSecretaryForm extends ChangeNotifier {
  Validator fullName = Validator(null, null);
  Validator nationality = Validator(null, null);
  Validator passportNumber = Validator(null, null);
  Validator homePhone = Validator(null, null);
  Validator businessPhone = Validator(null, null);
  Validator mobilePhone = Validator(null, null);
  Validator email = Validator(null, null);

  void validateFullName(String value) {
    if (value.isEmpty) {
      fullName = Validator(null, 'Full name is required');
    } else {
      fullName = Validator(value, null);
    }
    notifyListeners();
  }

  void validateNationality(String value) {
    if (value.isEmpty) {
      fullName = Validator(null, 'Nationality is required');
    } else {
      fullName = Validator(value, null);
    }
    notifyListeners();
  }

  void validatePassportNumber(String value) {
    if (value.isEmpty) {
      fullName = Validator(null, 'Passport number is required');
    } else {
      fullName = Validator(value, null);
    }
    notifyListeners();
  }

  void validateHomePhone(String value) {
    if (value.isEmpty) {
      fullName = Validator(null, 'Home phone is required');
    } else {
      fullName = Validator(value, null);
    }
    notifyListeners();
  }

  void validateBusinessPhone(String value) {
    if (value.isEmpty) {
      fullName = Validator(null, 'Business phone is required');
    } else {
      fullName = Validator(value, null);
    }
    notifyListeners();
  }

  void validateMobilePhone(String value) {
    if (value.isEmpty) {
      fullName = Validator(null, 'Mobile phone is required');
    } else {
      fullName = Validator(value, null);
    }
    notifyListeners();
  }

  void validateEmail(String value) {
    if (value.isEmpty) {
      fullName = Validator(null, 'Email is required');
    } else {
      fullName = Validator(value, null);
    }
    notifyListeners();
  }

  bool get isValid =>
      fullName.isValid &&
      nationality.isValid &&
      passportNumber.isValid &&
      homePhone.isValid &&
      businessPhone.isValid &&
      mobilePhone.isValid &&
      email.isValid;

  //to json
  Map<String, dynamic> get value => {
        'fullName': fullName.value,
        'nationality': nationality.value,
        'passportNumber': passportNumber.value,
        'homePhone': homePhone.value,
        'businessPhone': businessPhone.value,
        'mobilePhone': mobilePhone.value,
        'email': email.value,
      };
}
