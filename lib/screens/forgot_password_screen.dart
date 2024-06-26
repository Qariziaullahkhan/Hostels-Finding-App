import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hostels_finder_app/utility/App_colors.dart';
import 'package:hostels_finder_app/utility/flutter_toast.dart';
import 'package:hostels_finder_app/widget/Custom_Textfield.dart';
import 'package:hostels_finder_app/widget/Custome_appbar.dart';
import 'package:hostels_finder_app/widget/Custome_buttton.dart';

class ForgotPasswordScreen extends StatefulWidget {
  ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final TextEditingController emailcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Appcolors.bluecolor2,
      appBar: const CustomAppbar(titleText: "Forgot Password"),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.only(right: 100),
              child: Text(
                "Forgot Password *",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            CustomeTextField(
                controller: emailcontroller,
                hinttext: "Enter Email",
                labletext: "Email",
                icons: Icons.email),
            const Gap(20),
            CustomeButton(
              colors: Colors.green,
                manisize: Size(200, 53),
                onpressed: () {
                  String Email = emailcontroller.text.trim();
                  FirebaseAuth auth = FirebaseAuth.instance;
                  auth.sendPasswordResetEmail(email: Email).then((value) {
                    Utils.toastmessage(
                        "we have send email to recover passwrod: Please email check",
                        Colors.blue);
                    Navigator.of(context).pop();
                  }).onError((error, stackTrace) {
                    Utils.toastmessage(error.toString(), Colors.red);
                  });
                },
                text: "Send")
          ],
        ),
      ),
    );
  }
}
