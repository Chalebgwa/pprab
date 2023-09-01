import 'package:flutter/material.dart';
import 'package:pprab/forms/validator.dart';

class BankDetailsForm extends ChangeNotifier {
  BankDetailsForm() {
    addRow();
  }

  List<BankDetailsRow> rows = [];

  void addRow() {
    rows.add(BankDetailsRow(notifyListeners));
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

class BankDetailsRow {
  BankDetailsRow(this.notifyListeners);
  final void Function() notifyListeners;

  Validator nameOfBank = Validator(null, null);
  Validator branch = Validator(null, null);
  Validator accountNumber = Validator(null, null);
  Validator address = Validator(null, null);
  Validator accountType = Validator(null, null);

  void changeNameOfBank(String value) {
    if (value.isEmpty) {
      nameOfBank = Validator(null, 'Name of Bank is required');
    } else {
      nameOfBank = Validator(value, null);
    }
    notifyListeners();
  }

  void changeBranch(String value) {
    if (value.isEmpty) {
      branch = Validator(null, 'Branch is required');
    } else {
      branch = Validator(value, null);
    }
    notifyListeners();
  }

  void changeAccountNumber(String value) {
    if (value.isEmpty) {
      accountNumber = Validator(null, 'Account Number is required');
    } else {
      accountNumber = Validator(value, null);
    }
    notifyListeners();
  }

  void changeAddress(String value) {
    if (value.isEmpty) {
      address = Validator(null, 'Address is required');
    } else {
      address = Validator(value, null);
    }
    notifyListeners();
  }

  void changeAccountType(String value) {
    if (value.isEmpty) {
      accountType = Validator(null, 'Account Type is required');
    } else {
      accountType = Validator(value, null);
    }
    notifyListeners();
  }

  bool get isValid {
    return nameOfBank.value != null &&
        branch.value != null &&
        accountNumber.value != null &&
        address.value != null &&
        accountType.value != null;
  }

  Map<String, dynamic> get value {
    return {
      'nameOfBank': nameOfBank.value,
      'branch': branch.value,
      'accountNumber': accountNumber.value,
      'address': address.value,
      'accountType': accountType.value,
    };
  }
}
