import 'package:cloud_firestore/cloud_firestore.dart';

class Client {
  Client({
    required this.uid,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.username,
    required this.secondaryEmail,
    required this.status,
    required this.type,
    required this.businessType,
    required this.businessName,
    required this.omang,
    required this.areYouRegisteredWithCIPA,
    required this.cipaRegistrationNumber,
    required this.cipaRegistrationDate,
    required this.createdAt,
    required this.category,
    required this.codes,
  });

  factory Client.fromJson(Map<String, dynamic> json) {
    return Client(
      uid: json['uid'] as String,
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      email: json['email'] as String,
      username: json['username'] as String,
      secondaryEmail: json['secondaryEmail'] as String,
      status: UserStatus.values[json['status'] as int],
      type: UserType.values[json['type'] as int],
      businessType: BusinessType.values[json['businessType'] as int],
      businessName: json['businessName'] as String,
      omang: json['omang'] as String,
      areYouRegisteredWithCIPA: json['areYouRegisteredWithCIPA'] as bool?,
      cipaRegistrationNumber: json['cipaRegistrationNumber'] as String?,
      cipaRegistrationDate: json['cipaRegistrationDate'] as Timestamp?,
      createdAt: json['createdAt'] as Timestamp?,
      category: json['category'] as String?,
      codes: json['codes'] as String?,
    );
  }
  final String uid;
  final String firstName;
  final String lastName;
  final String email;
  final String username;
  final String secondaryEmail;
  final UserStatus status;
  final UserType type;
  final BusinessType businessType;
  final String businessName;
  final String omang;
  final bool? areYouRegisteredWithCIPA;
  final String? cipaRegistrationNumber;
  final Timestamp? cipaRegistrationDate;
  final Timestamp? createdAt;
  final String? category;
  final String? codes;

  Map<String, dynamic> toMap() {
    return {
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'codes': codes,
      'username': username,
      'secondaryEmail': secondaryEmail,
      'status': status.index,
      'type': type.index,
      'businessType': businessType.index,
      'businessName': businessName,
      'omang': omang,
      'areYouRegisteredWithCIPA': areYouRegisteredWithCIPA,
      'cipaRegistrationNumber': cipaRegistrationNumber,
      'cipaRegistrationDate': cipaRegistrationDate,
      'createdAt': createdAt,
      'category': category,
    };
  }

  Client copyWith({
    String? uid,
    String? firstName,
    String? lastName,
    String? email,
    String? username,
    String? secondaryEmail,
    UserStatus? status,
    UserType? type,
    BusinessType? businessType,
    String? businessName,
    String? omang,
    String? codes,
    bool? areYouRegisteredWithCIPA,
    String? cipaRegistrationNumber,
    Timestamp? cipaRegistrationDate,
    Timestamp? createdAt,
    String? category,
  }) {
    return Client(
      uid: uid ?? this.uid,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      email: email ?? this.email,
      username: username ?? this.username,
      secondaryEmail: secondaryEmail ?? this.secondaryEmail,
      status: status ?? this.status,
      type: type ?? this.type,
      businessType: businessType ?? this.businessType,
      businessName: businessName ?? this.businessName,
      omang: omang ?? this.omang,
      codes: codes ?? this.codes,
      areYouRegisteredWithCIPA:
          areYouRegisteredWithCIPA ?? this.areYouRegisteredWithCIPA,
      cipaRegistrationNumber:
          cipaRegistrationNumber ?? this.cipaRegistrationNumber,
      cipaRegistrationDate: cipaRegistrationDate ?? this.cipaRegistrationDate,
      createdAt: createdAt ?? this.createdAt,
      category: category ?? this.category,
    );
  }
}

enum UserType {
  admin,
  contractor,
}

enum UserStatus {
  active,
  inactive,
  suspended,
  deleted,
}

enum BusinessType {
  business,
  company,
}
