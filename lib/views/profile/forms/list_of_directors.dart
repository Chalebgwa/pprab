import 'package:flutter/material.dart';
import 'package:pprab/forms/validator.dart';
import 'package:pprab/models/directors_model.dart';
import 'package:pprab/views/profile/profile.dart';

class ListOfDirectorsForm extends ChangeNotifier {
  ListOfDirectorsForm() {
    addRow();
  }

  List<DirectorRow> rows = [];

  void addRow() {
    rows.add(DirectorRow(notifyListeners));
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

  // to model
  DirectorsList toModel() {
    return DirectorsList(
      directors: rows.map((row) => Director.fromJson(row.value)).toList(),
    );
  }

  // from json
  void setValue(Map<String, dynamic> value) {
    final data = value['data'] as List<dynamic>;
    rows = data
        .map(
          (row) => DirectorRow(notifyListeners)
            ..firstName = Validator(row['firstName'] as String, null)
            ..middleName = Validator(row['middleName'] as String, null)
            ..lastName = Validator(row['lastName'] as String, null)
            ..gender = Validator(row['gender'] as String, null)
            ..dob = Validator(row['dob'] as String, null),
        )
        .toList();
    notifyListeners();
  }

  ProfileStatus get status {
    if (isValid) {
      return ProfileStatus.complete;
    } else if (rows.isEmpty) {
      return ProfileStatus.incomplete;
    } else {
      return ProfileStatus.inprogress;
    }
  }
}

class DirectorRow {
  DirectorRow(this.notifyListeners);
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
    notifyListeners();
  }

  void validateDob(String value) {
    if (value.isEmpty) {
      dob = Validator(value, 'Please select an option');
    } else {
      dob = Validator(value, null);
    }
    notifyListeners();
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
