import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:pprab/models/company_model.dart';
import 'package:pprab/widgets/neumorph.dart';

class ResultDialog extends StatelessWidget {
  const ResultDialog({required this.results, super.key});

  final List<CompanyInfo> results;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(100.0),
      child: Material(
        child: SingleChildScrollView(
          child: Column(
            children: [
              for (CompanyInfo companyInfo in results)
                CompanyItem(companyInfo: companyInfo)
            ],
          ),
        ),
      ),
    );
  }
}

class CompanyItem extends StatelessWidget {
  const CompanyItem({required this.companyInfo, super.key});
  final CompanyInfo companyInfo;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: NeumorphicContainer(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                '${companyInfo.companyName}',
                style: GoogleFonts.inter(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.location_on,
                      color: HexColor('#3D99BE'),
                    ),
                  ),
                  Text(
                    '${companyInfo.location}',
                    style: GoogleFonts.inter(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
            // row of location and icon
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Contact Name: ${companyInfo.contactFirstName} ${companyInfo.contactLastName}',
                style: GoogleFonts.inter(
                  fontWeight: FontWeight.normal,
                  fontSize: 16,
                ),
              ),
            ),
            // owner ship type
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Ownership Type: ${companyInfo.ownerShipType}',
                style: GoogleFonts.inter(
                  fontWeight: FontWeight.normal,
                  fontSize: 16,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Contact Phone: ${companyInfo.contactPhone}',
                style: GoogleFonts.inter(
                  fontWeight: FontWeight.normal,
                  fontSize: 16,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Ownership Type: ${companyInfo.ownerShipType}',
                style: GoogleFonts.inter(
                  fontWeight: FontWeight.normal,
                  fontSize: 16,
                ),
              ),
            ),
            // Padding(
            //   padding: const EdgeInsets.all(8.0),
            //   child: Text(
            //     'Codes:',
            //     style: GoogleFonts.inter(
            //       fontWeight: FontWeight.bold,
            //       fontSize: 16,
            //     ),
            //   ),
            // ),
            SizedBox(height: 10),
            Divider(),
            for (var code in companyInfo.codes)
              ListBody(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Code: ${code['Code']}',
                      style: GoogleFonts.inter(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Description: ${code['Description']}',
                      style: GoogleFonts.inter(
                        fontWeight: FontWeight.normal,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Sub-codes:',
                    ),
                  ),
                  Wrap(
                    children: [
                      for (var subCode
                          in code['Sub-codes'] as List<Map<String, dynamic>>)
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Chip(
                            backgroundColor: HexColor('#3D99BE'),
                            side: BorderSide.none,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                              side: BorderSide.none,
                            ),
                            label: Text(
                              "${subCode['Sub-code']} ${subCode['Description']}",
                              style: GoogleFonts.inter(
                                fontWeight: FontWeight.normal,
                                fontSize: 16,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Divider()
                ],
              ),
          ],
        ),
      ),
    );
  }
}
