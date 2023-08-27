import 'package:flutter/material.dart';
import 'package:pprab/forms/validator.dart';

class ContractorForm extends ChangeNotifier {
  Validator firstName = Validator(null, null);
  Validator lastName = Validator(null, null);
  Validator email = Validator(null, null);
  Validator password = Validator(null, null);
  Validator confirmPassword = Validator(null, null);
  Validator phoneNumber = Validator(null, null);

  // business information
  Validator businessName = Validator(null, null);

  // business type is a dropdown options are [Company , Business Name]
  Validator businessType = Validator(null, null);

  // displayed when business type is company
  Validator areYourRegisterdWithCipa = Validator(null, null);

  // displayed when business type is company
  Validator cipaNumber = Validator(null, null);

  // displayed when business type is business name
  Validator omang = Validator(null, null);

  // first name validator
  void validateFirstName(String value) {
    if (value.isEmpty) {
      firstName = Validator(null, 'First name is required');
    } else {
      firstName = Validator(value, null);
    }
    notifyListeners();
  }

  // last name validator
  void validateLastName(String value) {
    if (value.isEmpty) {
      lastName = Validator(null, 'Last name is required');
    } else {
      lastName = Validator(value, null);
    }
    notifyListeners();
  }

  // email validator
  void validateEmail(String value) {
    // use regex to validate email
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

    if (value.isEmpty) {
      email = Validator(null, 'Email is required');
    } else if (!emailRegex.hasMatch(value)) {
      email = Validator(null, 'Email is invalid');
    } else {
      email = Validator(value, null);
    }
    notifyListeners();
  }

  // password validator
  void validatePassword(String value) {
    if (value.isEmpty) {
      password = Validator(null, 'Password is required');
    } else if (value.length < 8) {
      password = Validator(null, 'Password must be at least 8 characters');
    } else {
      password = Validator(value, null);
    }
    notifyListeners();
  }

  // confirm password validator
  void validateConfirmPassword(String value) {
    if (value.isEmpty) {
      confirmPassword = Validator(null, 'Confirm password is required');
    } else if (value != password.value) {
      confirmPassword = Validator(null, 'Passwords do not match');
    } else {
      confirmPassword = Validator(value, null);
    }
    notifyListeners();
  }

  // phone number validator
  void validatePhoneNumber(String value) {
    if (value.isEmpty) {
      phoneNumber = Validator(null, 'Phone number is required');
    } else if (value.length < 8) {
      phoneNumber =
          Validator(null, 'Phone number must be at least 8 characters');
    } else {
      phoneNumber = Validator(value, null);
    }
    notifyListeners();
  }

  // business name validator

  void validateBusinessName(String value) {
    if (value.isEmpty) {
      businessName = Validator(null, 'Business name is required');
    } else {
      businessName = Validator(value, null);
    }
    notifyListeners();
  }

  // business type validator
  void validateBusinessType(String value) {
    if (value.isEmpty) {
      businessType = Validator(null, 'Business type is required');
    } else {
      businessType = Validator(value, null);
    }
    notifyListeners();
  }

  // are you registered with cipa validator
  void validateAreYouRegisteredWithCipa(String value) {
    if (value.isEmpty) {
      areYourRegisterdWithCipa = Validator(null, 'This field is required');
    } else {
      areYourRegisterdWithCipa = Validator(value, null);
    }
    notifyListeners();
  }

  // cipa number validator

  void validateCipaNumber(String value) {
    if (value.isEmpty) {
      cipaNumber = Validator(null, 'Cipa number is required');
    } else {
      cipaNumber = Validator(value, null);
    }
    notifyListeners();
  }

  // omang validator

  void validateOmang(String value) {
    // must be 9 digit number with [1,2] as the 5th number
    final omangRegex = RegExp(r'^[0-9]{2}[1-2][0-9]{6}$');

    if (value.isEmpty) {
      omang = Validator(null, 'Omang is required');
    } else if (!omangRegex.hasMatch(value)) {
      omang = Validator(null, 'Omang is invalid');
    } else {
      omang = Validator(value, null);
    }
    notifyListeners();
  }

  // check if the form is valid
  bool get isValid {
    return firstName.isValid &&
        lastName.isValid &&
        email.isValid &&
        password.isValid &&
        confirmPassword.isValid &&
        phoneNumber.isValid &&
        businessName.isValid &&
        businessType.isValid &&
        areYourRegisterdWithCipa.isValid &&
        cipaNumber.isValid &&
        omang.isValid;
  }

  // reset the form
  void reset() {
    firstName = Validator(null, null);
    lastName = Validator(null, null);
    email = Validator(null, null);
    password = Validator(null, null);
    confirmPassword = Validator(null, null);
    phoneNumber = Validator(null, null);
    businessName = Validator(null, null);
    businessType = Validator(null, null);
    areYourRegisterdWithCipa = Validator(null, null);
    cipaNumber = Validator(null, null);
    omang = Validator(null, null);
    notifyListeners();
  }

  // submit the form
  void submit() {
    if (isValid) {
      print('Form is valid');
    } else {
      print('Form is invalid');
    }
  }

  // to json
  Map<String, dynamic> toJson() => {
        'firstName': firstName.value,
        'lastName': lastName.value,
        'email': email.value,
        'password': password.value,
        'confirmPassword': confirmPassword.value,
        'phoneNumber': phoneNumber.value,
        'businessName': businessName.value,
        'businessType': businessType.value,
        'areYourRegisterdWithCipa': areYourRegisterdWithCipa.value,
        'cipaNumber': cipaNumber.value,
        'omang': omang.value,
      };
}
