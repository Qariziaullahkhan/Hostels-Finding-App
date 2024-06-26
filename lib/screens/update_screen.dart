import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hostels_finder_app/utility/App_colors.dart';
import 'package:hostels_finder_app/widget/Custome_appbar.dart';
import 'package:hostels_finder_app/widget/Custome_buttton.dart';

import '../model/Hostels_facilities.dart';
import '../utility/flutter_toast.dart';
import '../widget/Custom_Textfield.dart';

class UpdateScreen extends StatefulWidget {
  final DocumentSnapshot taskSnapshot;
  const UpdateScreen({super.key, required this.taskSnapshot});

  @override
  State<UpdateScreen> createState() => _UpdateScreenState();
}

class _UpdateScreenState extends State<UpdateScreen> {
  final TextEditingController cityNamecontroller = TextEditingController();
  final TextEditingController HostelNamecontroller = TextEditingController();

  final TextEditingController ownerNamecontroller = TextEditingController();
  final TextEditingController contactNumbercontroller = TextEditingController();
  final TextEditingController seatsAvailablecontroller =
      TextEditingController();
  final TextEditingController rentPerSeatscontroller = TextEditingController();

  final TextEditingController toalroomscontroller = TextEditingController();
  var _formkey = GlobalKey<FormState>();
  String facilities = '';
  List<Facility> facilitiesList = [
    Facility(name: 'WiFi', value: false),
    Facility(name: 'Bath Rooms', value: false),
    Facility(name: 'UPS', value: false),
    Facility(name: 'Laundry', value: false),
    Facility(name: 'Generator', value: false),
    Facility(name: 'Meals', value: false),
    Facility(name: 'Hot Water', value: false),
    Facility(name: 'Room Cleaning', value: false),
    Facility(name: 'Gas in Rooms', value: false),
    Facility(name: 'Kitchen with Rooms', value: false),
  ];
  @override
  void initState() {
    cityNamecontroller.text = widget.taskSnapshot["CityName"];
    HostelNamecontroller.text = widget.taskSnapshot["HostelName"];
    ownerNamecontroller.text = widget.taskSnapshot["OwnerName"];

    contactNumbercontroller.text = widget.taskSnapshot["Phone"];
    seatsAvailablecontroller.text = widget.taskSnapshot["availablerooms"];
    rentPerSeatscontroller.text = widget.taskSnapshot["RentRooms"];
    toalroomscontroller.text = widget.taskSnapshot["totalrooms"];
    super.initState();
  }

  @override
  void dispose() {
    cityNamecontroller.dispose();
    HostelNamecontroller.dispose();
    ownerNamecontroller.dispose();
    contactNumbercontroller.dispose();
    seatsAvailablecontroller.dispose();
    rentPerSeatscontroller.dispose();
    toalroomscontroller.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Appcolors.bluecolor2,
      appBar: CustomAppbar(titleText: "Update Screen"),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, top: 20, right: 30),
        child: SingleChildScrollView(
          child: Form(
            key: _formkey,
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.only(right: 180),
                  child: Text(
                    "City Name *",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                CustomeTextField(
                  controller: cityNamecontroller,
                  hinttext: "Enter City Name",
                  labletext: "City Name",
                  icons: Icons.house,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "please Enter some text";
                    }
                    return null;
                  },
                ),
                const Padding(
                  padding: EdgeInsets.only(right: 150),
                  child: Text(
                    "Hostel Name *",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                CustomeTextField(
                  controller: HostelNamecontroller,
                  hinttext: "Enter Hostel Name",
                  labletext: "Hostel Name",
                  icons: Icons.edit,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "please Enter some text";
                    }
                    return null;
                  },
                ),
                const Padding(
                  padding: EdgeInsets.only(right: 150),
                  child: Text(
                    "Owner Name *",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                CustomeTextField(
                  controller: ownerNamecontroller,
                  hinttext: "Enter Owner Name",
                  labletext: "Owner Name",
                  icons: Icons.person,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "please Enter some text";
                    }
                    return null;
                  },
                ),
                // const Gap(10),

                // const Gap(10),
                const Padding(
                  padding: EdgeInsets.only(right: 130),
                  child: Text(
                    "Phone Number *",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                CustomeTextField(
                  controller: contactNumbercontroller,

                  hinttext: "Enter Contact Number",
                  labletext: "Contact Number",
                  icons: Icons.call,
                  textType: TextInputType.phone,
                  maxlength: 11,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "please Enter some text";
                    }
                    return null;
                  },
                  //  icon: Icons.person,
                ),
                const Padding(
                  padding: EdgeInsets.only(right: 150),
                  child: Text(
                    "Seats Available *",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                CustomeTextField(
                  controller: seatsAvailablecontroller,
                  hinttext: " Enter Seats Available",
                  labletext: "Seats Available",
                  textType: TextInputType.number,
                  maxlength: 3,
                  icons: Icons.bed,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "please Enter some text";
                    }
                    return null;
                  },
                ),
                const Padding(
                  padding: EdgeInsets.only(right: 150),
                  child: Text(
                    "Rent Per seats *",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                CustomeTextField(
                  controller: rentPerSeatscontroller,
                  hinttext: "Rent Per Seats Available",
                  labletext: "Seats Available",
                  icons: Icons.format_align_justify,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "please Enter some text";
                    }
                    return null;
                  },
                ),
                const Padding(
                  padding: EdgeInsets.only(right: 130),
                  child: Text(
                    "Total Rooms *",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                CustomeTextField(
                  controller: toalroomscontroller,

                  hinttext: "No of Rooms",
                  labletext: "No of Rooms",
                  icons: Icons.roofing,
                  textType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "please Enter some text";
                    }
                    return null;
                  },
                  //  icon: Icons.person,
                ),

                const Padding(
                  padding: EdgeInsets.only(right: 130),
                  child: Text(
                    "Hostels Facilites *",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  height: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.grey),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: () {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: const Text('Facilities'),
                                  content: Container(
                                    width:
                                        MediaQuery.of(context).size.width * 0.7,
                                    height: MediaQuery.of(context).size.height *
                                        0.8,
                                    margin: const EdgeInsets.all(20),
                                    child: StatefulBuilder(
                                      builder: (context, setState) {
                                        return ListView.builder(
                                            itemCount: facilitiesList.length,
                                            itemBuilder: (context, index) {
                                              //Facility facility = facilitiesList[index];

                                              return CheckboxListTile(
                                                  title: Text(
                                                      facilitiesList[index]
                                                          .name),
                                                  value: facilitiesList[index]
                                                      .value,
                                                  onChanged: (isChecked) {
                                                    print(isChecked);
                                                    setState(() {
                                                      facilitiesList[index]
                                                          .value = isChecked!;
                                                    });
                                                  });
                                            });
                                      },
                                    ),
                                  ),
                                  actions: [
                                    TextButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();

                                          setState(() {
                                            facilities = '';
                                            for (var facility
                                                in facilitiesList) {
                                              if (facility.value) {
                                                facilities +=
                                                    facility.name + ',';
                                              }
                                            }
                                          });
                                        },
                                        child: const Text('CANCEL')),
                                    TextButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();

                                          setState(() {
                                            facilities = '';
                                            for (var facility
                                                in facilitiesList) {
                                              if (facility.value) {
                                                facilities +=
                                                    facility.name + ',';
                                              }
                                            }
                                          });
                                        },
                                        child: const Text('OK')),
                                  ],
                                );
                              });
                        },
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Facilities'),
                            Icon(
                              Icons.arrow_drop_down,
                              color: Colors.black45,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Expanded(child: Text(facilities)),
                    ],
                  ),
                ),
                const Gap(10),
                const Gap(5),
                CustomeButton(
                  colors: Colors.indigo,
                    manisize: Size(150, 50),
                    onpressed: () async {
                      String CityName = cityNamecontroller.text.trim();
                      String HostelName = HostelNamecontroller.text.trim();
                      String OwnerName = ownerNamecontroller.text.trim();

                      String Phone = contactNumbercontroller.text.trim();
                      String availablerooms =
                          seatsAvailablecontroller.text.trim();
                      String RentRoms = rentPerSeatscontroller.text.trim();
                      String totalrooms = toalroomscontroller.text.trim();

                      String uid = FirebaseAuth.instance.currentUser!.uid;
                      int CreatedOn = DateTime.now().millisecondsSinceEpoch;
                      if (CityName.isEmpty ||
                          HostelName.isEmpty ||
                          OwnerName.isEmpty ||
                          Phone.isEmpty ||
                          availablerooms.isEmpty ||
                          RentRoms.isEmpty ||
                          totalrooms.isEmpty ||
                          facilities.isEmpty) {
                        Utils.toastmessage(
                            "Please provide all the fields", Colors.red);
                        return;
                      }
                      User? user = FirebaseAuth.instance.currentUser;
                      if (user != null) {
                        String uid = user.uid;
                        int CreatedOn = DateTime.now().millisecondsSinceEpoch;
                        FirebaseFirestore firebaseFirestore =
                            FirebaseFirestore.instance;

                        var taskref = FirebaseFirestore.instance
                            .collection("tasks")
                            .doc(uid)
                            .collection("hostledata")
                            .doc(widget.taskSnapshot["taskId"]);
                        try {
                          await taskref.update({
                            "taskId": taskref.id,
                            "CityName": CityName,
                            "HostelName": HostelName,
                            "OwnerName": OwnerName,
                            "Phone": Phone,
                            "availablerooms": availablerooms,
                            "RentRooms": RentRoms,
                            "totalrooms": totalrooms,
                            "facilities": facilities,
                            "CreatedOn": CreatedOn,
                          });
                          Utils.toastmessage(
                              "Hostels Data saved ", Colors.green);
                          Navigator.of(context).pop();
                        } catch (e) {
                          Utils.toastmessage(
                              "unsucces ${e.toString()}", Colors.red);
                        }
                      }
                    },
                    text: "Edit"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
