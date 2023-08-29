import 'package:flutter/material.dart';

class NeumorphicContainer extends StatelessWidget {
  final Widget child;

  NeumorphicContainer({required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Colors.grey.shade50,
            Colors.grey.shade100,
          ],
          stops: [
            0.1,
            0.3,
          ],
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade200,
            offset: Offset(-5.0, -5.0),
            blurRadius: 10.0,
          ),
          BoxShadow(
            color: Colors.white,
            offset: Offset(5.0, 5.0),
            blurRadius: 10.0,
          ),
        ],
      ),
      padding: EdgeInsets.all(20.0),
      child: child,
    );
  }
}
