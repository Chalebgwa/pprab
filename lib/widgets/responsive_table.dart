import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:pprab/util/dimensions.dart';

class ResponsiveTable extends StatelessWidget {
  const ResponsiveTable({super.key, required this.headers, required this.rows});

  final List<String> headers;
  final List<List<Widget>> rows;

  @override
  Widget build(BuildContext context) {
    if (rows.isEmpty) {
      return const SizedBox.shrink();
    }

    if (!isDesktop(context)) {
      return Column(
        children: [
          Table(
            defaultVerticalAlignment: TableCellVerticalAlignment.middle,
            border: TableBorder.all(
              color: HexColor('#F2F5F9'),
              width: 1,
            ),
            children: [
              for (final row in rows)
                TableRow(
                  children: [
                    for (final cell in row)
                      SizedBox(
                        height: 45,
                        child: cell,
                      ),
                  ],
                ),
            ],
          ),
        ],
      );
    }
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Table(
            defaultVerticalAlignment: TableCellVerticalAlignment.middle,
            border: TableBorder.all(
              color: HexColor('#F2F5F9'),
              width: 1,
            ),
            children: [
              TableRow(
                children: [
                  for (final header in headers)
                    Container(
                      height: 45,
                      alignment: Alignment.center,
                      color: HexColor('#3D99BE'),
                      child: Text(
                        header,
                        style: GoogleFonts.inter(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                ],
              ),
              for (final row in rows)
                TableRow(
                  children: [
                    for (final cell in row)
                      SizedBox(
                        height: 45,
                        child: cell,
                      ),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}
