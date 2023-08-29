import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:pprab/controllers/dashboard_controller.dart';
import 'package:provider/provider.dart';

class SideBar extends StatefulWidget {
  const SideBar({super.key});

  @override
  State<SideBar> createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> {
  late DashboardController controller;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    controller = context.read<DashboardController>();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: HexColor('#3D99BE'),
      height: MediaQuery.of(context).size.height,
      child: Column(
        children: [
          const SizedBox(
            height: 50,
          ),
          Image.asset('assets/logo.png'),
          const SizedBox(
            height: 50,
          ),
          buildMenuItem('Dashboard', Icons.dashboard, 0),
          buildMenuItem('Profile', Icons.person, 1),
          buildMenuItem('Codes', FontAwesomeIcons.briefcase, 2),
          buildMenuItem('Payments', FontAwesomeIcons.creditCard, 3),
          buildMenuItem('Feedback', FontAwesomeIcons.clipboardCheck, 4),
          buildMenuItem('Messages', FontAwesomeIcons.envelope, 5),
        ],
      ),
    );
  }

  Widget buildMenuItem(String text, IconData icon, int page) {
    final selectedIndex = controller.selectedIndex;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: ColoredBox(
          color:
              selectedIndex == page ? HexColor('#FFFFFF') : Colors.transparent,
          child: ListTile(
            selected: selectedIndex == page,
            selectedTileColor: Colors.white,
            tileColor: Colors.transparent,
            leading: Icon(
              icon,
              color: selectedIndex == page
                  ? HexColor('#3D99BE')
                  : HexColor('#D7DEF4'),
              size: 20,
            ),
            minLeadingWidth: 43,
            selectedColor: Colors.white,
            onTap: () {
              controller.setIndex(page);
              if (Scaffold.of(context).isDrawerOpen) {
                Scaffold.of(context).closeDrawer();
              }
              setState(() {});
            },
            title: Text(
              text,
              style: GoogleFonts.inter(
                textStyle: TextStyle(
                  color: selectedIndex == page
                      ? HexColor('#3D99BE')
                      : HexColor('#D7DEF4'),
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
