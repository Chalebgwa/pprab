import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pprab/util/dimensions.dart';
import 'package:pprab/views/profile/forms/company_details_form.dart';
import 'package:pprab/views/profile/widgets/breadcrumbs.dart';
import 'package:pprab/views/profile/widgets/label.dart';
import 'package:pprab/widgets/buttons.dart';
import 'package:pprab/widgets/inputs.dart';
import 'package:provider/provider.dart';
import 'package:responsive_ui/responsive_ui.dart';

class ProfileCompanyDetails extends StatelessWidget {
  const ProfileCompanyDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final form = context.watch<CompanyDetailsForm>();
    return Padding(
      padding: const EdgeInsets.all(46),
      child: Wrap(
        spacing: isDesktop(context) ? 146 : 20,
        runSpacing: isDesktop(context) ? 50 : 20,
        children: [
          const ProfileLabel(
              title: 'Company Details', icon: FontAwesomeIcons.store),
          Div(
            divison: const Division(
              colL: 5,
              colM: 12,
              colS: 12,
            ),
            child: CustomRadio(
              options: const ['Yes', 'No'],
              label: 'Are you a Local Provider/Contractor?',
              onChanged: form.validateAreYouAlocalProvider,
              value: form.areYouAlocalProvider.value,
            ),
          ),
          Div(
            divison: const Division(
              colL: 5,
              colM: 12,
              colS: 12,
            ),
            child: CustomDropdown(
              options: const ['Company', 'Business Name'],
              label: 'Select Business Type',
              onChanged: form.validateBusinessType,
              value: form.businessType.value,
            ),
          ),
          Div(
            divison: const Division(
              colL: 5,
              colM: 12,
              colS: 12,
            ),
            child: CustomRadio(
              options: const ['Yes', 'No'],
              label: 'Are you Registered with CIPA?',
              onChanged: form.validateAreYouRegisteredWithCipa,
              value: form.areYouRegisteredWithCipa.value,
            ),
          ),
          if (form.areYouRegisteredWithCipa.value == 'Yes')
            Div(
              divison: const Division(
                colL: 5,
                colM: 12,
                colS: 12,
              ),
              child: TextInput(
                label: 'CIPA Registration Number',
                onChanged: form.validateCipaRegistrationNumber,
                value: form.cipaRegistrationNumber.value,
                errorText: form.cipaRegistrationNumber.error,
              ),
            ),
          if (form.areYouRegisteredWithCipa.value == 'Yes')
            Div(
              divison: const Division(
                colL: 5,
                colM: 12,
                colS: 12,
              ),
              child: CustomDate(
                label: 'Date Of Registration',
                onChanged: form.validateDateOfRegistration,
                value: form.dateOfRegistration.value,
                errorText: form.dateOfRegistration.error,
              ),
            ),
          Div(
            divison: const Division(
              colL: 5,
              colM: 12,
              colS: 12,
            ),
            child: CustomDropdown(
              options: const ['Sole Proprietorship', 'Partnership', 'Company'],
              label: 'Ownership',
              onChanged: form.validateOwnership,
              value: form.ownership.value,
            ),
          ),
          Div(
            divison: const Division(
              colL: 12,
              colM: 12,
              colS: 12,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                FillButton(
                  onPressed: () {},
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
