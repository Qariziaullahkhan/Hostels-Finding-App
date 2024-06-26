import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hostels_finder_app/screens/catogory_screen.dart';
import 'package:hostels_finder_app/utility/Splash_services.dart';
import 'package:hostels_finder_app/widget/Custome_appbar.dart';
import 'package:hostels_finder_app/widget/Custome_buttton.dart';

import '../utility/App_colors.dart';

class SpalshScreen extends StatefulWidget {
  const SpalshScreen({super.key});

  @override
  State<SpalshScreen> createState() => _SpalshScreenState();
}

class _SpalshScreenState extends State<SpalshScreen> {
  SplashServices splashscreen = SplashServices();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Appcolors.bluecolor2,
      appBar: const CustomAppbar(
        titleText: "Spalsh Screen",
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 300,
              height: 200,
              child: const Image(image: AssetImage("assets/images/hostel.png")),
            ),
            const Gap(30),
            const Text(
              "WELCOME To",
              style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
            // const Gap(20),
            const Center(
              child: Padding(
                padding: EdgeInsets.only(left: 20),
                child: Text(
                  "Hostels Finder App",
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
              ),
            ),
            const Gap(20),
            const Text(
              "We, re",
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w400,
                  color: Colors.white),
            ),
            const Text(
              "Finding",
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w400,
                  color: Colors.white),
            ),
            const Text(
              "on a hostel",
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w400,
                  color: Colors.white),
            ),
            const Text(
              "Are you in?",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                  color: Colors.white),
            ),
            const Gap(20),
            CustomeButton(
              colors: Colors.black,
                manisize: Size(200, 53),
                onpressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const NextScreen()));
                  // splashscreen.islogin(context);
                },
                text: "Get Started"),
          ],
        ),
      ),
    );
  }
}
