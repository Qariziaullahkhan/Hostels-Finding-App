import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hostels_finder_app/screens/get_current_location.dart';
import 'package:hostels_finder_app/widget/Custome_appbar.dart';
import 'package:hostels_finder_app/widget/alert_dialog.dart';
import 'package:hostels_finder_app/widget/screen_design_values.dart';

import '../widget/Custom_Rows.dart';

class MarkerDetailScreen extends StatefulWidget {
  const MarkerDetailScreen({super.key});

  @override
  State<MarkerDetailScreen> createState() => _MarkerDetailScreenState();
}

class _MarkerDetailScreenState extends State<MarkerDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        
        appBar: const CustomAppbar(titleText: "Hostels Details"),
         
          body: screenDesign(
              context: context,
              widget: Column(
                children: [
                // const   SizedBox(
                //     height: 100,
                //   ),
                  const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Text(
                      //   " Hostels Details",
                      //   style: TextStyle(
                      //       fontSize: 30,
                      //       fontWeight: FontWeight.w500,
                      //       color: Colors.black),
                      // ),
                    ],
                  ),
                // const  SizedBox(
                //     height: 80,
                //   ),
                  Container(
                    height: 577,
                    width: 359,
                    decoration: BoxDecoration(
                      color: Colors.yellow,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      children: [
                        Container(
                            height: 210,
                            width: 359,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: const GetCurrentLocation()),
                        customRow(title: "City Name:", value: "Peshawar"),
                        customRow(title: "Hostel Name: ", value: "Buttler Hostels"),
                        customRow(title: "Owner Name:", value: "Zia Ullah"),
                        customRow(title: "Phone:", value: "0315 8779341"),
                        customRow(title: "AvailableRoom:", value: "5"),
                        customRow(title: "Rent Rooms:", value: "12000"),
                        customRow(title: "Total Rooms:", value: "25"),
                         customRow(title: "Facilities:", value: "Hotwater,meals"),
      
      
                      ],
                    ),
                  ),
                ],
              ),
              ),
              ),
    );
  }
}