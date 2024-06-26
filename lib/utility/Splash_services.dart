import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hostels_finder_app/screens/Login_screen.dart';
import 'package:hostels_finder_app/screens/catogory_screen.dart';

class SplashServices {
  void islogin(BuildContext context) {
    Timer.periodic(const Duration(seconds: 10), (timer) {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => const LoginScreen()));
    });
  }
}
