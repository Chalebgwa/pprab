import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pprab/util/dimensions.dart';
import 'package:pprab/widgets/corousel_card.dart';
import 'package:pprab/widgets/custom_navbar.dart';
import 'package:pprab/widgets/hero_section.dart';
import 'package:pprab/widgets/media_center.dart';

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
          const SliverToBoxAdapter(
            child: CustomNavBar(),
          ),
          const SliverToBoxAdapter(
            child: HeroSection(),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                SizedBox(
                  height: isDesktop(context) ? 50 : 10,
                ),
                Text(
                  'About IPMS',
                  style: GoogleFonts.neuton(
                    fontSize: isDesktop(context) ? 40 : 30,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50),
                  child: Text(
                    'The Public Procurement Regulatory Authority (PPRA), with the objective to improve the public procurement process and contractor registration , has automated the contractor registration process through the implementation of Integrated Procurement Management System (IPMS). IPMS has been interfaced with existing Government Legacy Systems to verify information in real time. We hope you have an enjoyable experience using IPMS.',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.inter(
                      fontSize: isDesktop(context) ? 20 : 15,
                      color: Colors.black,
                      fontWeight: FontWeight.w200,
                    ),
                  ),
                ),
                SizedBox(
                  height: isDesktop(context) ? 50 : 10,
                ),
              ],
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                Text(
                  'Announcements',
                  style: GoogleFonts.neuton(
                    fontSize: isDesktop(context) ? 40 : 30,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                CarouselSlider(
                  options: CarouselOptions(
                    height: 600,
                    aspectRatio: 16 / 9,
                    viewportFraction: 0.9,
                    initialPage: 0,
                    enableInfiniteScroll: true,
                    reverse: false,
                    autoPlay: true,
                    autoPlayInterval: const Duration(seconds: 10),
                    autoPlayAnimationDuration:
                        const Duration(milliseconds: 800),
                    autoPlayCurve: Curves.fastOutSlowIn,
                    enlargeCenterPage: true,
                    enlargeFactor: 0.2,
                    scrollDirection: Axis.horizontal,
                  ),
                  items: [1, 2, 3, 4, 5].map((i) {
                    return const CarouselCard(
                      imageUrl: 'https://picsum.photos/200/300',
                      title:
                          'Capacity buiding workshop participants during the deliberations.',
                      description:
                          'Vibrant discussions took center stage as participants gathered for the Capacity Building Workshop. With a unified goal of growth, minds converged, sharing insights and knowledge.',
                    );
                  }).toList(),
                ),
              ],
            ),
          ),
          const SliverToBoxAdapter(
            child: MediaCenter(),
          )
        ],
      ),
    );
  }
}
