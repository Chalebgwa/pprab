import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pprab/controllers/auth_controller.dart';
import 'package:pprab/controllers/dashboard_controller.dart';
import 'package:pprab/models/business_model.dart';
import 'package:pprab/models/company_address_model.dart';
import 'package:pprab/util/dimensions.dart';
import 'package:pprab/util/districts.dart';
import 'package:pprab/util/villages.dart';
import 'package:pprab/views/profile/forms/company_address_details_form.dart';
import 'package:pprab/views/profile/forms/company_details_form.dart';
import 'package:pprab/views/profile/widgets/breadcrumbs.dart';
import 'package:pprab/views/profile/widgets/label.dart';
import 'package:pprab/widgets/buttons.dart';
import 'package:pprab/widgets/inputs.dart';
import 'package:provider/provider.dart';
import 'package:responsive_ui/responsive_ui.dart';

class CompanyAddressDetails extends StatelessWidget {
  const CompanyAddressDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final form = context.watch<CompanyAddressDetailsForm>();
    final auth = context.watch<Auth>();
    final dashBoard = context.watch<DashboardController>();
    return Padding(
      padding: const EdgeInsets.all(46),
      child: Wrap(
        spacing: isDesktop(context) ? 146 : 20,
        runSpacing: isDesktop(context) ? 50 : 20,
        children: [
          const ProfileLabel(
            title: 'Company Address Details',
            icon: FontAwesomeIcons.locationDot,
          ),
          Div(
            divison: const Division(
              colL: 5,
              colM: 12,
              colS: 12,
            ),
            child: CustomDropdown(
              options: countries,
              label: 'Country',
              onChanged: form.validateCountry,
              value: form.country.value,
            ),
          ),
          Div(
            divison: const Division(
              colL: 5,
              colM: 12,
              colS: 12,
            ),
            child: CustomDropdown(
              options: districts,
              label: 'District',
              onChanged: form.validateDistrict,
              value: form.district.value,
            ),
          ),
          Div(
            divison: const Division(
              colL: 5,
              colM: 12,
              colS: 12,
            ),
            child: CustomDropdown(
              options: places,
              label: 'Village/ Town/ City',
              onChanged: form.validateCity,
              value: form.city.value,
            ),
          ),
          Div(
            divison: const Division(
              colL: 5,
              colM: 12,
              colS: 12,
            ),
            child: TextInput(
              label: 'Plot/ Unit No:',
              onChanged: form.validatePlot,
              value: form.plot.value,
              errorText: form.plot.error,
            ),
          ),
          Div(
            divison: const Division(
              colL: 5,
              colM: 12,
              colS: 12,
            ),
            child: TextInput(
              label: 'Street/ Locality/ Ward:',
              onChanged: form.validateStreet,
              value: form.street.value,
              errorText: form.street.error,
            ),
          ),
          Div(
            divison: const Division(
              colL: 5,
              colM: 12,
              colS: 12,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                FillButton(
                  onPressed: () {
                    if (form.isValid) {
                      final businessModel = auth.selectedBusines;

                      final newBusinessModel = businessModel?.copyWith(
                            companyAddressModel: form.toModel(),
                          ) ??
                          BusinessModel(
                            companyAddressModel: form.toModel(),
                          );

                      // replace the old business model with the new one
                      if (newBusinessModel != null) {
                        auth.updateBusinessModel(newBusinessModel);
                        dashBoard.setSelectedBreadcrumbIndex(3);
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            backgroundColor: Colors.green,
                            content: Text('Company Address Details Saved'),
                          ),
                        );
                      }
                    }
                  },
                  text: 'Done',
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
