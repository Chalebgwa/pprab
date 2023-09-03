import 'dart:math';

import 'package:faker/faker.dart';
import 'package:pprab/api_service/codes.dart';
import 'package:pprab/models/company_model.dart';
import 'package:pprab/util/villages.dart';

class ApiService {
  late List<CompanyInfo> companies;

  ApiService() {
    companies = createCompanyInfoList(100);
  }

  List<String> ownershipTypes = [
    "100% Citizen-owned JV's",
    '100% Citizen-owned associations/Consortia',
    '100% Citizen-owned Companies',
    "Majority Citizen-owned JV's",
    'Majority Citizen -owned associations/consortia',
    'Majority Citizen -owned companies',
    "Minority Citizen -owned JV's",
    'Minority Citizen-owned associations/consortia',
    'Minority Citizen -owned companies',
    '100% Foreign-owned Company',
  ];

  Future<List<CompanyInfo>> search(
    String? companyName,
    String? code,
    String? subcode,
    String? location,
    String? demographic,
    String? ownershipType,
  ) async {
    final data = (codes['categories'] as List<Map<String, dynamic>>);

    return companies.where((companyInfo) {
      // Check each field against the corresponding search criteria.
      final matchesCompanyName =
          companyName == null || companyInfo.companyName.contains(companyName);
      final matchesCode = code == null ||
          companyInfo.codes
              .any((c) => "${c['Code']} - ${c['Description']}" == code);
      final matchesSubcode = subcode == null ||
          companyInfo.codes.any(
            (c) => (c['Sub-codes'] as List).any(
              (element) =>
                  "${element['Sub-code']} - ${element['Description']}" ==
                  subcode,
            ),
          );
      final matchesLocation =
          location == null || companyInfo.location == location;
      // final matchesDemographic =
      //     demographic == null || companyInfo.demographic == demographic;
      final matchesOwnershipType =
          ownershipType == null || companyInfo.ownerShipType == ownershipType;

      // Return true if all specified criteria are met.
      return matchesCompanyName &&
          matchesCode &&
          matchesSubcode &&
          matchesLocation &&
          // matchesDemographic &&
          matchesOwnershipType;
    }).toList();
  }

  List<CompanyInfo> createCompanyInfoList(int length) {
    final data = codes['categories'] as List<Map<String, dynamic>>;
    final faker = Faker();
    final random = Random();
    final testCompanies = <CompanyInfo>[];

    for (var i = 0; i < length; i++) {
      final selectedCodes = <Map<String, dynamic>>[];
      final numberOfSelectedCodes = random.nextInt(5) + 1;

      for (var j = 0; j < numberOfSelectedCodes; j++) {
        final randomCodeIndex = random.nextInt(data.length);
        final selectedCode = data[randomCodeIndex];

        // Randomly select sub-codes
        final subCodes =
            selectedCode['Sub-codes'] as List<Map<String, dynamic>>;
        final selectedSubcodes = <Map<String, dynamic>>[];
        final numberOfSelectedSubcodes = random.nextInt(subCodes.length) + 1;

        for (var k = 0; k < numberOfSelectedSubcodes; k++) {
          final randomSubcodeIndex = random.nextInt(subCodes.length);
          selectedSubcodes.add(subCodes[randomSubcodeIndex]);
        }

        selectedCode['Sub-codes'] = selectedSubcodes;
        selectedCodes.add(selectedCode);
      }

      final companyInfo = CompanyInfo(
        companyName: faker.company.name(),
        contactFirstName: faker.person.firstName(),
        contactLastName: faker.person.lastName(),
        contactPhone: faker.randomGenerator.integer(100, min: 5).toString(),
        codes: selectedCodes,
        ownerShipType: faker.randomGenerator.element(ownershipTypes),
        location: faker.randomGenerator.element(places),
      );

      testCompanies.add(companyInfo);
    }

    return testCompanies;
  }
}
