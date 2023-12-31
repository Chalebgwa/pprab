import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:pprab/controllers/auth_controller.dart';
import 'package:pprab/views/auth/contractor_registration.dart';
import 'package:pprab/widgets/logo.dart';
import 'package:pprab/widgets/search_form.dart';
import 'package:pprab/widgets/search_widget.dart';
import 'package:provider/provider.dart';

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
            const SearchWidget(),
            const SizedBox(
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
            const SizedBox(
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

class CustomNavBarDashboard extends StatelessWidget {
  const CustomNavBarDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final auth = context.watch<Auth>();

    if (size.width <= 766) {
      return Container(
        color: HexColor('#3D99BE'),
        height: 60,
        width: MediaQuery.of(context).size.width,
        child: Row(
          children: [
            const Logo(),
            const Spacer(),
            const SearchWidget(),
            const SizedBox(
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
            const SizedBox(
              width: 30,
            )
          ],
        ),
      );
    }

    return Container(
      color: HexColor('#EFF1F7'),
      height: 80,
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  auth.currentContractor?.firstName.toUpperCase() ?? '',
                  style: GoogleFonts.inter(
                    color: HexColor('#1A1A1A'),
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  auth.currentContractor?.secretaryDirector ?? '',
                  style: GoogleFonts.inter(
                    color: HexColor('#1A1A1A'),
                    fontSize: 11,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ],
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: SizedBox(
                height: 54,
                width: 162,
                child: TextField(
                  readOnly: true,
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return const SearchForm();
                      },
                    );
                  },
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    ),
                    hintText: 'Search',
                    hintStyle: GoogleFonts.inter(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                    suffixIcon: IconButton(
                      onPressed: () {},
                      iconSize: 15,
                      color: HexColor('#B3B3B3'),
                      icon: const Icon(
                        FontAwesomeIcons.search,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            // black bell with badge
            Stack(
              children: [
                const Icon(
                  FontAwesomeIcons.solidBell,
                  color: Colors.black,
                ),
                Positioned(
                  top: 0,
                  right: 0,
                  child: Container(
                    alignment: Alignment.center,
                    width: 15,
                    height: 15,
                    decoration: BoxDecoration(
                      color: HexColor('#3D99BE'),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      '2',
                      style: GoogleFonts.inter(
                        color: Colors.white,
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              width: 20,
            ),
          ],
        ),
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
