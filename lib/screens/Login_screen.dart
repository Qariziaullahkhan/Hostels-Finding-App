import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gap/gap.dart';
import 'package:hostels_finder_app/screens/Email_verify_screen.dart';
import 'package:hostels_finder_app/screens/Signup_screen.dart';
import 'package:hostels_finder_app/screens/forgot_password_screen.dart';
import 'package:hostels_finder_app/screens/hostels_list_screen.dart';
import 'package:hostels_finder_app/utility/App_colors.dart';
import 'package:hostels_finder_app/utility/flutter_toast.dart';
import 'package:hostels_finder_app/widget/Custom_Textfield.dart';
import 'package:hostels_finder_app/widget/Custome_appbar.dart';
import 'package:hostels_finder_app/widget/Custome_buttton.dart';
import 'package:ndialog/ndialog.dart';
import 'package:provider/provider.dart';

import '../providers/login_providers.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final  emailcontroller = TextEditingController();
  final  passwordcontroller = TextEditingController();
  var _formkey = GlobalKey<FormState>();
  bool rememeberMe = false;

  bool _isvisiblity = true;
  @override
  Widget build(BuildContext context) {
        final loginProvider = Provider.of<LoginProvider>(context); 
        print("Build");
    return Scaffold(
      // backgroundColor: Appcolors.bluecolor2,
      appBar: CustomAppbar(titleText: "Login Screen"),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
            left: 20,
            right: 30,
            top: 40,
          ),
          child: Form(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Padding(
                  padding: EdgeInsets.only(right: 200),
                  child: Text(
                    "Email *",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                CustomeTextField(
                  controller: emailcontroller,
                  hinttext: "Enter Your Email",
                  labletext: "Email",
                  icons: Icons.person,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "please Enter some text";
                    }
                    bool emailValid = RegExp(
                            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                        .hasMatch(emailcontroller.text);
                    if (!emailValid) {
                      return "Please enter Vaild email";
                    }
                    return null;
                  },
                ),
                const Padding(
                  padding: EdgeInsets.only(right: 180),
                  child: Text(
                    "Password *",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please Enter a Password";
                    }
                    return null;
                  },
                  controller: passwordcontroller,
                  obscureText: _isvisiblity,
                  // style: const TextStyle(
                  //   fontStyle: FontStyle.italic,
                  //   fontSize: 20,
                  //   fontWeight: FontWeight.normal,
                  // ),
                  decoration: InputDecoration(
                      hintText: "Password",
                      labelText: "Password",
                      filled: true,
                      prefixIcon: const Icon(Icons.lock),
                      suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              _isvisiblity = !_isvisiblity;
                            });
                          },
                          icon: _isvisiblity
                              ? const Icon(
                                  Icons.visibility,
                                  color: Colors.black,
                                )
                              : const Icon(
                                  Icons.visibility_off,
                                  color: Colors.black,
                                )),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      )),
                                 
                ),

                const Gap(20),
                CustomeButton(
                  colors: Colors.black,
                  manisize: const Size(200, 53),
                  onpressed: () async {


                      if (!_formkey.currentState!.validate()) {
                      return;
                    }
                    loginProvider.isLoading = true;
                    await loginProvider.login(emailcontroller.text.trim(), passwordcontroller.text.trim()
                    
                    
                    );
                    loginProvider.isLoading = false;
                    String Email = emailcontroller.text.trim();
                    String Password = passwordcontroller.text.trim();

                    if (Email.isEmpty || Password.isEmpty) {
                      Utils.toastmessage(
                          "Please all the fields", Colors.indigo);
                      //show error toast
                      return;
                    }
                    if (Password.length < 8) {
                      Utils.toastmessage(
                          "password length is less than 8", Colors.red);
                      // show error taost
                      return;
                    }
                    ProgressDialog progressDialog = ProgressDialog(context,
                        title: const Text("Logging in up"),
                        message: const Text("please provide"));
                    progressDialog.show();

                    try {
                      FirebaseAuth auth = FirebaseAuth.instance;
                      UserCredential? userCredential =
                          await auth.signInWithEmailAndPassword(
                              email: Email, password: Password);
                      if (userCredential.user!.emailVerified) {
                        progressDialog.dismiss();

                        Navigator.of(context).pushReplacement(
                            MaterialPageRoute(builder: (context) {
                          return const HostelListScreen();
                        }));
                      } else {
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (context) {
                          return EmailVerficationScreen();
                        }));
                      }
                    } on FirebaseAuthException catch (e) {
                      if (e.code == 'user-not-found') {
                        //Utils.showo
                        Fluttertoast.showToast(
                            msg: "user not found", fontSize: 30);
                      } else {
                        if (e.code == "email-already-in-use") {
                          Fluttertoast.showToast(
                              msg: "${e.message} ", fontSize: 30);
                          // Utils.toastmessage("Wrong Password",);
                        }
                      }
                    } catch (e) {
                      progressDialog.dismiss();
                      Fluttertoast.showToast(msg: "wrong password");
                    }
                    // if (_formkey.currentState!.validate()) ;
                  },
                  text: "Sign In",
                ),
                const Gap(20),
                CustomeButton(
                  
                  colors: Colors.black,
                    manisize: const Size(200, 53),
                    onpressed: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) {
                        return const SignUpScreen();
                      }));
                    },
                    text: "Sign Up"),
                const Gap(20),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Checkbox(
                      value: rememeberMe,
                      onChanged: (value) {
                        setState(() {
                          rememeberMe = value!;
                        });
                      },
                    ),
                    const Text(
                      'Remember me ',
                      style: TextStyle(
                          fontSize: 15, fontWeight: FontWeight.normal),
                    ),
                    const Gap(5),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: TextButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => ForgotPasswordScreen()));
                          },
                          child: const Text(
                            "Forgot Password?",
                            style:
                                TextStyle(fontSize: 15, color: Colors.lightBlueAccent),
                          )),
                    ),
                  ],
                ),
                const Gap(20),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   children: [
                //     const Text("Dont't have an account ?"),
                //     TextButton(
                //         onPressed: () {
                //           Navigator.of(context).push(MaterialPageRoute(
                //               builder: (context) => const SignUpScreen()));
                //         },
                //         child: const Text(
                //           "Sign up",
                //           style: TextStyle(fontSize: 20, color: Colors.white),
                //         )),
                //   ],
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
