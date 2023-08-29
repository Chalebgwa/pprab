import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pprab/widgets/buttons.dart';
import 'package:pprab/widgets/neumorph.dart';
import 'package:responsive_ui/responsive_ui.dart';

enum ProfileStatus {
  incomplete,
  inprogress,
  complete,
}

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return const Wrap(
      children: [
        ProfileContent(
          status: ProfileStatus.complete,
          title: 'Company Details',
          icon: FontAwesomeIcons.store,
        ),
        ProfileContent(
          status: ProfileStatus.inprogress,
          title: 'Company Address Details',
          icon: FontAwesomeIcons.locationDot,
        ),
        ProfileContent(
          status: ProfileStatus.incomplete,
          title: 'Primary & Secondary Contact',
          icon: FontAwesomeIcons.phone,
        ),
        ProfileContent(
          status: ProfileStatus.incomplete,
          title: 'Details of Banker',
          icon: FontAwesomeIcons.creditCard,
        ),
        ProfileContent(
          status: ProfileStatus.incomplete,
          title: 'Details of Affliates',
          icon: FontAwesomeIcons.userPlus,
        ),
        ProfileContent(
          status: ProfileStatus.incomplete,
          title: 'List of Directors',
          icon: FontAwesomeIcons.listCheck,
        ),
        ProfileContent(
          status: ProfileStatus.incomplete,
          title: 'Details of Employess in Botswana',
          icon: FontAwesomeIcons.list,
        ),
        ProfileContent(
          status: ProfileStatus.incomplete,
          title: 'Vehicles & Equipment',
          icon: FontAwesomeIcons.truckMoving,
        ),
        ProfileContent(
          status: ProfileStatus.incomplete,
          title: 'Details of Projects',
          icon: FontAwesomeIcons.listCheck,
        ),
        ProfileContent(
          status: ProfileStatus.incomplete,
          title: 'Details of Company',
          icon: FontAwesomeIcons.listCheck,
        ),
        ProfileContent(
          status: ProfileStatus.incomplete,
          title: 'Upload Supporting Document',
          icon: FontAwesomeIcons.upload,
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
    super.key,
  });

  final ProfileStatus status;
  final String title;
  final IconData icon;

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
                      Spacer(),
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
                      Spacer(),
                      FillButton(
                        onPressed: () {},
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
