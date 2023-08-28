import 'package:flutter/widgets.dart';

bool isDesktop(BuildContext context) =>
    MediaQuery.of(context).size.width >= 766;
