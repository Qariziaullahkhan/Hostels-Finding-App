import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';
import 'package:hostels_finder_app/screens/Add_hostels_screen.dart';
import 'package:hostels_finder_app/screens/catogory_screen.dart';
import 'package:hostels_finder_app/screens/profile_screen.dart';
import 'package:hostels_finder_app/widget/Custom_drawer.dart';
import 'package:hostels_finder_app/widget/Custome_buttton.dart';

import '../utility/App_colors.dart';
import '../utility/Get_human_date_changes.dart';
import 'update_screen.dart';

class HostelListScreen extends StatefulWidget {
  const HostelListScreen({super.key});

  @override
  State<HostelListScreen> createState() => _HostelListScreenState();
}

class _HostelListScreenState extends State<HostelListScreen> {
  CollectionReference? taskRef;
  @override
  void initState() {
    String uid = FirebaseAuth.instance.currentUser!.uid;
    taskRef = FirebaseFirestore.instance
        .collection('tasks')
        .doc(uid)
        .collection('hostledata');

    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: Colors.grey[300],
      // backgroundColor: Appcolors.bluecolor2,
           drawer:const  NDrawer(),

      
      appBar: AppBar(
        
        // centerTitle: true,
        // automaticallyImplyLeading: false,
        title: const Text(
          "Hostels List",
          style: TextStyle(
              fontSize: 25, color: Colors.white, fontWeight: FontWeight.bold),
        ),
        
        
      
      actions: [
          
          IconButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: const Text('Confirmation'),
                        content: const Text('Are you sure to Logout ?'),
                        actions: [
                          TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text('No')),
                          TextButton(
                              onPressed: () async {
                                Navigator.pop(context);

                                await FirebaseAuth.instance.signOut();

                                Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(builder: (context) {
                                  return const NextScreen();
                                }));
                              },
                              child: const Text('Yes')),
                        ],
                      );
                    });
              },
              icon: const Icon(
                Icons.logout,
                color: Colors.red,
              )),
        ],
        
      ),
       floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.blue,
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) {
            return const AddHostelsScreen();
          }));
        },
        label: const Text("Add Hostels data"),
        icon: Icon(Icons.add),
      ),
   
      body: StreamBuilder<QuerySnapshot>(
          stream: taskRef?.snapshots(),
          builder: (context, snapshhot) {
            if (snapshhot.hasData) {
              List tasksList = snapshhot.data!.docs;
              if (tasksList.isEmpty) {
                return const Center(
                  child: Text(
                    'No Hostels Data is saved',
                    style: TextStyle(fontSize: 20, color: Colors.green),
                  ),
                );
              } else {
                return Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: tasksList.length,
                      itemBuilder: ((context, index) {
                        print(
                            "*********************************************************");
                        print(snapshhot.data!.docs.length);
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Card(
                                color: Colors.white,
                                child: Container(
                                  height: 500,
                                  width: 700,
                                  // color: Colors.pink,
                                  decoration: BoxDecoration(
                                      // gradient: const LinearGradient(colors: [
                                      //   Colors.red,
                                      //   Colors.purple,
                                      //   Colors.pink,
                                      //   Colors.green,
                                      //   Colors.deepPurple,
                                      // ]),
                                      borderRadius: BorderRadius.circular(20)),
                                
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      // Row(
                                      //   mainAxisAlignment:
                                      //       MainAxisAlignment.spaceEvenly,
                                      //   children: [
                                      //     Container(
                                      //       height: 20,
                                      //       width: 100,
                                      //       //color: Colors.green,
                                      //       child: const Text(
                                      //         "Task Id:",
                                      //         style: TextStyle(
                                      //             fontWeight: FontWeight.bold),
                                      //       ),
                                      //     ),
                                      //     Container(
                                      //         height: 20,
                                      //         width: 100,
                                      //         // color: Colors.amber,
                                      //         child: Text(
                                      //             tasksList[index]["taskId"])),
                                      //   ],
                                      // ),
                                      const Gap(100),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Container(
                                            height: 20,
                                            width: 100,
                                
                                            //color: Colors.green,
                                            child: const Text(
                                              "City Name:",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                          Container(
                                              height: 20,
                                              width: 100,
                                              // color: Colors.amber,
                                              child: Text(
                                                  tasksList[index]["CityName"])),
                                        ],
                                      ),
                                      const Gap(5),
                                
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Container(
                                            height: 20,
                                            width: 100,
                                            //color: Colors.green,
                                            child: const Text(
                                              "Hostel Name:",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                          Container(
                                              height: 20,
                                              width: 100,
                                              // color: Colors.amber,
                                              child: Text(tasksList[index]
                                                  ["HostelName"])),
                                        ],
                                      ),
                                      const Gap(5),
                                
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Container(
                                            height: 20,
                                            width: 100,
                                            //color: Colors.green,
                                            child: const Text(
                                              "Owner Name:",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                          Container(
                                              height: 20,
                                              width: 100,
                                              // color: Colors.amber,
                                              child: Text(
                                                  tasksList[index]["OwnerName"])),
                                        ],
                                      ),
                                      const Gap(5),
                                
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Container(
                                            height: 20,
                                            width: 100,
                                            //color: Colors.green,
                                            child: const Text(
                                              "PhoneNumber:",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                          Container(
                                              height: 20,
                                              width: 100,
                                              // color: Colors.amber,
                                              child: Text(
                                                  tasksList[index]["Phone"])),
                                        ],
                                      ),
                                      const Gap(5),
                                
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Container(
                                            height: 20,
                                            width: 100,
                                            //color: Colors.green,
                                            child: const Text(
                                              "AvailableRooms:",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                          Container(
                                              height: 20,
                                              width: 100,
                                              // color: Colors.amber,
                                              child: Text(tasksList[index]
                                                  ["availablerooms"])),
                                        ],
                                      ),
                                      const Gap(5),
                                
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Container(
                                            height: 20,
                                            width: 100,
                                            //color: Colors.green,
                                            child: const Text(
                                              "Rent Rooms:",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                          Container(
                                              height: 20,
                                              width: 100,
                                              // color: Colors.amber,
                                              child: Text(
                                                  tasksList[index]["RentRooms"])),
                                        ],
                                      ),
                                      const Gap(5),
                                
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Container(
                                            height: 20,
                                            width: 100,
                                            child: const Text(
                                              "Total Rooms:",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                          Container(
                                            height: 20,
                                            width: 100,
                                            child: Text(
                                                tasksList[index]["totalrooms"]),
                                          ),
                                        ],
                                      ),
                                      
                                      // Row(
                                      //   mainAxisAlignment:
                                      //       MainAxisAlignment.spaceEvenly,
                                      //   children: [
                                      //     Container(
                                      //       height: 20,
                                      //       width: 100,
                                      //       child: const Text(
                                      //         "Photos:",
                                      //         style: TextStyle(
                                      //             fontWeight: FontWeight.bold),
                                      //       ),
                                      //     ),
                                      //     Container(
                                      //       height: 20,
                                      //       width: 100,
                                      //       child: Text(
                                      //           tasksList[index]["photos"]),
                                      //     ),
                                      //   ],
                                      // ),
                                      const Gap(5),
                                
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Container(
                                            height: 20,
                                            width: 100,
                                            child: const Text(
                                              "Date:",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                          Container(
                                              height: 20,
                                              width: 100,
                                              child: Text(
                                                  Utility.getHumanReadableDate(
                                                      tasksList[index]
                                                          ["CreatedOn"]))),
                                        ],
                                      ),
                                      const Gap(5),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Container(
                                            height: 20,
                                            width: 100,
                                            child: const Text(
                                              "Facilities:",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                          Container(
                                            height: 20,
                                            width: 100,
                                            child: Text(snapshhot
                                                .data!.docs[index]["facilities"]),
                                      ),
                                        ],
                                      ),    
                                      const Gap(30),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 20),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            CustomeButton(
                                              colors: Colors.red,
                                              manisize: Size(130, 40),
                                              onpressed: () {
                                                showDialog(
                                                    barrierDismissible: false,
                                                    context: context,
                                                    builder: (ctx) {
                                                      return AlertDialog(
                                                        title: const Text(
                                                            'Confirmation !!!'),
                                                        content: const Text(
                                                            'Are you sure to delete ? '),
                                                        actions: [
                                                          TextButton(
                                                              onPressed: () {
                                                                Navigator.of(ctx)
                                                                    .pop();
                                                              },
                                                              child: const Text(
                                                                  'No')),
                                                          TextButton(
                                                              onPressed:
                                                                  () async {
                                                                Navigator.of(ctx)
                                                                    .pop();
                                
                                                                if (taskRef !=
                                                                    null) {
                                                                  await taskRef!
                                                                      .doc(
                                                                          '${tasksList[index]['taskId']}')
                                                                      .delete();
                                                                }
                                                              },
                                                              child: const Text(
                                                                  'Yes')),
                                                        ],
                                                      );
                                                    });
                                              },
                                              
                                           text: "Delete",
                                            ),
                                            CustomeButton(
                                              colors: Colors.indigo,
                                                manisize: Size(130, 40),
                                                onpressed: () {
                                                  Navigator.of(context).push(
                                                      MaterialPageRoute(
                                                          builder: (context) {
                                                    return UpdateScreen(
                                                        taskSnapshot:
                                                            tasksList[index]);
                                                  }));
                                                },
                                                text: "Edit")
                                          ],
                                        ),
                                      ),
                                      //c  Text("salman khan")
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        );
                      })),
                );
              }
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }
}
