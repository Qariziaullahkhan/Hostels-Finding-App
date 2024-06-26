import 'dart:io';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:hostels_finder_app/model/Hostels_facilities.dart';
import 'package:hostels_finder_app/utility/flutter_toast.dart';
import 'package:hostels_finder_app/widget/Custom_Textfield.dart';
import 'package:hostels_finder_app/widget/Custome_appbar.dart';
import 'package:hostels_finder_app/widget/Custome_buttton.dart';
import 'package:image_picker/image_picker.dart';

import '../utility/App_colors.dart';

class AddHostelsScreen extends StatefulWidget {
  const AddHostelsScreen({super.key});

  @override
  State<AddHostelsScreen> createState() => _AddHostelsScreeState();
}

class _AddHostelsScreeState extends State<AddHostelsScreen> {
  final TextEditingController cityNamecontroller = TextEditingController();
  final TextEditingController HostelNamecontroller = TextEditingController();

  final TextEditingController ownerNamecontroller = TextEditingController();
  final TextEditingController contactNumbercontroller = TextEditingController();
  final TextEditingController seatsAvailablecontroller =
      TextEditingController();
  final TextEditingController rentPerSeatscontroller = TextEditingController();

  final TextEditingController toalroomscontroller = TextEditingController();
  String facilities = '';
   bool imagePicked = false;
  File? imageFile;
  List<File>? imageFiles;
   List<Object> photos = [];
  // String _Hostelsfacilites = Facilities[0];
  var _formkey = GlobalKey<FormState>();

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
   _pickMultiplesImages() async {
    List<XFile>? xFiles = await ImagePicker().pickMultiImage();

    if (xFiles.isEmpty) return;

    imageFiles = [];
    for (var xFile in xFiles) {
      imageFiles?.add(File(xFile.path));
    }

    imagePicked = true;
    setState(() {});

  }

  _pickImageFrom({required ImageSource source}) async {
    XFile? xFile = await ImagePicker().pickImage(source: source);

    if (xFile == null) return;

    final tempImage = File(xFile.path);

    imageFile = tempImage;
    imagePicked = true;
    setState(() {});
  }

  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Appcolors.bluecolor2,
      appBar: CustomAppbar(titleText: "Add Hostels"),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 30, top: 20),
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
                  textType: TextInputType.number,
                  maxlength: 5,
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
                                  title: const Text('Facilities avaialble '),
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
             
                const Gap(10),
                 Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  height: 150,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.purple,width: 3),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                          onTap: () {
                            _pickMultiplesImages();
                          },
                          child: const Text('Hostels Photo - Tap to Select')),
                      const SizedBox(
                        height: 10,
                      ),
                      imagePicked == false
                          ? const SizedBox.shrink()
                          : Expanded(
                            child: GridView.builder(
                                itemCount: imageFiles!.length,
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 3,
                                  crossAxisSpacing: 5,
                                      mainAxisSpacing: 5,
                                ),
                                itemBuilder: (context, index) {
                                  return Image.file(imageFiles![index], fit: BoxFit.cover,);
                                }),
                          )
                     
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomeButton(
                  colors: Colors.black,
                    manisize: Size(200, 53),
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
                       await Future.forEach(imageFiles!, (File image) async {
        
                              var fileName = 'Hostels${Random().nextInt(1000000)}';
        
                              Reference ref = FirebaseStorage.instance
                                  .ref()
                                  .child('Hostels')
                                  .child(fileName);
                              final UploadTask uploadTask = ref.putFile(image);
                              final TaskSnapshot taskSnapshot = await uploadTask.whenComplete(() {});
                              final url = await taskSnapshot.ref.getDownloadURL();
                              photos.add(url);
                              print(photos);
                            });
        
                          
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
                            .doc();
                        try {
                          await taskref.set({
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
                             "photos":photos,
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
                    text: "Save"),

               
              ],
            ),
          ),
        ),
      ),
    );
  }
}
