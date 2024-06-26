import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gap/gap.dart';
import 'package:hostels_finder_app/providers/register_providers.dart';
import 'package:hostels_finder_app/screens/Google_Map_screen.dart';
import 'package:hostels_finder_app/screens/Login_screen.dart';
import 'package:hostels_finder_app/utility/flutter_toast.dart';
import 'package:hostels_finder_app/widget/Custom_Textfield.dart';
import 'package:hostels_finder_app/widget/Custome_appbar.dart';
import 'package:hostels_finder_app/widget/radio_button_row.dart';
import 'package:ndialog/ndialog.dart';
import 'package:provider/provider.dart';

import '../utility/App_colors.dart';
import '../utility/network_connection.dart';
import '../widget/Custome_buttton.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final  namecontroller = TextEditingController();
  final  emailcontroller = TextEditingController();

  final  passwordcontroller = TextEditingController();
  final  confirmpasswordcontroller =  TextEditingController();
  String? selectedGender;
  String Gender = "Male";
  var _formkey = GlobalKey<FormState>();
  bool rememeberMe = false;
  bool _isvisiblity = true;

  @override
  Widget build(BuildContext context) {
        final signupProvider = Provider.of<SignupProvider>(context);
         print("Build");

    return Scaffold(
      // backgroundColor: Appcolors.bluecolor2,
      appBar: CustomAppbar(titleText: "SignUp Screen"),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 30, top: 20),
        child: SingleChildScrollView(
          child: Form(
            key: _formkey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Padding(
                  padding: EdgeInsets.only(right: 220),
                  child: Text(
                    "Name *",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                CustomeTextField(
                  controller: namecontroller,
                  hinttext: "Name",
                  labletext: "Name",
                  icons: Icons.person,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "please Enter some text";
                    }
                    return null;
                  },
                  
                ),
                const Padding(
                  padding: EdgeInsets.only(right: 220),
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
                  hinttext: "Email",
                  labletext: "Email",
                  
                  icons: Icons.email,


                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "please Enter some text";
                    }
                    return null;
                  },
                
                  //icon: Icons.person,
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
                  //   fontWeight: FontWeight.w400,
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
                                  toolbarOptions: ToolbarOptions(
copy: true,
cut: true,
paste:true,
selectAll: true,
),
                ),

                const Gap(20),
                const Padding(
                  padding: EdgeInsets.only(right: 100),
                  child: Text(
                    "Confirm Password *",
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
                  controller: confirmpasswordcontroller,
                  
                  obscureText: _isvisiblity,
                  // style: const TextStyle(
                  //   fontStyle: FontStyle.italic,
                  //   fontSize: 20,
                  //   fontWeight: FontWeight.w400,
                  // ),
                  decoration: InputDecoration(
                      hintText: " Confirm Password",
                      labelText: " Confirm Password",
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
                const RadioButtonRow(),
                const Gap(5),
                Row(
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
                      'I agree to the terms & conditions? ',
                      style: TextStyle(
                          color: Colors.blue,
                          fontSize: 15,
                          fontWeight: FontWeight.normal),
                    ),
                  ],
                ),
                const Gap(20),
                CustomeButton(
                  colors: Colors.black,
                  manisize: Size(300, 50),
                  onpressed: () async {



             if (!_formkey.currentState!.validate()) {
                      return;
                    }
                   
                  signupProvider.isLoading = true; 
                  await signupProvider.signup(
                    signupProvider.name,
                    signupProvider.email,
                    signupProvider.password,
                  );

                    String Name = namecontroller.text.trim();
                    String Email = emailcontroller.text.trim();
                    String Password = passwordcontroller.text.trim();
                    String Confirmpassword =
                        confirmpasswordcontroller.text.trim();

                    if (Name.isEmpty ||
                        Email.isEmpty ||
                        Password.isEmpty ||
                        Confirmpassword.isEmpty) {
                      Utils.toastmessage(
                          "Please all the fields", Colors.indigo);
                      return;
                    }
                   
                    if (Password.length < 8) {
                      Utils.toastmessage(
                          "please enter your password at least 10 characters",
                          Colors.redAccent);
                      return;
                    }
                    if (Password != Confirmpassword) {
                      Utils.toastmessage("Password do not match", Colors.red);
                      return;
                    }
                    if( !EmailValidator.validate(Email)){
                        Fluttertoast.showToast(msg: 'Invalid Email Address', backgroundColor: Colors.red, gravity: ToastGravity.CENTER);
                        return;
                      }

                    ProgressDialog progressDialog = ProgressDialog(context,
                        title: const Text("Signing up"),
                        message: const Text("Please provide"));
                    progressDialog.show();
                    try {
                      FirebaseAuth auth = FirebaseAuth.instance;
                      UserCredential? userCredential =
                          await auth.createUserWithEmailAndPassword(
                              email: Email, password: Password);
                      if (userCredential.user != null) {
                        FirebaseFirestore firebaseFirestore =
                            FirebaseFirestore.instance;
                        await firebaseFirestore
                            .collection("users")
                            .doc(userCredential.user!.uid)
                            .set({
                          "Name": Name,
                          "Email": Email,
                          // "Phone": Phone,
                          "Gender": Gender,
                          "Password": Password,
                          "Confirmpassword": Confirmpassword,
                          "uid": userCredential.user!.uid,
                          "CreatedOn": DateTime.now().microsecondsSinceEpoch
                        });
                      
                        if (_formkey.currentState!.validate())
                          int createdOn = DateTime.now().microsecondsSinceEpoch;
                        Utils.toastmessage("Succesful", Colors.purple);
                      

                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const LoginScreen()));
                      } else {
                        progressDialog.dismiss();
                        Utils.toastmessage("Failed", Colors.red);
                      }
                    } on FirebaseAuthException catch (e) {
                      progressDialog.dismiss();
                   
                      if (e.code == "Email is already use in") {
                        Utils.toastmessage(
                            "Email is already - in _use", Colors.deepPurple);
                      } else {
                        if (e.code == "weak password") {
                          Utils.toastmessage("Weak Password", Colors.red);
                        }
                      }
                    } catch (e) {
                      progressDialog.dismiss();
                      Utils.toastmessage("Something Went wrong", Colors.red);
                    }
                  },
                  text: "Submit",
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Already have an account ?"),
                    TextButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => LoginScreen()));
                        },
                        child: const Text(
                          "Login in",
                          style: TextStyle(fontSize: 15, color: Colors.indigo),
                        )),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
