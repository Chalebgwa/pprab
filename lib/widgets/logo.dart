import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Logo extends StatelessWidget {
  const Logo({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 48,
        width: 95,
        color: Colors.white,
        alignment: Alignment.center,
        child: Container(
          width: 84,
          height: 37,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            border: Border.all(
              style: BorderStyle.solid,
              color: Colors.black,
            ),
          ),
          child: Text(
            'PPRA',
            style: GoogleFonts.neuton(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
