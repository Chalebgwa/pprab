class BankDetails {
  BankDetails({required this.rows});

  // Create a BankDetails instance from a JSON map
  factory BankDetails.fromJson(Map<String, dynamic> json) {
    final rowList = (json['data'] ?? []) as List;
    final rows = rowList.map((rowData) {
      return BankRow.fromJson(rowData as Map<String, dynamic>);
    }).toList();

    return BankDetails(rows: rows);
  }
  List<BankRow> rows;

  // Convert a BankDetails instance to a JSON map
  Map<String, dynamic> toJson() {
    final rowList = rows.map((row) {
      return row.toJson();
    }).toList();

    return {
      'rows': rowList,
    };
  }

  // Create a copy of the BankDetails instance
  BankDetails copyWith({List<BankRow>? rows}) {
    return BankDetails(rows: rows ?? this.rows);
  }
}

class BankRow {
  BankRow({
    required this.nameOfBank,
    required this.branch,
    required this.accountNumber,
    required this.address,
    required this.accountType,
  });

  // Create a BankRow instance from a JSON map
  factory BankRow.fromJson(Map<String, dynamic> json) {
    return BankRow(
      nameOfBank: (json['nameOfBank'] ?? '').toString(),
      branch: (json['branch'] ?? '').toString(),
      accountNumber: (json['accountNumber'] ?? '').toString(),
      address: (json['address'] ?? '').toString(),
      accountType: (json['accountType'] ?? '').toString(),
    );
  }
  String nameOfBank;
  String branch;
  String accountNumber;
  String address;
  String accountType;

  // Convert a BankRow instance to a JSON map
  Map<String, String> toJson() {
    return {
      'nameOfBank': nameOfBank,
      'branch': branch,
      'accountNumber': accountNumber,
      'address': address,
      'accountType': accountType,
    };
  }

  // Create a copy of the BankRow instance
  BankRow copyWith({
    String? nameOfBank,
    String? branch,
    String? accountNumber,
    String? address,
    String? accountType,
  }) {
    return BankRow(
      nameOfBank: nameOfBank ?? this.nameOfBank,
      branch: branch ?? this.branch,
      accountNumber: accountNumber ?? this.accountNumber,
      address: address ?? this.address,
      accountType: accountType ?? this.accountType,
    );
  }
}
