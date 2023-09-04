import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pprab/models/bank_details_models.dart';
import 'package:pprab/models/company_address_model.dart';
import 'package:pprab/models/company_details_model.dart';
import 'package:pprab/models/contact_details_model.dart';
import 'package:pprab/models/directors_model.dart';
import 'package:pprab/views/profile/forms/company_details_form.dart';

class BusinessModel {
  BusinessModel({
    this.companyDetailsModel,
    this.companyAddressModel,
    this.contactInfoModel,
    this.bankDetailsModel,
    this.directorsList,
  });

  final CompanyDetailsModel? companyDetailsModel;
  final CompanyAddressModel? companyAddressModel;
  final ContactInfoModel? contactInfoModel;
  final BankDetails? bankDetailsModel;
  final DirectorsList? directorsList;

  Map<String, dynamic> toJson() {
    return {
      'companyDetailsModel': companyDetailsModel?.toMap(),
      'companyAddressModel': companyAddressModel?.toJson(),
      'contactInfoModel': contactInfoModel?.toJson(),
      'bankDetails': bankDetailsModel?.toJson(),
      'directorsList': directorsList?.toJson(),
    };
  }

  // from json
  BusinessModel.fromJson(Map<String, dynamic> json)
      : companyDetailsModel = json['companyDetailsModel'] != null
            ? CompanyDetailsModel.fromMap(
                json['companyDetailsModel'] as Map<String, dynamic>)
            : null,
        companyAddressModel = json['companyAddressModel'] != null
            ? CompanyAddressModel.fromJson(
                json['companyAddressModel'] as Map<String, dynamic>)
            : null,
        contactInfoModel = json['contactInfoModel'] != null
            ? ContactInfoModel.fromJson(
                json['contactInfoModel'] as Map<String, dynamic>)
            : null,
        bankDetailsModel = json['bankDetails'] != null
            ? BankDetails.fromJson(json['bankDetails'] as Map<String, dynamic>)
            : null,
        directorsList = json['directorsList'] != null
            ? DirectorsList.fromJson(
                json['directorsList'] as Map<String, dynamic>)
            : null;

  // copy with
  BusinessModel copyWith({
    CompanyDetailsModel? companyDetailsModel,
    CompanyAddressModel? companyAddressModel,
    ContactInfoModel? contactInfoModel,
    BankDetails? bankDetailsModel,
    DirectorsList? directorsList,
  }) {
    return BusinessModel(
      companyDetailsModel: companyDetailsModel ?? this.companyDetailsModel,
      companyAddressModel: companyAddressModel ?? this.companyAddressModel,
      contactInfoModel: contactInfoModel ?? this.contactInfoModel,
      bankDetailsModel: bankDetailsModel ?? this.bankDetailsModel,
      directorsList: directorsList ?? this.directorsList,
    );
  }
}
