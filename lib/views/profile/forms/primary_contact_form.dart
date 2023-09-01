import 'package:flutter/material.dart';
import 'package:pprab/forms/validator.dart';

class PrimaryContactForm extends ChangeNotifier {
  Validator firstName = Validator(null, null);
  Validator middleName = Validator(null, null);
  Validator lastName = Validator(null, null);
  Validator dob = Validator(null, null);
  Validator email = Validator(null, null);
  Validator phone = Validator(null, null);
  Validator telephone = Validator(null, null);
  Validator businessPhone = Validator(null, null);
  Validator country = Validator(null, null);
  Validator district = Validator(null, null);
  Validator village = Validator(null, null);
  Validator pOBox = Validator(null, null);
  Validator addressNo = Validator(null, null);
  Validator addressLine1 = Validator(null, null);
  Validator addressLine2 = Validator(null, null);

  // secondary contact
  Validator secondaryFirstName = Validator(null, null);
  Validator secondaryMiddleName = Validator(null, null);
  Validator secondaryLastName = Validator(null, null);
  Validator secondaryDob = Validator(null, null);
  Validator secondaryEmail = Validator(null, null);
  Validator secondaryPhone = Validator(null, null);
  Validator secondaryTelephone = Validator(null, null);
  Validator secondaryBusinessPhone = Validator(null, null);
  Validator secondaryCountry = Validator(null, null);
  Validator secondaryDistrict = Validator(null, null);
  Validator secondaryVillage = Validator(null, null);
  Validator secondaryPOBox = Validator(null, null);
  Validator secondaryAddressNo = Validator(null, null);
  Validator secondaryAddressLine1 = Validator(null, null);
  Validator secondaryAddressLine2 = Validator(null, null);

  void validateFirstName(String? value) {
    if (value == null || value.isEmpty) {
      firstName = Validator(null, 'First name is required');
    } else {
      firstName = Validator(value, null);
    }
    notifyListeners();
  }

  void validateMiddleName(String? value) {
    if (value == null || value.isEmpty) {
      middleName = Validator(null, 'Middle name is required');
    } else {
      middleName = Validator(value, null);
    }
    notifyListeners();
  }

  void validateLastName(String? value) {
    if (value == null || value.isEmpty) {
      lastName = Validator(null, 'Last name is required');
    } else {
      lastName = Validator(value, null);
    }
    notifyListeners();
  }

  void validateDob(String? value) {
    if (value == null || value.isEmpty) {
      dob = Validator(null, 'Date of birth is required');
    } else {
      dob = Validator(value, null);
    }
  }

  void validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      email = Validator(null, 'Email is required');
    } else {
      email = Validator(value, null);
    }
    notifyListeners();
  }

  void validatePhone(String? value) {
    if (value == null || value.isEmpty) {
      phone = Validator(null, 'Phone number is required');
    } else {
      phone = Validator(value, null);
    }
    notifyListeners();
  }

  void validateTelephone(String? value) {
    if (value == null || value.isEmpty) {
      telephone = Validator(null, 'Telephone number is required');
    } else {
      telephone = Validator(value, null);
    }
    notifyListeners();
  }

  void validateBusinessPhone(String? value) {
    if (value == null || value.isEmpty) {
      businessPhone = Validator(null, 'Business phone number is required');
    } else {
      businessPhone = Validator(value, null);
    }
    notifyListeners();
  }

  void validateCountry(String? value) {
    if (value == null || value.isEmpty) {
      country = Validator(null, 'Country is required');
    } else {
      country = Validator(value, null);
    }
    notifyListeners();
  }

  void validateDistrict(String? value) {
    if (value == null || value.isEmpty) {
      district = Validator(null, 'District is required');
    } else {
      district = Validator(value, null);
    }
    notifyListeners();
  }

  void validateVillage(String? value) {
    if (value == null || value.isEmpty) {
      village = Validator(null, 'Village is required');
    } else {
      village = Validator(value, null);
    }
    notifyListeners();
  }

  void validatePOBox(String? value) {
    if (value == null || value.isEmpty) {
      pOBox = Validator(null, 'P.O Box is required');
    } else {
      pOBox = Validator(value, null);
    }
    notifyListeners();
  }

  void validateAddressNo(String? value) {
    if (value == null || value.isEmpty) {
      addressNo = Validator(null, 'Address number is required');
    } else {
      addressNo = Validator(value, null);
    }
    notifyListeners();
  }

  void validateAddressLine1(String? value) {
    if (value == null || value.isEmpty) {
      addressLine1 = Validator(null, 'Address line 1 is required');
    } else {
      addressLine1 = Validator(value, null);
    }
    notifyListeners();
  }

  void validateAddressLine2(String? value) {
    if (value == null || value.isEmpty) {
      addressLine2 = Validator(null, 'Address line 2 is required');
    } else {
      addressLine2 = Validator(value, null);
    }
    notifyListeners();
  }

  // secondary contact

  void validateSecondaryFirstName(String? value) {
    if (value == null || value.isEmpty) {
      secondaryFirstName = Validator(null, 'First name is required');
    } else {
      secondaryFirstName = Validator(value, null);
    }
    notifyListeners();
  }

  void validateSecondaryMiddleName(String? value) {
    if (value == null || value.isEmpty) {
      secondaryMiddleName = Validator(null, 'Middle name is required');
    } else {
      secondaryMiddleName = Validator(value, null);
    }
    notifyListeners();
  }

  void validateSecondaryLastName(String? value) {
    if (value == null || value.isEmpty) {
      secondaryLastName = Validator(null, 'Last name is required');
    } else {
      secondaryLastName = Validator(value, null);
    }
    notifyListeners();
  }

  void validateSecondaryDob(String? value) {
    if (value == null || value.isEmpty) {
      secondaryDob = Validator(null, 'Date of birth is required');
    } else {
      secondaryDob = Validator(value, null);
    }
  }

  void validateSecondaryEmail(String? value) {
    if (value == null || value.isEmpty) {
      secondaryEmail = Validator(null, 'Email is required');
    } else {
      secondaryEmail = Validator(value, null);
    }
    notifyListeners();
  }

  void validateSecondaryPhone(String? value) {
    if (value == null || value.isEmpty) {
      secondaryPhone = Validator(null, 'Phone number is required');
    } else {
      secondaryPhone = Validator(value, null);
    }
    notifyListeners();
  }

  void validateSecondaryTelephone(String? value) {
    if (value == null || value.isEmpty) {
      secondaryTelephone = Validator(null, 'Telephone number is required');
    } else {
      secondaryTelephone = Validator(value, null);
    }
    notifyListeners();
  }

  void validateSecondaryBusinessPhone(String? value) {
    if (value == null || value.isEmpty) {
      secondaryBusinessPhone =
          Validator(null, 'Business phone number is required');
    } else {
      secondaryBusinessPhone = Validator(value, null);
    }
    notifyListeners();
  }

  void validateSecondaryCountry(String? value) {
    if (value == null || value.isEmpty) {
      secondaryCountry = Validator(null, 'Country is required');
    } else {
      secondaryCountry = Validator(value, null);
    }
    notifyListeners();
  }

  void validateSecondaryDistrict(String? value) {
    if (value == null || value.isEmpty) {
      secondaryDistrict = Validator(null, 'District is required');
    } else {
      secondaryDistrict = Validator(value, null);
    }
    notifyListeners();
  }

  void validateSecondaryVillage(String? value) {
    if (value == null || value.isEmpty) {
      secondaryVillage = Validator(null, 'Village is required');
    } else {
      secondaryVillage = Validator(value, null);
    }
    notifyListeners();
  }

  void validateSecondaryPOBox(String? value) {
    if (value == null || value.isEmpty) {
      secondaryPOBox = Validator(null, 'P.O Box is required');
    } else {
      secondaryPOBox = Validator(value, null);
    }
    notifyListeners();
  }

  void validateSecondaryAddressNo(String? value) {
    if (value == null || value.isEmpty) {
      secondaryAddressNo = Validator(null, 'Address number is required');
    } else {
      secondaryAddressNo = Validator(value, null);
    }
    notifyListeners();
  }

  void validateSecondaryAddressLine1(String? value) {
    if (value == null || value.isEmpty) {
      secondaryAddressLine1 = Validator(null, 'Address line 1 is required');
    } else {
      secondaryAddressLine1 = Validator(value, null);
    }
    notifyListeners();
  }

  void validateSecondaryAddressLine2(String? value) {
    if (value == null || value.isEmpty) {
      secondaryAddressLine2 = Validator(null, 'Address line 2 is required');
    } else {
      secondaryAddressLine2 = Validator(value, null);
    }
    notifyListeners();
  }

  bool get isValid {
    return firstName.value != null &&
        middleName.value != null &&
        lastName.value != null &&
        dob.value != null &&
        email.value != null &&
        phone.value != null &&
        telephone.value != null &&
        businessPhone.value != null &&
        country.value != null &&
        district.value != null &&
        village.value != null &&
        pOBox.value != null &&
        addressNo.value != null &&
        addressLine1.value != null &&
        addressLine2.value != null &&
        secondaryFirstName.value != null &&
        secondaryMiddleName.value != null &&
        secondaryLastName.value != null &&
        secondaryDob.value != null &&
        secondaryEmail.value != null &&
        secondaryPhone.value != null &&
        secondaryTelephone.value != null &&
        secondaryBusinessPhone.value != null &&
        secondaryCountry.value != null &&
        secondaryDistrict.value != null &&
        secondaryVillage.value != null &&
        secondaryPOBox.value != null &&
        secondaryAddressNo.value != null &&
        secondaryAddressLine1.value != null &&
        secondaryAddressLine2.value != null;
  }

  void reset() {
    firstName = Validator(null, null);
    middleName = Validator(null, null);
    lastName = Validator(null, null);
    dob = Validator(null, null);
    email = Validator(null, null);
    phone = Validator(null, null);
    telephone = Validator(null, null);
    businessPhone = Validator(null, null);
    country = Validator(null, null);
    district = Validator(null, null);
    village = Validator(null, null);
    pOBox = Validator(null, null);
    addressNo = Validator(null, null);
    addressLine1 = Validator(null, null);
    addressLine2 = Validator(null, null);
    secondaryFirstName = Validator(null, null);
    secondaryMiddleName = Validator(null, null);
    secondaryLastName = Validator(null, null);
    secondaryDob = Validator(null, null);
    secondaryEmail = Validator(null, null);
    secondaryPhone = Validator(null, null);
    secondaryTelephone = Validator(null, null);
    secondaryBusinessPhone = Validator(null, null);
    secondaryCountry = Validator(null, null);
    secondaryDistrict = Validator(null, null);
    secondaryVillage = Validator(null, null);
    secondaryPOBox = Validator(null, null);
    secondaryAddressNo = Validator(null, null);
    secondaryAddressLine1 = Validator(null, null);
    secondaryAddressLine2 = Validator(null, null);
  }

  Map<String, dynamic> toJson() {
    return {
      'firstName': firstName.value,
      'middleName': middleName.value,
      'lastName': lastName.value,
      'dob': dob.value,
      'email': email.value,
      'phone': phone.value,
      'telephone': telephone.value,
      'businessPhone': businessPhone.value,
      'country': country.value,
      'district': district.value,
      'village': village.value,
      'pOBox': pOBox.value,
      'addressNo': addressNo.value,
      'addressLine1': addressLine1.value,
      'addressLine2': addressLine2.value,
      'secondaryFirstName': secondaryFirstName.value,
      'secondaryMiddleName': secondaryMiddleName.value,
      'secondaryLastName': secondaryLastName.value,
      'secondaryDob': secondaryDob.value,
      'secondaryEmail': secondaryEmail.value,
      'secondaryPhone': secondaryPhone.value,
      'secondaryTelephone': secondaryTelephone.value,
      'secondaryBusinessPhone': secondaryBusinessPhone.value,
      'secondaryCountry': secondaryCountry.value,
      'secondaryDistrict': secondaryDistrict.value,
      'secondaryVillage': secondaryVillage.value,
      'secondaryPOBox': secondaryPOBox.value,
      'secondaryAddressNo': secondaryAddressNo.value,
      'secondaryAddressLine1': secondaryAddressLine1.value,
      'secondaryAddressLine2': secondaryAddressLine2.value,
    };
  }
}
