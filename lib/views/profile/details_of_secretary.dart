import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pprab/util/dimensions.dart';
import 'package:pprab/util/districts.dart';
import 'package:pprab/util/villages.dart';
import 'package:pprab/views/profile/forms/company_address_details_form.dart';
import 'package:pprab/views/profile/forms/company_details_form.dart';
import 'package:pprab/views/profile/forms/details_of_secretary.dart';
import 'package:pprab/views/profile/widgets/breadcrumbs.dart';
import 'package:pprab/views/profile/widgets/label.dart';
import 'package:pprab/widgets/buttons.dart';
import 'package:pprab/widgets/inputs.dart';
import 'package:provider/provider.dart';
import 'package:responsive_ui/responsive_ui.dart';

class DetailsOfSecretary extends StatelessWidget {
  const DetailsOfSecretary({super.key});

  @override
  Widget build(BuildContext context) {
    final form = context.watch<DetailsOfSecretaryForm>();
    return Padding(
      padding: const EdgeInsets.all(46),
      child: Wrap(
        spacing: isDesktop(context) ? 146 : 20,
        runSpacing: isDesktop(context) ? 50 : 20,
        children: [
          const ProfileLabel(
            title: 'Details Of Secretary',
            icon: FontAwesomeIcons.alignLeft,
          ),
          Div(
            divison: const Division(
              colL: 5,
              colM: 12,
              colS: 12,
            ),
            child: TextInput(
              label: 'Full Name',
              onChanged: form.validateFullName,
              value: form.fullName.value,
              errorText: form.fullName.error,
            ),
          ),
          Div(
            divison: const Division(
              colL: 5,
              colM: 12,
              colS: 12,
            ),
            child: TextInput(
              errorText: form.nationality.error,
              label: 'Nationality',
              onChanged: form.validateNationality,
              value: form.nationality.value,
            ),
          ),
          Div(
            divison: const Division(
              colL: 5,
              colM: 12,
              colS: 12,
            ),
            child: TextInput(
              errorText: form.passportNumber.error,
              label: 'Passport No',
              onChanged: form.validatePassportNumber,
              value: form.passportNumber.value,
            ),
          ),
          Div(
            divison: const Division(
              colL: 5,
              colM: 12,
              colS: 12,
            ),
            child: TextInput(
              label: 'Telephone',
              onChanged: form.validateHomePhone,
              value: form.homePhone.value,
              errorText: form.homePhone.error,
            ),
          ),
          Div(
            divison: const Division(
              colL: 5,
              colM: 12,
              colS: 12,
            ),
            child: TextInput(
              label: 'Business Phone No',
              onChanged: form.validateBusinessPhone,
              value: form.businessPhone.value,
              errorText: form.businessPhone.error,
            ),
          ),
          Div(
            divison: const Division(
              colL: 5,
              colM: 12,
              colS: 12,
            ),
            child: TextInput(
              label: 'Mobile No',
              onChanged: form.validateMobilePhone,
              value: form.mobilePhone.value,
              errorText: form.mobilePhone.error,
            ),
          ),
          Div(
            divison: const Division(
              colL: 5,
              colM: 12,
              colS: 12,
            ),
            child: TextInput(
              label: 'Email',
              onChanged: form.validateEmail,
              value: form.email.value,
              errorText: form.email.error,
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
                  onPressed: () {},
                  text: 'Done',
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
