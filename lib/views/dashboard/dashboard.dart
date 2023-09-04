import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:pprab/controllers/dashboard_controller.dart';
import 'package:pprab/views/dashboard/dashboard_content.dart';
import 'package:pprab/views/dashboard/side_bar.dart';
import 'package:pprab/views/profile/profile.dart';
import 'package:pprab/widgets/custom_navbar.dart';
import 'package:provider/provider.dart';
import 'package:responsive_ui/responsive_ui.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  static const routeName = '/dashboard';

  Widget displayPage(int index) {
    switch (index) {
      case 0:
        return const DashboardContent();
      case 1:
        return const Profile();
      case 2:
        return const DashboardContent();
      case 3:
        return const DashboardContent();
      case 4:
        return const DashboardContent();
      case 5:
        return const DashboardContent();
      default:
        return const DashboardContent();
    }
  }

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<DashboardController>();

    return Scaffold(
      drawer: const Drawer(child: SideBar()),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Wrap(
          children: [
            const Div(
              divison: Division(
                colL: 2,
                colM: 0,
                colS: 0,
                colXS: 0,
              ),
              child: SideBar(),
            ),
            Div(
              divison: const Division(
                colL: 10,
                colM: 12,
                colS: 12,
              ),
              child: Container(
                height: MediaQuery.of(context).size.height,
                color: HexColor('#EFF1F7'),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const CustomNavBarDashboard(),
                      Divider(
                        thickness: 1,
                        color: HexColor('#B3B3B3'),
                        endIndent: 21,
                        indent: 21,
                      ),
                      // row with clock and date
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 21,
                          vertical: 10,
                        ),
                        child: Row(
                          children: [
                            Icon(
                              Icons.access_time_filled,
                              color: HexColor('#3D99BE'),
                              size: 15,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              'Valid until',
                              style: GoogleFonts.inter(
                                color: HexColor('#000000'),
                                fontSize: 10,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Text(
                              ' 12/12/2021',
                              style: GoogleFonts.inter(
                                color: HexColor('#000000'),
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      displayPage(controller.selectedIndex)
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
