import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pprab/util/dimensions.dart';
import 'package:pprab/widgets/buttons.dart';
import 'package:responsive_ui/responsive_ui.dart';

class ContactUs extends StatelessWidget {
  ContactUs({super.key});

  TextEditingController firstName = TextEditingController();
  TextEditingController lastname = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController message = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        buildText(),
        buildForm(context),
      ],
    );
  }

  Widget buildForm(BuildContext context) {
    return Div(
      divison: const Division(
        colL: 6,
        colM: 12,
        colS: 12,
      ),
      child: Padding(
        padding: EdgeInsets.all(isDesktop(context) ? 100.0 : 10),
        child: Wrap(
          //spacing: 5,
          runSpacing: 20,
          runAlignment: WrapAlignment.center,
          children: [
            // Div(
            //   divison: Division(colL: 12, colM: 12, colS: 12),
            //   child: Container(
            //     height: 100,
            //   ),
            // ),
            Div(
              divison: const Division(colL: 6, colM: 12, colS: 12),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: TextField(
                  controller: firstName,
                  decoration: const InputDecoration(
                    label: Text('First Name'),
                  ),
                ),
              ),
            ),
            Div(
              divison: const Division(colL: 6, colM: 12, colS: 12),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: TextField(
                  controller: lastname,
                  decoration: const InputDecoration(
                    label: Text('Last Name'),
                  ),
                ),
              ),
            ),
            Div(
              divison: const Division(colL: 6, colM: 12, colS: 12),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: TextField(
                  controller: email,
                  decoration: const InputDecoration(
                    label: Text('Email'),
                  ),
                ),
              ),
            ),
            Div(
              divison: const Division(colL: 6, colM: 12, colS: 12),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: TextField(
                  controller: phone,
                  decoration: const InputDecoration(
                    label: Text('Phone'),
                  ),
                ),
              ),
            ),
            Div(
              divison: const Division(colL: 12, colM: 12, colS: 12),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: TextField(
                  controller: message,
                  decoration: const InputDecoration(
                    label: Text('Message'),
                  ),
                ),
              ),
            ),
            Div(
              divison: const Division(
                colL: 12,
                colM: 12,
                colS: 12,
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FillButton(
                      onPressed: () {},
                      text: 'SEND MESSAGE',
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget buildText() {
    return Div(
      divison: const Division(
        colL: 6,
        colM: 12,
        colS: 12,
      ),
      child: Padding(
        padding: const EdgeInsets.all(100.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Contact us',
              style: GoogleFonts.inter(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 34,
            ),
            Text(
              'We would love to hear from you',
              style: GoogleFonts.inter(
                fontSize: 50,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 34,
            ),
            Text(
              "Your voice matters. Connect with us today and let's embark on a excellent journey together.",
              style: GoogleFonts.inter(
                fontSize: 18,
                fontWeight: FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
