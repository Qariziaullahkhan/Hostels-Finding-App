import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hostels_finder_app/screens/Google_Map_screen.dart';
import 'package:hostels_finder_app/screens/Login_screen.dart';
import 'package:hostels_finder_app/screens/Splash_screen.dart';
import 'package:hostels_finder_app/screens/get_current_location.dart';
import 'package:hostels_finder_app/screens/hostels_list_screen.dart';
import 'package:hostels_finder_app/screens/on_boaring_screen.dart';
import 'package:hostels_finder_app/utility/App_colors.dart';
import 'package:provider/provider.dart';

import 'providers/login_providers.dart';
import 'providers/register_providers.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyBGXNnl4vb-_-KD9azKSWr8YZM3fO3_hdw",
          appId: "1:486065316976:android:061978728e8f10f76c40b5",
          messagingSenderId: "486065316976",
          projectId: "hostels-finders-app",
          storageBucket: "hostels-finders-app.appspot.com"));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
          ChangeNotifierProvider(create: (context) => SignupProvider()),
                ChangeNotifierProvider(create: (context) => LoginProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primaryColor: Appcolors.primaryColor,
          appBarTheme: const AppBarTheme(
            backgroundColor: Appcolors.primaryColor,
          ),
          useMaterial3: true,
        ),
        //home: const HostelListScreen(),
        home: (FirebaseAuth.instance.currentUser != null &&
                FirebaseAuth.instance.currentUser!.emailVerified)
            ? const GetCurrentLocation()
            : OnBoardingScreen(),
      ),
    );
  }
}
