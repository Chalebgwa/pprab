import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:pprab/util/dimensions.dart';
import 'package:pprab/widgets/neumorph.dart';

class MediaCenter extends StatelessWidget {
  const MediaCenter({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: isDesktop(context) ? 100 : 20),
      child: Column(
        //mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              Text(
                'Media Center',
                style: GoogleFonts.inter(
                  fontSize: isDesktop(context) ? 40 : 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              // rounded dropdown button with options Committee Decision  |Contractor Registration Requirements  |Price Guide |How To? |PPRA Procurement Plan |
              const Spacer(),
              Card(
                color: Colors.white,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: DropdownButton<String>(
                    value: 'Committee Decision',
                    underline: const SizedBox(),
                    enableFeedback: false,
                    focusColor: Colors.transparent,
                    dropdownColor: Colors.white,
                    isDense: true,
                    onChanged: (String? newValue) {},
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
              )
            ],
          ),
          SizedBox(
            height: 300,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: MediaCard(
                    title: 'Media Title',
                    pdfUrl: 'https://www.google.com',
                  ),
                );
              },
            ),
          ),
        ],
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
    return NeumorphicContainer(
      child: SizedBox(
        width: 270,
        height: 270,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(),
            Image.asset('assets/pdf.png'),
            Text(title),
            Spacer(),
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
    );
  }
}
