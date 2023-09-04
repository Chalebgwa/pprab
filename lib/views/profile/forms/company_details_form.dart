import 'package:flutter/material.dart';
import 'package:pprab/forms/validator.dart';
import 'package:pprab/views/profile/profile.dart';

class CompanyDetailsForm extends ChangeNotifier {
  Validator areYouAlocalProvider = Validator(null, null);
  Validator businessType = Validator(null, null);
  Validator businessName = Validator(null, null);
  Validator areYouRegisteredWithCipa = Validator(null, null);
  Validator dateOfRegistration = Validator(null, null);
  Validator ownership = Validator(null, null);
  Validator cipaRegistrationNumber = Validator(null, null);
  Validator paymentType = Validator(null, null);

  void validatePaymentType(String value) {
    if (value.isEmpty) {
      paymentType = Validator(value, 'Please select an option');
    } else {
      paymentType = Validator(value, null);
    }
    notifyListeners();
  }

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
            areYouRegisteredWithCipa.value == 'Yes'
        ? cipaRegistrationNumber.value != null
        : true && paymentType.value != null && ownership.value != null;
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
      'paymentType': paymentType.value,
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
    paymentType = Validator(null, null);
    notifyListeners();
  }

  // return ProfileStatus
  ProfileStatus get status {
    // check if all fields are filled, or partially filled or not filled at all
    if (areYouAlocalProvider.value != null &&
        businessType.value != null &&
        businessName.value != null &&
        areYouRegisteredWithCipa.value != null &&
        dateOfRegistration.value != null &&
        cipaRegistrationNumber.value != null &&
        paymentType.value != null &&
        ownership.value != null) {
      return ProfileStatus.complete;
    } else if (areYouAlocalProvider.value != null ||
        businessType.value != null ||
        businessName.value != null ||
        areYouRegisteredWithCipa.value != null ||
        dateOfRegistration.value != null ||
        cipaRegistrationNumber.value != null ||
        paymentType.value != null ||
        ownership.value != null) {
      return ProfileStatus.inprogress;
    } else {
      return ProfileStatus.incomplete;
    }
  }

  void updateData(Map<String, dynamic> data) {
    if (data.isEmpty) {
      return;
    }
    areYouAlocalProvider =
        Validator(data['areYouAlocalProvider'] as String?, null);
    businessType = Validator(data['businessType'] as String?, null);
    businessName = Validator(data['businessName'] as String?, null);
    areYouRegisteredWithCipa =
        Validator(data['areYouRegisteredWithCipa'] as String?, null);
    dateOfRegistration = Validator(data['dateOfRegistration'] as String?, null);
    ownership = Validator(data['ownership'] as String?, null);
    cipaRegistrationNumber =
        Validator(data['cipaRegistrationNumber'] as String?, null);
    paymentType = Validator(data['paymentType'] as String?, null);
    notifyListeners();
  }
}
