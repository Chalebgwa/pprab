import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:pprab/widgets/buttons.dart';
import 'package:pprab/widgets/inputs.dart';
import 'package:provider/provider.dart';
import 'package:responsive_ui/responsive_ui.dart';

import '../../../forms/contractor_form.dart';

class ContractorRegistration extends StatefulWidget {
  const ContractorRegistration({super.key});
  static const routeName = '/contractor-registration';

  @override
  State<ContractorRegistration> createState() => _ContractorRegistrationState();
}

class _ContractorRegistrationState extends State<ContractorRegistration> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: HexColor('#FFFFFF'),
      body: Responsive(
        children: [
          Div(
            divison: const Division(
              colL: 8,
              colM: 12,
              colS: 12,
            ),
            child: SizedBox(
              height: size.height,
              child: const ContractorFormView(),
            ),
          ),
          Div(
            divison: const Division(
              colL: 4,
              colM: 0,
              colS: 0,
            ),
            child: Container(
              height: size.height,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/bg1.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class ContractorFormView extends StatefulWidget {
  const ContractorFormView({super.key});

  @override
  State<ContractorFormView> createState() => _ContractorFormViewState();
}

class _ContractorFormViewState extends State<ContractorFormView> {
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    final form = context.watch<ContractorForm>();

    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 100,
        horizontal: 75,
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Personal Information',
              style: GoogleFonts.inter(
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 31,
            ),
            if (currentPage == 0)
              SizedBox(
                width: double.infinity,
                child: Wrap(
                  spacing: 110,
                  runAlignment: WrapAlignment.spaceBetween,
                  alignment: WrapAlignment.spaceBetween,
                  runSpacing: 49,
                  children: [
                    Div(
                      divison: const Division(
                        colL: 5,
                        colM: 5,
                        colS: 12,
                      ),
                      child: TextInput(
                        label: 'First Name',
                        value: form.firstName.value,
                        errorText: form.firstName.error,
                        onChanged: form.validateFirstName,
                        placeholder: 'John',
                      ),
                    ),
                    Div(
                      divison: const Division(
                        colL: 5,
                        colM: 5,
                        colS: 12,
                      ),
                      child: TextInput(
                        label: 'Surname',
                        value: form.lastName.value,
                        errorText: form.lastName.error,
                        onChanged: form.validateLastName,
                        placeholder: 'Doe',
                      ),
                    ),
                    Div(
                      divison: const Division(
                        colL: 5,
                        colM: 5,
                        colS: 12,
                      ),
                      child: TextInput(
                        label: 'Phone Number',
                        value: form.phoneNumber.value,
                        errorText: form.phoneNumber.error,
                        onChanged: form.validatePhoneNumber,
                        placeholder: '+(267) 76 012 345',
                      ),
                    ),
                    Div(
                      divison: const Division(
                        colL: 5,
                        colM: 5,
                        colS: 12,
                      ),
                      child: TextInput(
                        label: 'Email',
                        value: form.email.value,
                        errorText: form.email.error,
                        onChanged: form.validateEmail,
                        placeholder: 'Johndoe@gmail.com',
                      ),
                    ),
                    Div(
                      divison: const Division(
                        colL: 5,
                        colM: 5,
                        colS: 12,
                      ),
                      child: TextInput(
                        label: 'Password',
                        value: form.password.value,
                        errorText: form.password.error,
                        onChanged: form.validatePassword,
                        placeholder: '*************',
                        obscureText: true,
                      ),
                    ),
                    Div(
                      divison: const Division(
                        colL: 5,
                        colM: 5,
                        colS: 12,
                      ),
                      child: TextInput(
                        label: 'Confirm Password',
                        value: form.confirmPassword.value,
                        errorText: form.confirmPassword.error,
                        onChanged: form.validateConfirmPassword,
                        placeholder: '*************',
                        obscureText: true,
                      ),
                    ),
                  ],
                ),
              ),
            if (currentPage == 1)
              SizedBox(
                width: double.infinity,
                child: Wrap(
                  spacing: 110,
                  runAlignment: WrapAlignment.spaceBetween,
                  alignment: WrapAlignment.spaceBetween,
                  runSpacing: 49,
                  children: [
                    Div(
                      divison: const Division(
                        colL: 5,
                        colM: 5,
                        colS: 12,
                      ),
                      child: TextInput(
                        label: 'Name Of Company',
                        value: form.businessName.value,
                        errorText: form.businessName.error,
                        onChanged: form.validateBusinessName,
                        placeholder: 'Lema-systems',
                      ),
                    ),
                    Div(
                      divison: const Division(
                        colL: 5,
                        colM: 5,
                        colS: 12,
                      ),
                      child: CustomDropdown(
                        label: 'Businesss Type',
                        value: form.businessType.value,
                        onChanged: form.validateBusinessType,
                        options: const ['Business Name', 'Company'],
                      ),
                    ),
                    if (form.businessType.value == 'Business Name')
                      Div(
                        divison: const Division(
                          colL: 5,
                          colM: 5,
                          colS: 12,
                        ),
                        child: TextInput(
                          label: 'Omang Number',
                          value: form.omang.value,
                          errorText: form.omang.error,
                          onChanged: form.validateOmang,
                          placeholder: '123456789',
                        ),
                      ),
                    if (form.businessType.value == 'Company')
                      Div(
                        divison: const Division(
                          colL: 5,
                          colM: 5,
                          colS: 12,
                        ),
                        child: CustomRadio(
                          label: 'Are You Registered With CIPA',
                          value: form.areYourRegisterdWithCipa.value,
                          onChanged: form.validateAreYouRegisteredWithCipa,
                          options: const ['Yes', 'No'],
                        ),
                      ),
                    if (form.businessType.value == 'Company' &&
                        form.areYourRegisterdWithCipa.value == 'Yes')
                      Div(
                        divison: const Division(
                          colL: 5,
                          colM: 5,
                          colS: 12,
                        ),
                        child: TextInput(
                          label: 'CIPA Unique Identification Number',
                          value: form.cipaNumber.value,
                          onChanged: form.validateCipaNumber,
                          errorText: form.cipaNumber.error,
                          placeholder: '00000000',
                        ),
                      ),
                    if (form.businessType.value == 'Company' &&
                        form.areYourRegisterdWithCipa.value == 'Yes')
                      CustomDate(
                        value: form.dateOfBusinessRegistration.value,
                        label: 'Date of Registration:',
                        onChanged: (s) {
                          form.validateDor(s);
                          setState(() {});
                        },
                        errorText: form.dateOfBusinessRegistration.error,
                      )
                  ],
                ),
              ),
            SizedBox(
              height: 60,
            ),
            SizedBox(
              width: double.infinity,
              child: Wrap(
                spacing: 110,
                runAlignment: WrapAlignment.spaceBetween,
                alignment: WrapAlignment.spaceBetween,
                crossAxisAlignment: WrapCrossAlignment.center,
                runSpacing: 49,
                children: [
                  Div(
                    divison: const Division(
                      colL: 3,
                      colM: 5,
                      colS: 5,
                    ),
                    child: OutlineButton(
                      onPressed: () {
                        setState(() {
                          currentPage = 0;
                        });
                      },
                      text: 'Back',
                    ),
                  ),
                  Div(
                    divison: const Division(
                      colL: 3,
                      colM: 5,
                      colS: 5,
                    ),
                    child: FillButton(
                      onPressed: () {
                        if (currentPage == 0) {
                          setState(() {
                            currentPage = 1;
                          });
                        }


                        
                        form.submit();
                      },
                      text: currentPage == 0 ? 'Next' : 'Create Account',
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 60,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "You have an account?",
                  style: GoogleFonts.inter(
                    fontSize: 16,
                    color: HexColor('#B3B3B3'),
                  ),
                ),
                SizedBox(
                  width: 2,
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    "Login",
                    style: GoogleFonts.inter(
                      fontSize: 16,
                      color: HexColor('#000000'),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
