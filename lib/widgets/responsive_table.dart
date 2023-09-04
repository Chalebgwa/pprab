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
    this.onAdd,
    this.onRemove,
  });

  final List<String> headers;
  final List<List<Widget>> rows;
  final String? title;
  final void Function()? onAdd;
  final void Function()? onRemove;

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
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Table(
              defaultVerticalAlignment: TableCellVerticalAlignment.middle,
              columnWidths: {
                for (int i = 0; i < headers.length; i++)
                  i: const FlexColumnWidth(1),
                headers.length: const FixedColumnWidth(50),
              },
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
                    const TableCell(
                      child: SizedBox.shrink(),
                    )
                  ],
                ),
                // first row from rows
                TableRow(
                  children: [
                    for (int i = 0; i < rows[0].length; i++)
                      SizedBox(
                        height: 45,
                        child: rows[0][i],
                      ),
                    Card(
                      margin: EdgeInsets.all(2),
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(8),
                          bottomRight: Radius.circular(8),
                        ),
                      ),
                      child: SizedBox(
                        height: 50,
                        child: IconButton(
                          icon: const Icon(
                            Icons.add_circle,
                            color: Color(0xFF3D99BE),
                          ),
                          onPressed: onAdd,
                        ),
                      ),
                    ),
                  ],
                ),
                for (final row in rows.sublist(1))
                  TableRow(
                    children: [
                      for (int i = 0; i < row.length; i++)
                        SizedBox(
                          height: 50,
                          child: row[i],
                        ),
                      Card(
                        margin: EdgeInsets.all(2),
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(8),
                            bottomRight: Radius.circular(8),
                          ),
                        ),
                        child: SizedBox(
                          height: 50,
                          child: IconButton(
                            icon: const Icon(
                              Icons.remove_circle,
                              color: Color.fromARGB(255, 236, 25, 25),
                            ),
                            onPressed: onRemove,
                          ),
                        ),
                      ),
                    ],
                  ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
