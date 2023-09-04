import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pprab/controllers/auth_controller.dart';
import 'package:pprab/controllers/dashboard_controller.dart';
import 'package:pprab/models/contact_details_model.dart';
import 'package:pprab/util/dimensions.dart';
import 'package:pprab/util/districts.dart';
import 'package:pprab/util/villages.dart';
import 'package:pprab/views/profile/forms/company_address_details_form.dart';
import 'package:pprab/views/profile/forms/primary_contact_form.dart';
import 'package:pprab/views/profile/widgets/label.dart';
import 'package:pprab/widgets/buttons.dart';
import 'package:pprab/widgets/inputs.dart';
import 'package:provider/provider.dart';
import 'package:responsive_ui/responsive_ui.dart';

class ContactDetails extends StatelessWidget {
  const ContactDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final form = context.watch<PrimaryContactForm>();
    final auth = context.watch<Auth>();
    final dashboard = context.watch<DashboardController>();
    return Padding(
      padding: const EdgeInsets.all(46),
      child: Wrap(
        spacing: isDesktop(context) ? 146 : 20,
        runSpacing: isDesktop(context) ? 50 : 20,
        children: [
          const ProfileLabel(
            title: 'Primary Contact',
            icon: FontAwesomeIcons.phone,
          ),
          Div(
            divison: const Division(
              colL: 5,
              colM: 12,
              colS: 12,
            ),
            child: TextInput(
              label: 'First Name',
              onChanged: form.validateFirstName,
              value: form.firstName.value,
              errorText: form.firstName.error,
            ),
          ),
          Div(
            divison: const Division(
              colL: 5,
              colM: 12,
              colS: 12,
            ),
            child: TextInput(
              label: 'Middle Name',
              onChanged: form.validateMiddleName,
              value: form.middleName.value,
              errorText: form.middleName.error,
            ),
          ),
          Div(
            divison: const Division(
              colL: 5,
              colM: 12,
              colS: 12,
            ),
            child: TextInput(
              label: 'Last Name',
              onChanged: form.validateLastName,
              value: form.lastName.value,
              errorText: form.lastName.error,
            ),
          ),
          Div(
            divison: const Division(
              colL: 5,
              colM: 12,
              colS: 12,
            ),
            child: CustomDate(
              label: 'Date of Birth',
              onChanged: form.validateDob,
              value: form.dob.value,
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
            child: TextInput(
              label: 'Cell Number',
              onChanged: form.validatePhone,
              value: form.phone.value,
              errorText: form.phone.error,
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
              onChanged: form.validateTelephone,
              value: form.telephone.value,
              errorText: form.telephone.error,
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
          const ProfileLabel(
            title: 'Primary Postal Address Details',
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
              onChanged: form.validateVillage,
              value: form.village.value,
            ),
          ),
          Div(
            divison: const Division(
              colL: 5,
              colM: 12,
              colS: 12,
            ),
            child: TextInput(
              label: 'P O Box/Private',
              onChanged: form.validatePOBox,
              value: form.pOBox.value,
              errorText: form.pOBox.error,
            ),
          ),
          Div(
            divison: const Division(
              colL: 5,
              colM: 12,
              colS: 12,
            ),
            child: TextInput(
              label: 'Address No.',
              onChanged: form.validateAddressNo,
              value: form.addressNo.value,
              errorText: form.addressNo.error,
            ),
          ),
          Div(
            divison: const Division(
              colL: 5,
              colM: 12,
              colS: 12,
            ),
            child: TextInput(
              label: 'Line Address 1',
              onChanged: form.validateAddressLine1,
              value: form.addressLine1.value,
              errorText: form.addressLine1.error,
            ),
          ),
          Div(
            divison: const Division(
              colL: 5,
              colM: 12,
              colS: 12,
            ),
            child: TextInput(
              label: 'Line Address 2',
              onChanged: form.validateAddressLine2,
              value: form.addressLine2.value,
              errorText: form.addressLine2.error,
            ),
          ),
          const ProfileLabel(
            title: 'Secondary Contact',
            icon: FontAwesomeIcons.phone,
          ),
          Div(
            divison: const Division(
              colL: 5,
              colM: 12,
              colS: 12,
            ),
            child: TextInput(
              label: 'First Name',
              onChanged: form.validateSecondaryFirstName,
              value: form.secondaryFirstName.value,
              errorText: form.secondaryFirstName.error,
            ),
          ),
          Div(
            divison: const Division(
              colL: 5,
              colM: 12,
              colS: 12,
            ),
            child: TextInput(
              label: 'Middle Name',
              onChanged: form.validateSecondaryMiddleName,
              value: form.secondaryMiddleName.value,
              errorText: form.secondaryMiddleName.error,
            ),
          ),
          Div(
            divison: const Division(
              colL: 5,
              colM: 12,
              colS: 12,
            ),
            child: TextInput(
              label: 'Last Name',
              onChanged: form.validateSecondaryLastName,
              value: form.secondaryLastName.value,
              errorText: form.secondaryLastName.error,
            ),
          ),
          Div(
            divison: const Division(
              colL: 5,
              colM: 12,
              colS: 12,
            ),
            child: CustomDate(
              label: 'Date of Birth',
              onChanged: form.validateSecondaryDob,
              value: form.secondaryDob.value,
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
              onChanged: form.validateSecondaryEmail,
              value: form.secondaryEmail.value,
              errorText: form.secondaryEmail.error,
            ),
          ),
          Div(
            divison: const Division(
              colL: 5,
              colM: 12,
              colS: 12,
            ),
            child: TextInput(
              label: 'Cell Number',
              onChanged: form.validateSecondaryPhone,
              value: form.secondaryPhone.value,
              errorText: form.secondaryPhone.error,
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
              onChanged: form.validateSecondaryTelephone,
              value: form.secondaryTelephone.value,
              errorText: form.secondaryTelephone.error,
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
              onChanged: form.validateSecondaryBusinessPhone,
              value: form.secondaryBusinessPhone.value,
              errorText: form.secondaryBusinessPhone.error,
            ),
          ),
          const ProfileLabel(
            title: 'Secondary Postal Address Details',
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
              onChanged: form.validateSecondaryCountry,
              value: form.secondaryCountry.value,
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
              onChanged: form.validateSecondaryDistrict,
              value: form.secondaryDistrict.value,
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
              onChanged: form.validateSecondaryVillage,
              value: form.secondaryVillage.value,
            ),
          ),
          Div(
            divison: const Division(
              colL: 5,
              colM: 12,
              colS: 12,
            ),
            child: TextInput(
              label: 'P O Box/Private',
              onChanged: form.validateSecondaryPOBox,
              value: form.secondaryPOBox.value,
              errorText: form.secondaryPOBox.error,
            ),
          ),
          Div(
            divison: const Division(
              colL: 5,
              colM: 12,
              colS: 12,
            ),
            child: TextInput(
              label: 'Address No.',
              onChanged: form.validateSecondaryAddressNo,
              value: form.secondaryAddressNo.value,
              errorText: form.secondaryAddressNo.error,
            ),
          ),
          Div(
            divison: const Division(
              colL: 5,
              colM: 12,
              colS: 12,
            ),
            child: TextInput(
              label: 'Line Address 1',
              onChanged: form.validateSecondaryAddressLine1,
              value: form.secondaryAddressLine1.value,
              errorText: form.secondaryAddressLine1.error,
            ),
          ),
          Div(
            divison: const Division(
              colL: 5,
              colM: 12,
              colS: 12,
            ),
            child: TextInput(
              label: 'Line Address 2',
              onChanged: form.validateSecondaryAddressLine2,
              value: form.secondaryAddressLine2.value,
              errorText: form.secondaryAddressLine2.error,
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
                      final business = auth.selectedBusines;

                      final newBusiness = business?.copyWith(
                        contactInfoModel: ContactInfoModel.fromJson(
                          form.toJson(),
                        ),
                      );

                      auth.updateBusinessModel(newBusiness!);
                      dashboard.setSelectedBreadcrumbIndex(4);
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          backgroundColor: Colors.green,
                          content: Text('Contact details saved'),
                        ),
                      );
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
