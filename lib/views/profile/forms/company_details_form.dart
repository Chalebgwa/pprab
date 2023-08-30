import 'package:flutter/material.dart';
import 'package:pprab/forms/validator.dart';

class CompanyDetailsForm extends ChangeNotifier {
  Validator areYouAlocalProvider = Validator(null, null);
  Validator businessType = Validator(null, null);
  Validator businessName = Validator(null, null);
  Validator areYouRegisteredWithCipa = Validator(null, null);
  Validator dateOfRegistration = Validator(null, null);
  Validator ownership = Validator(null, null);
  Validator cipaRegistrationNumber = Validator(null, null);

  void validateCipaRegistrationNumber(String value) {
    if (value.isEmpty) {
      cipaRegistrationNumber =
          Validator(value, 'Please enter your CIPA registration number');
    } else {
      cipaRegistrationNumber = Validator(value, null);
    }
    notifyListeners();
  }

  void validateAreYouAlocalProvider(String value) {
    if (value.isEmpty) {
      areYouAlocalProvider = Validator(value, 'Please select an option');
    } else {
      areYouAlocalProvider = Validator(value, null);
    }
    notifyListeners();
  }

  void validateBusinessType(String value) {
    if (value.isEmpty) {
      businessType = Validator(value, 'Please select an option');
    } else {
      businessType = Validator(value, null);
    }
    notifyListeners();
  }

  void validateBusinessName(String value) {
    if (value.isEmpty) {
      businessName = Validator(value, 'Please enter your business name');
    } else {
      businessName = Validator(value, null);
    }

    notifyListeners();
  }

  void validateAreYouRegisteredWithCipa(String value) {
    if (value.isEmpty) {
      areYouRegisteredWithCipa = Validator(value, 'Please select an option');
    } else {
      areYouRegisteredWithCipa = Validator(value, null);
    }

    notifyListeners();
  }

  void validateDateOfRegistration(String value) {
    if (value.isEmpty) {
      dateOfRegistration =
          Validator(value, 'Please select your date of registration');
    } else {
      dateOfRegistration = Validator(value, null);
    }

    notifyListeners();
  }

  void validateOwnership(String value) {
    if (value.isEmpty) {
      ownership = Validator(value, 'Please select an option');
    } else {
      ownership = Validator(value, null);
    }

    notifyListeners();
  }

  bool get isValid {
    return areYouAlocalProvider.value != null &&
        businessType.value != null &&
        businessName.value != null &&
        areYouRegisteredWithCipa.value != null &&
        dateOfRegistration.value != null &&
        cipaRegistrationNumber.value != null &&
        ownership.value != null;
  }

  Map<String, dynamic> get data {
    return {
      'areYouAlocalProvider': areYouAlocalProvider.value,
      'businessType': businessType.value,
      'businessName': businessName.value,
      'areYouRegisteredWithCipa': areYouRegisteredWithCipa.value,
      'dateOfRegistration': dateOfRegistration.value,
      'ownership': ownership.value,
      'cipaRegistrationNumber': cipaRegistrationNumber.value,
    };
  }

  void reset() {
    areYouAlocalProvider = Validator(null, null);
    businessType = Validator(null, null);
    businessName = Validator(null, null);
    areYouRegisteredWithCipa = Validator(null, null);
    dateOfRegistration = Validator(null, null);
    ownership = Validator(null, null);
    cipaRegistrationNumber = Validator(null, null);
    notifyListeners();
  }
}
