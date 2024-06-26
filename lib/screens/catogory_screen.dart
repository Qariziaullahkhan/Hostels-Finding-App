import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:gap/gap.dart';
import 'package:hostels_finder_app/screens/Login_screen.dart';
import 'package:hostels_finder_app/widget/Custome_appbar.dart';
import 'package:hostels_finder_app/widget/Custome_buttton.dart';

import '../utility/App_colors.dart';
import 'get_current_location.dart';

class NextScreen extends StatefulWidget {
  const NextScreen({super.key});

  @override
  State<NextScreen> createState() => _NextScreenState();
}

class _NextScreenState extends State<NextScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Appcolors.bluecolor2,
      appBar: CustomAppbar(titleText: "Select Your Catagory"),
      body: Padding(
        padding: const EdgeInsets.only(left: 70, top: 100),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Select Your ",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.w700),
              ),
              const Text(
                "Catagory",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.w700),
              ),
              const Gap(250),
              CustomeButton(
                colors: Colors.black,
                  manisize: const Size(200, 53),
                  onpressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const LoginScreen()));
                  },
                  text: "Warden"),
              const Gap(30),
              CustomeButton(
                colors: Colors.black,
                  manisize: const Size(200, 53),
                  onpressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const GetCurrentLocation()));
                  },
                  text: "Students"),
            ],
          ),
        ),
      ),
    );
  }
}
