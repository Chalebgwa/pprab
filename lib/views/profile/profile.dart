import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pprab/controllers/dashboard_controller.dart';
import 'package:pprab/views/details_of_bankers.dart';
import 'package:pprab/views/profile/company_address_details.dart';
import 'package:pprab/views/profile/contact_details.dart';
import 'package:pprab/views/profile/profile_company_details.dart';
import 'package:pprab/views/profile/widgets/breadcrumbs.dart';
import 'package:pprab/widgets/buttons.dart';
import 'package:pprab/widgets/neumorph.dart';
import 'package:provider/provider.dart';
import 'package:responsive_ui/responsive_ui.dart';

enum ProfileStatus {
  incomplete,
  inprogress,
  complete,
}

class Profile extends StatelessWidget {
  const Profile({super.key});

  Widget getPage(int page) {
    switch (page) {
      case 0:
        return _profileLandingPage();

      case 1:
        return const ProfileCompanyDetails();

      case 2:
        return const CompanyAddressDetails();

      case 3:
        return const ContactDetails();

      case 4:
        return const DetailsOfBankers();

      default:
        return _profileLandingPage();
    }
  }

  @override
  Widget build(BuildContext context) {
    final page = context.watch<DashboardController>().selectedBreadcrumbIndex;
    return Column(
      children: [
        if (page != 0) ProfileBreadCrumbs(),
        getPage(page),
      ],
    );
  }

  Wrap _profileLandingPage() {
    return const Wrap(
      children: [
        ProfileContent(
          status: ProfileStatus.complete,
          title: 'Company Details',
          icon: FontAwesomeIcons.store,
          page: 1,
        ),
        ProfileContent(
          status: ProfileStatus.inprogress,
          title: 'Company Address Details',
          icon: FontAwesomeIcons.locationDot,
          page: 2,
        ),
        ProfileContent(
          status: ProfileStatus.incomplete,
          title: 'Primary & Secondary Contact',
          icon: FontAwesomeIcons.phone,
          page: 3,
        ),
        ProfileContent(
          status: ProfileStatus.incomplete,
          title: 'Details of Banker',
          icon: FontAwesomeIcons.creditCard,
          page: 4,
        ),
        ProfileContent(
          status: ProfileStatus.incomplete,
          title: 'Details of Affliates',
          icon: FontAwesomeIcons.userPlus,
          page: 5,
        ),
        ProfileContent(
          status: ProfileStatus.incomplete,
          title: 'List of Directors',
          icon: FontAwesomeIcons.listCheck,
          page: 6,
        ),
        ProfileContent(
          status: ProfileStatus.incomplete,
          title: 'Details of Employess in Botswana',
          icon: FontAwesomeIcons.list,
          page: 7,
        ),
        ProfileContent(
          status: ProfileStatus.incomplete,
          title: 'Vehicles & Equipment',
          icon: FontAwesomeIcons.truckMoving,
          page: 8,
        ),
        ProfileContent(
          status: ProfileStatus.incomplete,
          title: 'Details of Projects',
          icon: FontAwesomeIcons.listCheck,
          page: 9,
        ),
        ProfileContent(
          status: ProfileStatus.incomplete,
          title: 'Details of Company',
          icon: FontAwesomeIcons.listCheck,
          page: 10,
        ),
        ProfileContent(
          status: ProfileStatus.incomplete,
          title: 'Upload Supporting Document',
          icon: FontAwesomeIcons.upload,
          page: 11,
        ),
      ],
    );
  }
}

class ProfileContent extends StatelessWidget {
  const ProfileContent({
    required this.status,
    required this.title,
    required this.icon,
    required this.page,
    super.key,
  });

  final ProfileStatus status;
  final String title;
  final IconData icon;
  final int page;

  Color get color {
    switch (status) {
      case ProfileStatus.incomplete:
        return Colors.grey;
      case ProfileStatus.inprogress:
        return Colors.yellow;
      case ProfileStatus.complete:
        return Colors.green;
    }
  }

  String getButtonlabel() {
    switch (status) {
      case ProfileStatus.incomplete:
        return 'EDIT';
      case ProfileStatus.inprogress:
        return 'CONTINUE EDITING';
      case ProfileStatus.complete:
        return 'COMPLETED';
    }
  }

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<DashboardController>();
    return Div(
      divison: const Division(
        colL: 3,
        colM: 4,
        colS: 12,
        colXS: 12,
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: NeumorphicContainer(
          child: Center(
            child: SizedBox(
              height: 279,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const Spacer(),
                      Icon(
                        icon,
                        size: 50,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        title,
                        textAlign: TextAlign.center,
                        style: GoogleFonts.inter(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const Spacer(),
                      FillButton(
                        onPressed: () {
                          controller.setSelectedBreadcrumbIndex(page);
                        },
                        text: getButtonlabel(),
                      )
                    ],
                  ),
                  Positioned(
                    top: 0,
                    right: 0,
                    child: Icon(
                      Icons.check_circle,
                      color: color,
                      size: 30,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
