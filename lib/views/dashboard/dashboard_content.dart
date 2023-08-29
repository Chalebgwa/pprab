import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:pprab/views/dashboard/basic_profile.dart';
import 'package:pprab/views/dashboard/feedback.dart';
import 'package:responsive_ui/responsive_ui.dart';

class DashboardContent extends StatelessWidget {
  const DashboardContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey.shade200,
      child: SingleChildScrollView(
        child: Responsive(
          children: [
            Div(
              divison: Division(
                colL: 4,
                colM: 12,
                colS: 12,
              ),
              child: BasicProfile(),
            ),
            Div(
                divison: Division(
                  colL: 8,
                  colM: 12,
                  colS: 12,
                ),
                child: FeedbackView()),
            Div(
              divison: Division(
                colL: 8,
                colM: 12,
                colS: 12,
              ),
              child: Container(
                height: 279,
                color: Colors.yellow,
                child: const Text('Menu'),
              ),
            ),
            Div(
              divison: Division(
                colL: 4,
                colM: 12,
                colS: 12,
              ),
              child: Container(
                height: 279,
                color: Colors.pink,
                child: const Text('Menu'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
