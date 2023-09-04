import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:pprab/controllers/auth_controller.dart';
import 'package:pprab/controllers/dashboard_controller.dart';
import 'package:pprab/models/business_model.dart';
import 'package:pprab/models/directors_model.dart';
import 'package:pprab/views/profile/forms/bank_details_form.dart';
import 'package:pprab/views/profile/forms/company_address_details_form.dart';
import 'package:pprab/views/profile/forms/company_details_form.dart';
import 'package:pprab/views/profile/forms/list_of_directors.dart';
import 'package:pprab/views/profile/forms/primary_contact_form.dart';
import 'package:pprab/widgets/buttons.dart';
import 'package:pprab/widgets/neumorph.dart';
import 'package:provider/provider.dart';

class BasicProfile extends StatelessWidget {
  const BasicProfile({super.key});

  @override
  Widget build(BuildContext context) {
    final auth = context.watch<Auth>();
    final dashboardController = context.watch<DashboardController>();
    final companyDetails = context.watch<CompanyDetailsForm>();
    final companyAddressDetails = context.watch<CompanyAddressDetailsForm>();
    final primaryContactForm = context.watch<PrimaryContactForm>();
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: NeumorphicContainer(
        child: Container(
          height: 279,
          color: Colors.transparent,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // dropdown

              Container(
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: DropdownButton<BusinessModel>(
                  value: auth.currentContractor?.companies?.isEmpty ?? true
                      ? null
                      : auth.selectedBusines,
                  isExpanded: true,
                  underline: SizedBox(),
                  hint: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                    ),
                    child: Text(
                      'Select Company',
                      style: GoogleFonts.inter(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  items: auth.currentContractor?.companies?.map((company) {
                        return DropdownMenuItem(
                          value: company,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                            ),
                            child: Text(
                              company.companyDetailsModel?.businessName ?? '',
                              style: GoogleFonts.inter(
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        );
                      }).toList() ??
                      [],
                  onChanged: (v) {
                    auth.selectBusiness(v);
                    dashboardController.setIndex(1);
                    companyDetails.updateData(
                      v?.companyDetailsModel?.toMap() ?? {},
                    );
                    companyAddressDetails.updateFromJson(
                      v?.companyAddressModel?.toJson() ?? {},
                    );
                    primaryContactForm.updateFromJson(
                      v?.contactInfoModel?.toJson() ?? {},
                    );
                    context.read<BankDetailsForm>().update(
                          v?.bankDetailsModel?.toJson() ?? {},
                        );
                    context.read<ListOfDirectorsForm>().setValue(
                          v?.directorsList?.toJson() ?? {},
                        );
                  },
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              Text(
                auth.currentContractor!.secretaryDirector,
                style: GoogleFonts.inter(
                  color: HexColor('#B3B3B3'),
                  fontSize: 14,
                  fontWeight: FontWeight.w300,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                auth.currentContractor!.firstName +
                    ' ' +
                    auth.currentContractor!.lastName,
                style: GoogleFonts.inter(
                  color: Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(
                height: 30,
              ),

              // email
              Text(
                'Email',
                style: GoogleFonts.inter(
                  color: HexColor('#B3B3B3'),
                  fontSize: 16,
                  fontWeight: FontWeight.w300,
                ),
              ),

              const SizedBox(
                height: 10,
              ),

              Text(
                'email@gmail.com',
                style: GoogleFonts.inter(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Spacer(),
              Row(
                children: [
                  Expanded(
                    child: FillButton(
                      onPressed: () {
                        dashboardController.setIndex(1);
                      },
                      text: 'COMPLETE PROFILE',
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
