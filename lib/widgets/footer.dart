import 'dart:js';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:pprab/widgets/logo.dart';
import 'package:responsive_ui/responsive_ui.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: HexColor('#3D99BE'),
      child: Padding(
        padding: const EdgeInsets.all(59),
        child: Wrap(
          children: [
            Div(
              divison: const Division(
                colL: 3,
                colM: 6,
                colS: 12,
              ),
              child: Row(
                children: [
                  Container(
                    height: 52,
                    width: 124,
                    color: Colors.black,
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Image.asset(
                        'assets/logo.png',
                        fit: BoxFit.fill,
                        // width: 135,
                        // height: 63,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Div(
              divison: const Division(
                colL: 3,
                colM: 6,
                colS: 12,
              ),
              child: build1(),
            ),
            Div(
              divison: const Division(
                colL: 3,
                colM: 6,
                colS: 12,
              ),
              child: build2(),
            ),
            Div(
              divison: const Division(
                colL: 3,
                colM: 6,
                colS: 12,
              ),
              child: build3(),
            ),
          ],
        ),
      ),
    );
  }

  Widget build1() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextButton(
          onPressed: () {},
          child: Text(
            'Home',
            style: GoogleFonts.inter(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
        TextButton(
          onPressed: () {},
          child: Text(
            'ABOUT PPRA',
            style: GoogleFonts.inter(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
        TextButton(
          onPressed: () {},
          child: Text(
            'ABOUT IPMS',
            style: GoogleFonts.inter(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }

  Widget build3() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextButton(
          onPressed: () {},
          child: Text(
            'CONTACT US',
            style: GoogleFonts.inter(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
        TextButton(
          onPressed: () {},
          child: Text(
            'FAQ',
            style: GoogleFonts.inter(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }

  Widget build2() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextButton(
          onPressed: () {},
          child: Text(
            'TERMS OF USE',
            style: GoogleFonts.inter(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
        TextButton(
          onPressed: () {},
          child: Text(
            'CONTACT SERVICE DESK',
            style: GoogleFonts.inter(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
