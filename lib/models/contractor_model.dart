import 'package:pprab/models/business_model.dart';

class Contractor {
  final String firstName;
  final String lastName;
  final String email;
  final List<BusinessModel>? companies;
  final String phoneNumber;
  final String omang;
  final String secretaryDirector;
  final String? businessName;
  final String? businessType;
  final String areYouRegisteredWithCipa;
  final String? cipaNumber;

  Contractor({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phoneNumber,
    required this.omang,
    required this.secretaryDirector,
    required this.businessName,
    required this.businessType,
    required this.areYouRegisteredWithCipa,
    required this.cipaNumber,
    this.companies = const [],
  });

  Map<String, dynamic> toJson() {
    return {
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'phoneNumber': phoneNumber,
      'omang': omang,
      'secretaryDirector': secretaryDirector,
      'businessName': businessName,
      'businessType': businessType,
      'areYouRegisteredWithCipa': areYouRegisteredWithCipa,
      'cipaNumber': cipaNumber,
      'companies': companies,
    };
  }

  // from json
  Contractor.fromJson(Map<String, dynamic> json)
      : firstName = json['firstName'] as String,
        lastName = json['lastName'] as String,
        email = json['email'] as String,
        phoneNumber = json['phoneNumber'] as String,
        omang = json['omang'] as String,
        secretaryDirector = json['secretaryDirector'] as String,
        businessName = json['businessName'] as String?,
        businessType = json['businessType'] as String?,
        companies = json['companies'] != null
            ? (json['companies'] as List)
                .map<BusinessModel>(
                    (e) => BusinessModel.fromJson(e as Map<String, dynamic>))
                .toList()
            : null,
        areYouRegisteredWithCipa = json['areYouRegisteredWithCipa'] as String,
        cipaNumber = json['cipaNumber'] as String?;

  // copy with
  Contractor copyWith({
    String? firstName,
    String? lastName,
    String? email,
    List<BusinessModel>? companies,
    String? phoneNumber,
    String? omang,
    String? secretaryDirector,
    String? businessName,
    String? businessType,
    String? areYouRegisteredWithCipa,
    String? cipaNumber,
  }) {
    return Contractor(
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      email: email ?? this.email,
      companies: companies ?? this.companies,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      omang: omang ?? this.omang,
      secretaryDirector: secretaryDirector ?? this.secretaryDirector,
      businessName: businessName ?? this.businessName,
      businessType: businessType ?? this.businessType,
      areYouRegisteredWithCipa:
          areYouRegisteredWithCipa ?? this.areYouRegisteredWithCipa,
      cipaNumber: cipaNumber ?? this.cipaNumber,
    );
  }
}
