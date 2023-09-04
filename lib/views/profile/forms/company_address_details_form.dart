import 'package:flutter/material.dart';
import 'package:pprab/forms/validator.dart';
import 'package:pprab/models/company_address_model.dart';
import 'package:pprab/views/profile/profile.dart';

class CompanyAddressDetailsForm extends ChangeNotifier {
  CompanyAddressDetailsForm();

  // update from json
  void updateFromJson(Map<String, dynamic> json) {
    if (json.isEmpty) return;
    country = Validator(json['country'] as String, null);
    city = Validator(json['city'] as String, null);
    district = Validator(json['district'] as String, null);
    plot = Validator(json['plot'] as String, null);
    street = Validator(json['street'] as String, null);
    notifyListeners();
  }

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

  CompanyAddressModel toModel() {
    return CompanyAddressModel(
      country: country.value ?? '',
      city: city.value ?? '',
      district: district.value ?? '',
      plot: plot.value ?? '',
      street: street.value ?? '',
    );
  }

  // to json
  Map<String, dynamic> toJson() => {
        'country': country.value,
        'city': city.value,
        'district': district.value,
        'plot': plot.value,
        'street': street.value,
      };

  // check status
  ProfileStatus get status {
    if (country.value != null &&
        city.value != null &&
        district.value != null &&
        plot.value != null &&
        street.value != null) {
      return ProfileStatus.complete;
    } else if (country.value != null ||
        city.value != null ||
        district.value != null ||
        plot.value != null ||
        street.value != null) {
      return ProfileStatus.incomplete;
    } else {
      return ProfileStatus.incomplete;
    }
  }
}
