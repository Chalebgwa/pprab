import 'package:flutter/material.dart';
import 'package:pprab/forms/validator.dart';

class VehiclesAndEquipmentForm extends ChangeNotifier {
  Validator valueOfTotalCurrentAssets = Validator(null, null);
  Validator valueOfEquipments = Validator(null, null);
  Validator paidUpCapital = Validator(null, null);

  VehiclesAndEquipmentForm() {
    addVehicles();
    addPlantAndEquipment();
    addBuildingAndProperty();
    addOfficeEquipment();
  }

  List<Vehicles> vehicles = [];
  List<PlantAndEquipment> plantAndEquipment = [];
  List<BuildingAndProperty> buildingAndProperty = [];
  List<OfficeEquipment> officeEquipment = [];

  void addVehicles() {
    vehicles.add(Vehicles(notifyListeners));
    notifyListeners();
  }

  void removeVehicles(int index) {
    vehicles.removeAt(index);
    notifyListeners();
  }

  void addPlantAndEquipment() {
    plantAndEquipment.add(PlantAndEquipment(notifyListeners));
    notifyListeners();
  }

  void removePlantAndEquipment(int index) {
    plantAndEquipment.removeAt(index);
    notifyListeners();
  }

  void addBuildingAndProperty() {
    buildingAndProperty.add(BuildingAndProperty(notifyListeners));
    notifyListeners();
  }

  void removeBuildingAndProperty(int index) {
    buildingAndProperty.removeAt(index);
    notifyListeners();
  }

  void addOfficeEquipment() {
    officeEquipment.add(OfficeEquipment(notifyListeners));
    notifyListeners();
  }

  void removeOfficeEquipment(int index) {
    officeEquipment.removeAt(index);
    notifyListeners();
  }

  void validateValueOfTotalCurrentAssets(String value) {
    if (value.isEmpty) {
      valueOfTotalCurrentAssets =
          Validator(value, 'Please enter the value of total current assets');
    } else {
      valueOfTotalCurrentAssets = Validator(value, null);
    }

    notifyListeners();
  }

  void validateValueOfEquipments(String value) {
    if (value.isEmpty) {
      valueOfEquipments =
          Validator(value, 'Please enter the value of equipments');
    } else {
      valueOfEquipments = Validator(value, null);
    }

    notifyListeners();
  }

  void validatePaidUpCapital(String value) {
    if (value.isEmpty) {
      paidUpCapital = Validator(value, 'Please enter the paid up capital');
    } else {
      paidUpCapital = Validator(value, null);
    }

    notifyListeners();
  }

  bool get isValid {
    return vehicles.every((row) => row.isValid) &&
        plantAndEquipment.every((row) => row.isValid) &&
        buildingAndProperty.every((row) => row.isValid) &&
        officeEquipment.every((row) => row.isValid) &&
        valueOfTotalCurrentAssets.value != null &&
        valueOfEquipments.value != null &&
        paidUpCapital.value != null;
  }

  // to json

  Map<String, dynamic> get value {
    return {
      'vehicles': vehicles.map((row) => row.value).toList(),
      'plantAndEquipment': plantAndEquipment.map((row) => row.value).toList(),
      'buildingAndProperty':
          buildingAndProperty.map((row) => row.value).toList(),
      'officeEquipment': officeEquipment.map((row) => row.value).toList(),
      'valueOfTotalCurrentAssets': valueOfTotalCurrentAssets.value,
      'valueOfEquipments': valueOfEquipments.value,
      'paidUpCapital': paidUpCapital.value,
    };
  }
}

class Vehicles {
  Vehicles(this.notifyListeners);

  final void Function() notifyListeners;

  Validator registeredOwner = Validator(null, null);
  Validator registrationNumber = Validator(null, null);
  Validator ownership = Validator(null, null);
  Validator dateOfRegistration = Validator(null, null);
  Validator make = Validator(null, null);

  void validateRegisteredOwner(String value) {
    if (value.isEmpty) {
      registeredOwner = Validator(value, 'Please enter the registered owner');
    } else {
      registeredOwner = Validator(value, null);
    }

    notifyListeners();
  }

  void validateRegistrationNumber(String value) {
    if (value.isEmpty) {
      registrationNumber =
          Validator(value, 'Please enter the registration number');
    } else {
      registrationNumber = Validator(value, null);
    }

    notifyListeners();
  }

  void validateOwnership(String value) {
    if (value.isEmpty) {
      ownership = Validator(value, 'Please enter the ownership');
    } else {
      ownership = Validator(value, null);
    }

    notifyListeners();
  }

  void validateDateOfRegistration(String value) {
    if (value.isEmpty) {
      dateOfRegistration =
          Validator(value, 'Please enter the date of registration');
    } else {
      dateOfRegistration = Validator(value, null);
    }

    notifyListeners();
  }

  void validateMake(String value) {
    if (value.isEmpty) {
      make = Validator(value, 'Please enter the make');
    } else {
      make = Validator(value, null);
    }

    notifyListeners();
  }

  bool get isValid {
    return registeredOwner.value != null &&
        registrationNumber.value != null &&
        ownership.value != null &&
        dateOfRegistration.value != null &&
        make.value != null;
  }

  Map<String, dynamic> get value => {
        'registeredOwner': registeredOwner.value,
        'registrationNumber': registrationNumber.value,
        'ownership': ownership.value,
        'dateOfRegistration': dateOfRegistration.value,
        'make': make.value,
      };
}

class PlantAndEquipment {
  PlantAndEquipment(this.notfiyListeners);

  final void Function() notfiyListeners;

  Validator registeredOwner = Validator(null, null);
  Validator registrationNumber = Validator(null, null);
  Validator ownership = Validator(null, null);
  Validator dateOfPurchase = Validator(null, null);
  Validator description = Validator(null, null);

  void validateRegisteredOwner(String value) {
    if (value.isEmpty) {
      registeredOwner = Validator(value, 'Please enter the registered owner');
    } else {
      registeredOwner = Validator(value, null);
    }

    notfiyListeners();
  }

  void validateRegistrationNumber(String value) {
    if (value.isEmpty) {
      registrationNumber =
          Validator(value, 'Please enter the registration number');
    } else {
      registrationNumber = Validator(value, null);
    }

    notfiyListeners();
  }

  void validateOwnership(String value) {
    if (value.isEmpty) {
      ownership = Validator(value, 'Please enter the ownership');
    } else {
      ownership = Validator(value, null);
    }

    notfiyListeners();
  }

  void validateDateOfPurchase(String value) {
    if (value.isEmpty) {
      dateOfPurchase = Validator(value, 'Please enter the date of purchase');
    } else {
      dateOfPurchase = Validator(value, null);
    }

    notfiyListeners();
  }

  void validateDescription(String value) {
    if (value.isEmpty) {
      description = Validator(value, 'Please enter the description');
    } else {
      description = Validator(value, null);
    }

    notfiyListeners();
  }

  bool get isValid {
    return registeredOwner.value != null &&
        registrationNumber.value != null &&
        ownership.value != null &&
        dateOfPurchase.value != null &&
        description.value != null;
  }

  Map<String, dynamic> get value => {
        'registeredOwner': registeredOwner.value,
        'registrationNumber': registrationNumber.value,
        'ownership': ownership.value,
        'dateOfPurchase': dateOfPurchase.value,
        'description': description.value,
      };
}

class BuildingAndProperty {
  BuildingAndProperty(this.notifyListeners);

  final void Function() notifyListeners;

  Validator ownership = Validator(null, null);
  Validator locality = Validator(null, null);
  Validator presentValue = Validator(null, null);
  Validator attachments = Validator(null, null);

  void validateOwnership(String value) {
    if (value.isEmpty) {
      ownership = Validator(value, 'Please enter the ownership');
    } else {
      ownership = Validator(value, null);
    }

    notifyListeners();
  }

  void validateLocality(String value) {
    if (value.isEmpty) {
      locality = Validator(value, 'Please enter the locality');
    } else {
      locality = Validator(value, null);
    }

    notifyListeners();
  }

  void validateValue(String value) {
    if (value.isEmpty) {
      this.presentValue = Validator(value, 'Please enter the value');
    } else {
      this.presentValue = Validator(value, null);
    }

    notifyListeners();
  }

  void validateAttachments(String value) {
    if (value.isEmpty) {
      attachments = Validator(value, 'Please enter the attachments');
    } else {
      attachments = Validator(value, null);
    }

    notifyListeners();
  }

  bool get isValid {
    return ownership.value != null &&
        locality.value != null &&
        presentValue.value != null &&
        attachments.value != null;
  }

  Map<String, dynamic> get value => {
        'ownership': ownership.value,
        'locality': locality.value,
        'presentValue': presentValue.value,
        'attachments': attachments.value,
      };
}

class OfficeEquipment {
  OfficeEquipment(this.notifyListeners);

  final void Function() notifyListeners;

  Validator officeEquipment = Validator(null, null);
  Validator presentValue = Validator(null, null);
  Validator attachments = Validator(null, null);

  void validateOfficeEquipment(String value) {
    if (value.isEmpty) {
      officeEquipment = Validator(value, 'Please enter the office equipment');
    } else {
      officeEquipment = Validator(value, null);
    }

    notifyListeners();
  }

  void validateValue(String value) {
    if (value.isEmpty) {
      this.presentValue = Validator(value, 'Please enter the value');
    } else {
      this.presentValue = Validator(value, null);
    }

    notifyListeners();
  }

  void validateAttachments(String value) {
    if (value.isEmpty) {
      attachments = Validator(value, 'Please enter the attachments');
    } else {
      attachments = Validator(value, null);
    }

    notifyListeners();
  }

  bool get isValid {
    return officeEquipment.value != null &&
        presentValue.value != null &&
        attachments.value != null;
  }

  Map<String, dynamic> get value => {
        'officeEquipment': officeEquipment.value,
        'presentValue': presentValue.value,
        'attachments': attachments.value,
      };
}
