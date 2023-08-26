import 'package:cloud_firestore/cloud_firestore.dart';

class Client {
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
  final String? omang;
  final bool? areYouRegisteredWithCIPA;
  final String? cipaRegistrationNumber;
  final Timestamp? cipaRegistrationDate;
  final Timestamp? createdAt;
  final String? category;
  final String? codes;

  Client(
    this.uid,
    this.firstName,
    this.lastName,
    this.email,
    this.username,
    this.secondaryEmail,
    this.status,
    this.type,
    this.businessType,
    this.businessName,
    this.omang,
    this.areYouRegisteredWithCIPA,
    this.cipaRegistrationNumber,
    this.cipaRegistrationDate,
    this.createdAt,
    this.category,
    this.codes,
  );

  Client.fromMap(Map<String, dynamic> data, String documentId)
      : uid = documentId,
        firstName = data['firstName'],
        lastName = data['lastName'],
        email = data['email'],
        username = data['username'],
        category = data['category'],
        secondaryEmail = data['secondaryEmail'],
        status = UserStatus.values[data['status']],
        type = UserType.values[data['type']],
        businessType = BusinessType.values[data['businessType']],
        businessName = data['businessName'],
        omang = data['omang'],
        codes = data['codes'],
        areYouRegisteredWithCIPA = data['areYouRegisteredWithCIPA'],
        cipaRegistrationNumber = data['cipaRegistrationNumber'],
        cipaRegistrationDate = data['cipaRegistrationDate'],
        createdAt = data['createdAt'];

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

  Client copyWith(
      {String? uid,
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
      String? category}) {
    return Client(
      uid ?? this.uid,
      firstName ?? this.firstName,
      lastName ?? this.lastName,
      email ?? this.email,
      username ?? this.username,
      secondaryEmail ?? this.secondaryEmail,
      status ?? this.status,
      type ?? this.type,
      businessType ?? this.businessType,
      businessName ?? this.businessName,
      omang ?? this.omang,
      areYouRegisteredWithCIPA ?? this.areYouRegisteredWithCIPA,
      cipaRegistrationNumber ?? this.cipaRegistrationNumber,
      cipaRegistrationDate ?? this.cipaRegistrationDate,
      createdAt ?? this.createdAt,
      category ?? this.category,
      codes ?? this.codes,
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
