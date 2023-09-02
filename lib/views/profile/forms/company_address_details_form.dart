import 'dart:js_interop';

import 'package:flutter/material.dart';
import 'package:pprab/forms/validator.dart';

class CompanyAddressDetailsForm extends ChangeNotifier {
  Validator country = Validator(null, null);
  Validator city = Validator(null, null);
  Validator district = Validator(null, null);
  Validator plot = Validator(null, null);
  Validator street = Validator(null, null);

  void validateCountry(String value) {
    if (value.isEmpty) {
      country = Validator(value, 'Please select an option');
    } else {
      country = Validator(value, null);
    }
    notifyListeners();
  }

  void validateCity(String value) {
    if (value.isEmpty) {
      city = Validator(value, 'Please select an option');
    } else {
      city = Validator(value, null);
    }
    notifyListeners();
  }

  void validateDistrict(String value) {
    if (value.isEmpty) {
      district = Validator(value, 'Please select an option');
    } else {
      district = Validator(value, null);
    }
    notifyListeners();
  }

  void validatePlot(String value) {
    if (value.isEmpty) {
      plot = Validator(value, 'Please enter your plot number');
    } else {
      plot = Validator(value, null);
    }

    notifyListeners();
  }

  void validateStreet(String value) {
    if (value.isEmpty) {
      street = Validator(value, 'Please enter your street name');
    } else {
      street = Validator(value, null);
    }

    notifyListeners();
  }

  bool get isValid {
    return country.value != null &&
        city.value != null &&
        district.value != null &&
        plot.value != null &&
        street.value != null;
  }

  void reset() {
    country = Validator(null, null);
    city = Validator(null, null);
    district = Validator(null, null);
    plot = Validator(null, null);
    street = Validator(null, null);
    notifyListeners();
  }

  // to json
  Map<String, dynamic> toJson() => {
        'country': country.value,
        'city': city.value,
        'district': district.value,
        'plot': plot.value,
        'street': street.value,
      };
}
