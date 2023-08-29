import 'package:cloud_firestore/cloud_firestore.dart';

class BusinessModel {
  BusinessModel({
    required this.representativeID,
    required this.businessName,
    required this.businessType,
    required this.areYouRegisteredWithCipa,
    required this.cipaNumber,
    required this.dateOfBusinessRegistration,
  });

  // from json
  factory BusinessModel.fromJson(Map<String, dynamic> json) {
    return BusinessModel(
      representativeID: json['representativeID'] as String,
      businessName: json['businessName'] as String,
      businessType: json['businessType'] as String,
      areYouRegisteredWithCipa: json['areYouRegisteredWithCipa'] as String,
      cipaNumber: json['cipaNumber'] as String,
      dateOfBusinessRegistration:
          json['dateOfBusinessRegistration'] as Timestamp,
    );
  }
  final String representativeID;
  final String businessName;
  final String businessType;
  final String areYouRegisteredWithCipa;
  final String cipaNumber;
  final Timestamp dateOfBusinessRegistration;

  Map<String, dynamic> toMap() {
    return {
      'representativeID': representativeID,
      'businessName': businessName,
      'businessType': businessType,
      'areYouRegisteredWithCipa': areYouRegisteredWithCipa,
      'cipaNumber': cipaNumber,
      'dateOfBusinessRegistration': dateOfBusinessRegistration,
    };
  }
}
