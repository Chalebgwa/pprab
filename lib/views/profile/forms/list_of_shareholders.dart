import 'package:flutter/material.dart';
import 'package:pprab/forms/validator.dart';

class ListOfshareHoldersForm extends ChangeNotifier {
  ListOfshareHoldersForm() {
    addRow();
  }

  List<shareHolderRow> rows = [];

  void addRow() {
    rows.add(shareHolderRow(notifyListeners));
    notifyListeners();
  }

  void removeRow(int index) {
    rows.removeAt(index);
    notifyListeners();
  }

  bool get isValid {
    return rows.every((row) => row.isValid);
  }

  // to json
  Map<String, dynamic> get value {
    return {
      'data': rows.map((row) => row.value).toList(),
    };
  }
}

class shareHolderRow {
  shareHolderRow(this.notifyListeners);
  final void Function() notifyListeners;

  Validator firstName = Validator(null, null);
  Validator middleName = Validator(null, null);
  Validator lastName = Validator(null, null);
  Validator gender = Validator(null, null);
  Validator dob = Validator(null, null);

  void validateFirstName(String value) {
    if (value.isEmpty) {
      firstName = Validator(value, 'Please enter your first name');
    } else {
      firstName = Validator(value, null);
    }

    notifyListeners();
  }

  void validateMiddleName(String value) {
    if (value.isEmpty) {
      middleName = Validator(value, 'Please enter your middle name');
    } else {
      middleName = Validator(value, null);
    }

    notifyListeners();
  }

  void validateLastName(String value) {
    if (value.isEmpty) {
      lastName = Validator(value, 'Please enter your last name');
    } else {
      lastName = Validator(value, null);
    }

    notifyListeners();
  }

  void validateGender(String value) {
    if (value.isEmpty) {
      gender = Validator(value, 'Please select an option');
    } else {
      gender = Validator(value, null);
    }
  }

  void validateDob(String value) {
    if (value.isEmpty) {
      dob = Validator(value, 'Please select an option');
    } else {
      dob = Validator(value, null);
    }
  }

  Map<String, dynamic> get value => {
        'firstName': firstName.value,
        'middleName': middleName.value,
        'lastName': lastName.value,
        'gender': gender.value,
        'dob': dob.value,
      };

  bool get isValid =>
      firstName.isValid &&
      middleName.isValid &&
      lastName.isValid &&
      gender.isValid &&
      dob.isValid;
}
