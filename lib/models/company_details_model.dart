class CompanyDetailsModel {
  CompanyDetailsModel({
    required this.areYouAlocalProvider,
    required this.businessType,
    required this.businessName,
    required this.areYouRegisteredWithCipa,
    required this.dateOfRegistration,
    required this.ownership,
    required this.cipaRegistrationNumber,
    required this.paymentType,
  });

  factory CompanyDetailsModel.fromMap(Map<String, dynamic> map) {
    return CompanyDetailsModel(
      areYouAlocalProvider: map['areYouAlocalProvider'] as String,
      businessType: map['businessType'] as String,
      businessName: map['businessName'] as String,
      areYouRegisteredWithCipa: map['areYouRegisteredWithCipa'] as String,
      dateOfRegistration: map['dateOfRegistration'] as String,
      ownership: map['ownership'] as String,
      cipaRegistrationNumber: map['cipaRegistrationNumber'] as String,
      paymentType: map['paymentType'] as String,
    );
  }
  final String areYouAlocalProvider;
  final String businessType;
  final String businessName;
  final String areYouRegisteredWithCipa;
  final String dateOfRegistration;
  final String ownership;
  final String cipaRegistrationNumber;
  final String paymentType;

  Map<String, dynamic> toMap() {
    return {
      'areYouAlocalProvider': areYouAlocalProvider,
      'businessType': businessType,
      'businessName': businessName,
      'areYouRegisteredWithCipa': areYouRegisteredWithCipa,
      'dateOfRegistration': dateOfRegistration,
      'ownership': ownership,
      'cipaRegistrationNumber': cipaRegistrationNumber,
      'paymentType': paymentType,
    };
  }
}
