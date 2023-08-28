import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pprab/widgets/custom_navbar.dart';
import 'package:pprab/widgets/hero_section.dart';
import 'package:pprab/widgets/logo.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  static const routeName = '/';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Column(
          children: [
            DrawerHeader(
              padding: EdgeInsets.zero,
              margin: EdgeInsets.zero,
              child: Container(
                width: double.infinity,
                height: double.infinity,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/bg1.png'),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  alignment: Alignment.bottomLeft,
                  color: Colors.black.withOpacity(.4),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'PPRAB',
                      style: GoogleFonts.neuton(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const ListTile(
              title: Text('Announcements'),
            ),
            const ListTile(
              title: Text('Media'),
            ),
            const ListTile(
              title: Text('Login/Register'),
            ),
          ],
        ),
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: CustomNavBar(),
          ),
          SliverToBoxAdapter(
            child: HeroSection(),
          ),
          SliverToBoxAdapter(
            child: Container(
              height: 900,
              width: double.infinity,
              color: Colors.red,
            ),
          ),
        ],
      ),
    );
  }
}
