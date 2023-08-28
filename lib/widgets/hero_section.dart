import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:pprab/util/dimensions.dart';

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
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              fixedSize: const Size(195, 50),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: Text(
              'GET STARTED NOW',
              style: TextStyle(
                color: HexColor('#223160'),
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Spacer(),

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
}
