import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:pprab/util/dimensions.dart';
import 'package:pprab/widgets/buttons.dart';
import 'package:pprab/widgets/search_form.dart';
import 'package:responsive_ui/responsive_ui.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.sizeOf(context).height,
      width: double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/bg2.png'),
          fit: BoxFit.fill,
        ),
      ),
      child: Column(
        children: [
          SizedBox(
            height: isDesktop(context) ? 212 : 150,
          ),
          Text(
            'Welcome to IPMS',
            textAlign: TextAlign.center,
            style: GoogleFonts.inter(
              fontSize: isDesktop(context) ? 80 : 50,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(
            height: 36,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              'Your Ultimate Procurement Solution. Streamline your sourcing process, relationships, and drive cost savings like never before. Revolutionize your procurement strategy with our cutting-edge platform.',
              textAlign: TextAlign.center,
              style: GoogleFonts.inter(
                fontSize: isDesktop(context) ? 30 : 20,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(
            height: 36,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 356,
                child: Card(
                  child: ListTile(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return const SearchForm();
                        },
                      );
                    },
                    trailing: const Icon(
                      FontAwesomeIcons.magnifyingGlass,
                    ),
                    title: Text(
                      'SEARCH REGISTERED CONTRACTOR',
                      style: GoogleFonts.inter(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const Spacer(),

          // text at the left bottom corner 'Do you need help? Click Here'
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: Row(
              children: [
                Text(
                  'Do you need help? ',
                  style: GoogleFonts.inter(
                    fontSize: 14,
                    color: Colors.white,
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: Text(
                    'Click Here',
                    style: GoogleFonts.inter(
                      fontSize: 14,
                      color: Colors.white,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget searchBar(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(isDesktop(context) ? 200 : 40),
      child: Material(
        child: Column(
          children: [
            // outlined text field
            Wrap(
              children: [
                Div(
                  divison: Division(colL: 8, colM: 8, colS: 12),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      decoration: InputDecoration(
                        fillColor: HexColor('#E0E0E0'),
                        filled: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none,
                        ),
                        labelText: 'Search',
                        hintText: 'Search',
                        prefixIcon: Icon(Icons.search),
                      ),
                    ),
                  ),
                ),
                Div(
                  divison: Division(colL: 4, colM: 4, colS: 12),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: FillButton(
                      onPressed: () {},
                      text: 'Search',
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
