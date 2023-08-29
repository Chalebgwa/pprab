import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:pprab/widgets/buttons.dart';
import 'package:pprab/widgets/neumorph.dart';

class BasicProfile extends StatelessWidget {
  const BasicProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: NeumorphicContainer(
        child: Container(
          height: 279,
          color: Colors.transparent,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // dropdown
              Container(
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: DropdownButton(
                  isExpanded: true,
                  underline: SizedBox(),
                  hint: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                    ),
                    child: Text(
                      'Select Company',
                      style: GoogleFonts.inter(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  items: [
                    DropdownMenuItem(
                      child: const Text('Item 1'),
                      value: 'one',
                    ),
                    DropdownMenuItem(
                      child: const Text('Item 2'),
                      value: 'two',
                    ),
                    DropdownMenuItem(
                      child: const Text('Item 3'),
                      value: 'three',
                    ),
                  ],
                  onChanged: (value) {},
                  value: null,
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              Text(
                'Company Rep',
                style: GoogleFonts.inter(
                  color: HexColor('#B3B3B3'),
                  fontSize: 14,
                  fontWeight: FontWeight.w300,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                'John Doe',
                style: GoogleFonts.inter(
                  color: Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(
                height: 30,
              ),

              // email
              Text(
                'Email',
                style: GoogleFonts.inter(
                  color: HexColor('#B3B3B3'),
                  fontSize: 14,
                  fontWeight: FontWeight.w300,
                ),
              ),

              const SizedBox(
                height: 10,
              ),

              Text(
                'email@gmail.com',
                style: GoogleFonts.inter(
                  color: Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Spacer(),
              Row(
                children: [
                  Expanded(
                    child: FillButton(
                      onPressed: () {},
                      text: 'COMPLETE PROFILE',
                    ),
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
