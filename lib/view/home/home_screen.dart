import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather/view/home/components/app_bar.dart';
import 'package:weather/view/home/components/container_list.dart';
import 'package:weather/view/home/components/hours_list.dart';
import 'package:weather/view/home/components/info_card.dart';
import 'package:weather/view/home/components/location.dart';
import 'package:weather/view_model/controllers/home_controller.dart';

import 'components/bottom_list.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: ListView(
            children: [
              const SizedBox(
                height: 20,
              ),
              const CustomAppBar(),
              const SizedBox(
                height: 20,
              ),
              Location(),
              InfoCard(),
              ContainerList(),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  'Today',
                  style: GoogleFonts.poppins(
                      color: Colors.black, fontWeight: FontWeight.w500, fontSize: 25),
                ),
              ),
              HoursList(),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  'Next 14 Days',
                  style: GoogleFonts.poppins(
                      color: Colors.blueGrey, fontWeight: FontWeight.w500, fontSize: 25),
                ),
              ),
              BottomList(),
            ],
          ),
        ),
      ),
    );
  }
}
