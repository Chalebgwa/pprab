import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

class OutlineButton extends StatelessWidget {
  const OutlineButton({required this.onPressed, required this.text, super.key});

  final void Function() onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
        fixedSize: Size(220.w, 54.h),
        side: BorderSide(
          color: HexColor('#000000'),
        ),
      ),
      child: Text(
        text,
        style: GoogleFonts.inter(
          fontSize: 16.sp,
          color: HexColor('#000000'),
        ),
      ),
    );
  }
}

class FillButton extends StatelessWidget {
  const FillButton({required this.onPressed, required this.text, super.key});

  final void Function() onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
        fixedSize: Size(220.w, 54.h),
        backgroundColor: HexColor('#3D99BE'),
      ),
      child: Text(
        text,
        style: GoogleFonts.inter(
          fontSize: 16.sp,
          color: HexColor('#FFFFFF'),
        ),
      ),
    );
  }
}
