import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:pprab/views/desktop/contractor_registration/contractor_registration.dart';
import 'package:pprab/widgets/logo.dart';
import 'package:pprab/widgets/search_widget.dart';

class CustomNavBar extends StatelessWidget {
  const CustomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    if (size.width <= 766) {
      return Container(
        color: HexColor('#3D99BE'),
        height: 80,
        width: double.infinity,
        child: Row(
          children: [
            const Logo(),
            const Spacer(),
            SearchWidget(),
            SizedBox(
              width: 20,
            ),
            IconButton(
              onPressed: () {
                if (Scaffold.of(context).isDrawerOpen) {
                  Scaffold.of(context).closeDrawer();
                } else {
                  Scaffold.of(context).openDrawer();
                }
              },
              icon: const Icon(
                FontAwesomeIcons.bars,
                color: Colors.white,
              ),
            ),
            SizedBox(
              width: 30,
            )
          ],
        ),
      );
    }

    return Container(
      color: HexColor('#3D99BE'),
      height: 80,
      width: double.infinity,
      child: Row(
        children: [
          const Logo(),
          const Spacer(),
          const Navbar(
            label: 'Announcements',
            page: 'announcements',
          ),
          const Navbar(
            label: 'Media',
            page: 'media',
          ),
          // const SizedBox(
          //   width: 45,
          // ),
          const SearchWidget(),
          const SizedBox(
            width: 45,
          ),
          InkWell(
            onTap: () {
              context.go(ContractorRegistration.routeName);
            },
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              width: 195,
              height: 45,
              child: Text(
                'LOGIN/REGISTER',
                style: GoogleFonts.inter(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 50,
          ),
        ],
      ),
    );
  }
}

class Navbar extends StatelessWidget {
  const Navbar({
    required this.label,
    required this.page,
    super.key,
  });

  final String label;
  final String page;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
      child: Text(label,
          style: GoogleFonts.inter(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 14,
          )),
    );
  }
}
