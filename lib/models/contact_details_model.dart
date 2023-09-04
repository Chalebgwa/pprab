class ContactInfoModel {
  final String firstName;
  final String middleName;
  final String lastName;
  final String dob;
  final String email;
  final String phone;
  final String telephone;
  final String businessPhone;
  final String country;
  final String district;
  final String village;
  final String pOBox;
  final String addressNo;
  final String addressLine1;
  final String addressLine2;

  final String secondaryFirstName;
  final String secondaryMiddleName;
  final String secondaryLastName;
  final String secondaryDob;
  final String secondaryEmail;
  final String secondaryPhone;
  final String secondaryTelephone;
  final String secondaryBusinessPhone;
  final String secondaryCountry;
  final String secondaryDistrict;
  final String secondaryVillage;
  final String secondaryPOBox;
  final String secondaryAddressNo;
  final String secondaryAddressLine1;
  final String secondaryAddressLine2;

  ContactInfoModel({
    required this.firstName,
    required this.middleName,
    required this.lastName,
    required this.dob,
    required this.email,
    required this.phone,
    required this.telephone,
    required this.businessPhone,
    required this.country,
    required this.district,
    required this.village,
    required this.pOBox,
    required this.addressNo,
    required this.addressLine1,
    required this.addressLine2,
    required this.secondaryFirstName,
    required this.secondaryMiddleName,
    required this.secondaryLastName,
    required this.secondaryDob,
    required this.secondaryEmail,
    required this.secondaryPhone,
    required this.secondaryTelephone,
    required this.secondaryBusinessPhone,
    required this.secondaryCountry,
    required this.secondaryDistrict,
    required this.secondaryVillage,
    required this.secondaryPOBox,
    required this.secondaryAddressNo,
    required this.secondaryAddressLine1,
    required this.secondaryAddressLine2,
  });

  Map<String, dynamic> toJson() {
    return {
      'firstName': firstName,
      'middleName': middleName,
      'lastName': lastName,
      'dob': dob,
      'email': email,
      'phone': phone,
      'telephone': telephone,
      'businessPhone': businessPhone,
      'country': country,
      'district': district,
      'village': village,
      'pOBox': pOBox,
      'addressNo': addressNo,
      'addressLine1': addressLine1,
      'addressLine2': addressLine2,
      'secondaryFirstName': secondaryFirstName,
      'secondaryMiddleName': secondaryMiddleName,
      'secondaryLastName': secondaryLastName,
      'secondaryDob': secondaryDob,
      'secondaryEmail': secondaryEmail,
      'secondaryPhone': secondaryPhone,
      'secondaryTelephone': secondaryTelephone,
      'secondaryBusinessPhone': secondaryBusinessPhone,
      'secondaryCountry': secondaryCountry,
      'secondaryDistrict': secondaryDistrict,
      'secondaryVillage': secondaryVillage,
      'secondaryPOBox': secondaryPOBox,
      'secondaryAddressNo': secondaryAddressNo,
      'secondaryAddressLine1': secondaryAddressLine1,
      'secondaryAddressLine2': secondaryAddressLine2,
    };
  }

  factory ContactInfoModel.fromJson(Map<String, dynamic> json) {
    return ContactInfoModel(
      firstName: json['firstName'] as String,
      middleName: json['middleName'] as String,
      lastName: json['lastName'] as String,
      dob: json['dob'] as String,
      email: json['email'] as String,
      phone: json['phone'] as String,
      telephone: json['telephone'] as String,
      businessPhone: json['businessPhone'] as String,
      country: json['country'] as String,
      district: json['district'] as String,
      village: json['village'] as String,
      pOBox: json['pOBox'] as String,
      addressNo: json['addressNo'] as String,
      addressLine1: json['addressLine1'] as String,
      addressLine2: json['addressLine2'] as String,
      secondaryFirstName: json['secondaryFirstName'] as String,
      secondaryMiddleName: json['secondaryMiddleName'] as String,
      secondaryLastName: json['secondaryLastName'] as String,
      secondaryDob: json['secondaryDob'] as String,
      secondaryEmail: json['secondaryEmail'] as String,
      secondaryPhone: json['secondaryPhone'] as String,
      secondaryTelephone: json['secondaryTelephone'] as String,
      secondaryBusinessPhone: json['secondaryBusinessPhone'] as String,
      secondaryCountry: json['secondaryCountry'] as String,
      secondaryDistrict: json['secondaryDistrict'] as String,
      secondaryVillage: json['secondaryVillage'] as String,
      secondaryPOBox: json['secondaryPOBox'] as String,
      secondaryAddressNo: json['secondaryAddressNo'] as String,
      secondaryAddressLine1: json['secondaryAddressLine1'] as String,
      secondaryAddressLine2: json['secondaryAddressLine2'] as String,
    );
  }
}
