import 'package:flutter/material.dart';
import 'package:pprab/forms/validator.dart';
import 'package:pprab/views/profile/profile.dart';

class DetailsOfProjectsForm extends ChangeNotifier {
  DetailsOfProjectsForm() {
    rows.add(RowOfProject(notifyListeners));
  }
  List<RowOfProject> rows = [];

  ProfileStatus get status {
    if (isValid) {
      return ProfileStatus.complete;
    } else if (rows.any((row) => row.isValid)) {
      return ProfileStatus.inprogress;
    } else {
      return ProfileStatus.incomplete;
    }
  }

  void addRow() {
    rows.add(RowOfProject(notifyListeners));
    notifyListeners();
  }

  void removeRow(int index) {
    rows.removeAt(index);
    notifyListeners();
  }

  bool get isValid {
    return rows.every((row) => row.isValid);
  }

  void reset() {
    rows.forEach((row) => row.reset());
    notifyListeners();
  }

  List<Map<String, dynamic>> get data {
    return rows.map((row) => row.data).toList();
  }
}

class RowOfProject {
  RowOfProject(this.notifyListerners);
  final VoidCallback notifyListerners;

  Validator projectName = Validator(null, null);
  Validator ownership = Validator(null, null);
  Validator registrationNumber = Validator(null, null);
  Validator dateOfRegistration = Validator(null, null);
  Validator vehicleMake = Validator(null, null);

  void validateProjectName(String value) {
    if (value.isEmpty) {
      projectName = Validator(null, 'Project name is required');
    } else {
      projectName = Validator(value, null);
    }
    notifyListerners();
  }

  void validateOwnership(String value) {
    if (value.isEmpty) {
      ownership = Validator(null, 'Ownership is required');
    } else {
      ownership = Validator(value, null);
    }
    notifyListerners();
  }

  void validateRegistrationNumber(String value) {
    if (value.isEmpty) {
      registrationNumber = Validator(null, 'Registration number is required');
    } else {
      registrationNumber = Validator(value, null);
    }
    notifyListerners();
  }

  void validateDateOfRegistration(String value) {
    if (value.isEmpty) {
      dateOfRegistration = Validator(null, 'Date of registration is required');
    } else {
      dateOfRegistration = Validator(value, null);
    }
    notifyListerners();
  }

  void validateVehicleMake(String value) {
    if (value.isEmpty) {
      vehicleMake = Validator(null, 'Vehicle make is required');
    } else {
      vehicleMake = Validator(value, null);
    }
    notifyListerners();
  }

  bool get isValid {
    return projectName.value != null &&
        ownership.value != null &&
        registrationNumber.value != null &&
        dateOfRegistration.value != null &&
        vehicleMake.value != null;
  }

  void reset() {
    projectName = Validator(null, null);
    ownership = Validator(null, null);
    registrationNumber = Validator(null, null);
    dateOfRegistration = Validator(null, null);
    vehicleMake = Validator(null, null);
    notifyListerners();
  }

  Map<String, dynamic> get data {
    return {
      'projectName': projectName.value,
      'ownership': ownership.value,
      'registrationNumber': registrationNumber.value,
      'dateOfRegistration': dateOfRegistration.value,
      'vehicleMake': vehicleMake.value,
    };
  }
}
