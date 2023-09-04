import 'package:flutter/material.dart';
import 'package:pprab/forms/validator.dart';
import 'package:pprab/views/profile/profile.dart';

class ListOfEmployeesForm extends ChangeNotifier {
  ListOfEmployeesForm() {
    addRow();
  }

  Validator totalNumberOfBotsswanaEmployees = Validator(null, null);
  Validator totalNumberOfExpatriateEmployees = Validator(null, null);
  Validator totalNumberOfEmployees = Validator(null, null);

  List<EmployeeRow> rows = [];

  ProfileStatus get status {
    if (isValid) {
      return ProfileStatus.complete;
    } else if (rows.any((row) => row.isValid)) {
      return ProfileStatus.inprogress;
    } else {
      return ProfileStatus.incomplete;
    }
  }

  void changeTotalNumberOfBotsswanaEmployees(String value) {
    if (value.isEmpty) {
      totalNumberOfBotsswanaEmployees =
          Validator(null, 'Total number of Botsswana employees is required');
    } else {
      totalNumberOfBotsswanaEmployees = Validator(value, null);
    }
    notifyListeners();
  }

  void changeTotalNumberOfExpatriateEmployees(String value) {
    if (value.isEmpty) {
      totalNumberOfExpatriateEmployees =
          Validator(null, 'Total number of Expatriate employees is required');
    } else {
      totalNumberOfExpatriateEmployees = Validator(value, null);
    }
    notifyListeners();
  }

  void changeTotalNumberOfEmployees(String value) {
    if (value.isEmpty) {
      totalNumberOfEmployees =
          Validator(null, 'Total number of employees is required');
    } else {
      totalNumberOfEmployees = Validator(value, null);
    }
    notifyListeners();
  }

  void addRow() {
    rows.add(EmployeeRow(notifyListeners));
    notifyListeners();
  }

  void removeRow(int index) {
    rows.removeAt(index);
    notifyListeners();
  }

  bool get isValid {
    return rows.every((row) => row.isValid) &&
        totalNumberOfBotsswanaEmployees.isValid &&
        totalNumberOfExpatriateEmployees.isValid &&
        totalNumberOfEmployees.isValid;
  }

  // to json
  Map<String, dynamic> get value {
    return {
      'employees': rows.map((row) => row.value).toList(),
      'totalNumberOfBotsswanaEmployees': totalNumberOfBotsswanaEmployees.value,
      'totalNumberOfExpatriateEmployees':
          totalNumberOfExpatriateEmployees.value,
      'totalNumberOfEmployees': totalNumberOfEmployees.value,
    };
  }
}

class EmployeeRow {
  EmployeeRow(this.notifyListeners);
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
