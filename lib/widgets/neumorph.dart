import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class NeumorphicContainer extends StatelessWidget {
  const NeumorphicContainer({required this.child, super.key});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Colors.grey.shade50,
            Colors.grey.shade100,
          ],
          stops: const [
            0.1,
            0.3,
          ],
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade300,
            offset: const Offset(-2, -2),
            blurRadius: 1,
          ),
          BoxShadow(
            color: Colors.grey.shade50,
            offset: Offset(2, 2),
            blurRadius: 1,
          ),
        ],
      ),
      child: Container(
        padding: const EdgeInsets.all(20),
        child: child,
        color: HexColor('#EFF1F7'),
      ),
    );
  }
}
