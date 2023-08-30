import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_ui/responsive_ui.dart';

class ProfileLabel extends StatelessWidget {
  const ProfileLabel({required this.title, required this.icon, super.key});

  final String title;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Div(
      divison: const Division(
        colL: 12,
        colM: 12,
        colS: 12,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 39),
        child: Row(
          children: [
            Icon(
              icon,
              color: Colors.black,
              size: 40,
            ),
            const SizedBox(
              width: 16,
            ),
            Text(
              title,
              style: GoogleFonts.inter(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
