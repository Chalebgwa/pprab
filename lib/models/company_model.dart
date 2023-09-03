class CompanyInfo {
  CompanyInfo({
    required this.companyName,
    required this.contactFirstName,
    required this.contactLastName,
    required this.contactPhone,
    required this.codes,
    required this.ownerShipType,
    required this.location,
  });
  final String companyName;
  final String contactFirstName;
  final String contactLastName;
  final String contactPhone;
  final List<Map<String, dynamic>> codes;
  final String ownerShipType;
  final String location;
}
