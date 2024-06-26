import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hostels_finder_app/screens/hostels_list_screen.dart';
import 'package:hostels_finder_app/screens/profile_screen.dart';
import 'package:share_plus/share_plus.dart';

import '../screens/catogory_screen.dart';

class NDrawer extends StatefulWidget {
  const NDrawer({super.key});

  @override
  State<NDrawer> createState() => _NDrawerState();
}

class _NDrawerState extends State<NDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
backgroundColor: Colors.white,
      child: ListView(
        children: [
       DrawerHeader(
        
        padding: EdgeInsets.zero,
        child: Container(
         color: Theme.of(context).primaryColor,
 padding: const EdgeInsets.only(left: 20),
 child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
  children: [
   const   CircleAvatar(
        backgroundImage: AssetImage("assets/images/zia.jpg"),
        radius: 50,
      ),
                    const SizedBox(height: 10,),
                    Text(FirebaseAuth.instance.currentUser!.email!, style: const TextStyle(color: Colors.white),),
  ],
 ),
       )),
       ListTile(
        leading: const Icon(Icons.home),
        
        title: Text("Home"),
        onTap: () {
          Navigator.of(context).push(
                                    MaterialPageRoute(builder: (context) {
                                  return const HostelListScreen();
                                }));
        },
       ),
         ListTile(
        leading: const Icon(Icons.person),
        title: Text("Profile"),
        onTap: () {
           Navigator.of(context).push(
                                    MaterialPageRoute(builder: (context) {
                                  return const Profile_Screen();
                                }));
        
        },
       ),
         ListTile(
        leading: const Icon(Icons.logout),
        title: Text("Log Out"),
        onTap: () {
           showDialog(context: context, builder: (context){
            return AlertDialog(
                title:  Text('Confirmation'),
                        content:  Text('Are you sure to Logout ?'),
                        actions: [
                          TextButton(onPressed: (){
                            Navigator.of(context).pop();
                          }, child: const Text("No")),
                               TextButton(
                              onPressed: () async {
                                Navigator.pop(context);

                                await FirebaseAuth.instance.signOut();

                                Navigator.of(context).push(
                                    MaterialPageRoute(builder: (context) {
                                  return const NextScreen();
                                }));
                              },
                              child: const Text('Yes')),

                        ],
            );
          });
              
        },
       ),
          ListTile(
        leading: const Icon(Icons.settings),
        title: Text("Settings"),
        onTap: () {
          Navigator.of(context);
        },
       ),
          ListTile(
            leading: const Icon(Icons.share),
            title: const Text('Share App'),
            onTap: () {
              Navigator.of(context).pop();
              Share.share('install the app https://play.google.com/store/apps/details?id=com.bucks.hostel_finder_noor_rehman', subject: 'Hostel Finder!');

              },
          ),
        ],
      ),
    );
  }
}