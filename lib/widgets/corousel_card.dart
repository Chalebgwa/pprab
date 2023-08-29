import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pprab/util/dimensions.dart';
import 'package:responsive_ui/responsive_ui.dart';

class CarouselCard extends StatelessWidget {
  const CarouselCard({
    required this.imageUrl,
    required this.title,
    required this.description,
    super.key,
  });

  final String imageUrl;
  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Div(
          divison: const Division(
            colL: 5,
            colM: 5,
            colS: 12,
          ),
          child: Container(
            height: isDesktop(context) ? 600 : 300,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              image: DecorationImage(
                image: NetworkImage(imageUrl),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        Div(
          divison: const Division(
            colL: 5,
            colM: 5,
            colS: 12,
          ),
          child: Container(
            height: isDesktop(context) ? 600 : 300,
            width: double.infinity,
            decoration: const BoxDecoration(
              color: Colors.white,
              image: DecorationImage(
                image: AssetImage('assets/car1.png'),
                fit: BoxFit.cover,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(27),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    title,
                    textAlign: TextAlign.start,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 3,
                    style: GoogleFonts.inter(
                      fontSize: isDesktop(context) ? 40 : 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    description,
                    textAlign: TextAlign.start,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 4,
                    style: GoogleFonts.inter(
                      fontSize: isDesktop(context) ? 20 : 10,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),

        // Container(
        //     decoration: BoxDecoration(
        //       color: Colors.white,
        //       borderRadius: BorderRadius.circular(8),
        //       image: const DecorationImage(
        //         image: AssetImage('assets/car1.png'),
        //         fit: BoxFit.cover,
        //       ),
        //     ),
        //     child: Column(
        //       crossAxisAlignment: CrossAxisAlignment.start,
        //       children: [
        //         Text(
        //           title,
        //           style: Theme.of(context).textTheme.titleLarge,
        //         ),
        //         Text(
        //           description,
        //           style: Theme.of(context).textTheme.bodyMedium,
        //         ),
        //       ],
        //     ))
      ],
    );
  }
}
