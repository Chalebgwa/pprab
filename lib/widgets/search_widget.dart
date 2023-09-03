import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:pprab/util/dimensions.dart';
import 'package:pprab/widgets/buttons.dart';
import 'package:responsive_ui/responsive_ui.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // show search bar as dialog
        showDialog(
          context: context,
          builder: (context) {
            return searchBar(context);
          },
        );
      },
      child: Container(
        height: 40,
        width: 40,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          //color: Colors.white,
        ),
        alignment: Alignment.center,
        child: const Icon(
          FontAwesomeIcons.magnifyingGlass,
          size: 20,
          color: Colors.white,
        ),
      ),
    );
  }

  Widget searchBar(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(isDesktop(context) ? 200 : 40),
      child: Material(
        child: Column(
          children: [
            // outlined text field
            Wrap(
              children: [
                Div(
                  divison: const Division(colL: 8, colM: 8, colS: 12),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      decoration: InputDecoration(
                        fillColor: HexColor('#E0E0E0'),
                        filled: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none,
                        ),
                        labelText: 'Search',
                        hintText: 'Search',
                        prefixIcon: const Icon(Icons.search),
                      ),
                    ),
                  ),
                ),
                Div(
                  divison: const Division(colL: 4, colM: 4, colS: 12),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: FillButton(
                      onPressed: () {},
                      text: 'Search',
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
