import 'package:flutter/material.dart';
import 'package:pprab/forms/validator.dart';
import 'package:pprab/models/bank_details_models.dart';
import 'package:pprab/views/profile/profile.dart';

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

  // update from json
  void update(Map<String, dynamic> json) {
    if (json.isEmpty) {
      return;
    }

    rows = (json['data'] as List<dynamic>)
        .map((dynamic row) => BankDetailsRow(notifyListeners)
          ..nameOfBank = Validator(row['nameOfBank'] as String, null)
          ..branch = Validator(row['branch'] as String, null)
          ..accountNumber = Validator(row['accountNumber'] as String, null)
          ..address = Validator(row['address'] as String, null)
          ..accountType = Validator(row['accountType'] as String, null))
        .toList();
    notifyListeners();
  }

  ProfileStatus get status {
    // check inprogress
    if (rows.any((row) => row.nameOfBank.value == null)) {
      return ProfileStatus.inprogress;
    }
    if (rows.any((row) => row.branch.value == null)) {
      return ProfileStatus.inprogress;
    }
    if (rows.any((row) => row.accountNumber.value == null)) {
      return ProfileStatus.inprogress;
    }
    if (rows.any((row) => row.address.value == null)) {
      return ProfileStatus.inprogress;
    }
    if (rows.any((row) => row.accountType.value == null)) {
      return ProfileStatus.inprogress;
    }

    // check empty
    if (rows.any((row) => row.nameOfBank.value?.isEmpty ?? true)) {
      return ProfileStatus.incomplete;
    }
    if (rows.any((row) => row.branch.value?.isEmpty ?? true)) {
      return ProfileStatus.incomplete;
    }
    if (rows.any((row) => row.accountNumber.value?.isEmpty ?? true)) {
      return ProfileStatus.incomplete;
    }
    if (rows.any((row) => row.address.value?.isEmpty ?? true)) {
      return ProfileStatus.incomplete;
    }
    if (rows.any((row) => row.accountType.value?.isEmpty ?? true)) {
      return ProfileStatus.incomplete;
    }

    // check complete
    return ProfileStatus.complete;
  }

  BankDetails toModel() {
    return BankDetails(rows: rows.map((e) => e.toModel()).toList());
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

  BankRow toModel() {
    return BankRow(
      nameOfBank: nameOfBank.value ?? '',
      branch: branch.value ?? '',
      accountNumber: accountNumber.value ?? '',
      address: address.value ?? '',
      accountType: accountType.value ?? '',
    );
  }
}
