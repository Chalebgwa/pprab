import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:pprab/util/dimensions.dart';
import 'package:pprab/widgets/neumorph.dart';
import 'package:responsive_ui/responsive_ui.dart';

class MediaCenter extends StatefulWidget {
  const MediaCenter({super.key});

  @override
  State<MediaCenter> createState() => _MediaCenterState();
}

class _MediaCenterState extends State<MediaCenter> {
  String? selected;
  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: HexColor('#D2E2EC'),
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: isDesktop(context) ? 10 : 20, vertical: 100),
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Wrap(
              runSpacing: 30,
              spacing: 100,
              children: [
                Div(
                  divison: Division(
                    colL: 5,
                    colM: 12,
                    colS: 12,
                  ),
                  child: Text(
                    'Media Center',
                    style: GoogleFonts.inter(
                      fontSize: isDesktop(context) ? 40 : 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                // rounded dropdown button with options Committee Decision  |Contractor Registration Requirements  |Price Guide |How To? |PPRA Procurement Plan |
                Spacer(),
                Div(
                  divison: Division(colL: 5, colM: 12, colS: 12),
                  child: Card(
                    color: Colors.white,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: DropdownButton<String?>(
                        isExpanded: true,
                        hint: Text(
                          'Filter By:',
                          style: GoogleFonts.inter(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        value: selected,
                        underline: const SizedBox(),
                        enableFeedback: false,
                        focusColor: Colors.transparent,
                        dropdownColor: Colors.white,
                        isDense: true,
                        onChanged: (String? newValue) {
                          setState(() {
                            selected = newValue;
                          });
                        },
                        items: <String>[
                          'Committee Decision',
                          'Contractor Registration Requirements',
                          'Price Guide',
                          'How To?',
                          'PPRA Procurement Plan',
                        ].map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 50,
            ),
            const Wrap(
              runSpacing: 30,
              spacing: 140,
              children: [
                MediaCard(
                  title: 'Media Title',
                  pdfUrl: 'https://www.google.com',
                ),
                MediaCard(
                  title: 'Media Title',
                  pdfUrl: 'https://www.google.com',
                ),
                MediaCard(
                  title: 'Media Title',
                  pdfUrl: 'https://www.google.com',
                ),
                MediaCard(
                  title: 'Media Title',
                  pdfUrl: 'https://www.google.com',
                ),
                Div(
                  child: Row(
                    children: [
                      // underliner see all text
                      Text('See All')
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class MediaCard extends StatelessWidget {
  const MediaCard({required this.title, required this.pdfUrl, super.key});

  final String title;
  final String pdfUrl;

  @override
  Widget build(BuildContext context) {
    return Div(
      divison: const Division(
        colL: 2,
        colM: 12,
        colS: 12,
      ),
      child: NeumorphicContainer(
        child: SizedBox(
          width: 150,
          height: 150,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),
              Image.asset('assets/pdf.png'),
              Text(title),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(FontAwesomeIcons.eye),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.download),
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
