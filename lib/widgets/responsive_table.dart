import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:pprab/util/dimensions.dart';

class ResponsiveTable extends StatelessWidget {
  const ResponsiveTable({
    required this.headers,
    required this.rows,
    super.key,
    this.title,
  });

  final List<String> headers;
  final List<List<Widget>> rows;
  final String? title;

  @override
  Widget build(BuildContext context) {
    if (rows.isEmpty) {
      return const SizedBox.shrink();
    }

    if (!isDesktop(context)) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (title != null)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                title!,
                style: GoogleFonts.inter(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title != null)
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              title!,
              style: GoogleFonts.inter(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        Padding(
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
        ),
      ],
    );
  }
}
