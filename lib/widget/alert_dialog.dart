import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';

import 'Custom_Rows.dart';

class CustomeAlertDialog extends StatefulWidget {
  const CustomeAlertDialog({super.key});

  @override
  State<CustomeAlertDialog> createState() => _CustomeAlertDialogState();
}

class _CustomeAlertDialogState extends State<CustomeAlertDialog> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Error'),
      content: const Text('Something went wrong.'),
      actions: [
      Padding(
        padding: const EdgeInsets.only(right: 100,left: 10),
        child: Container(
          padding: const EdgeInsets.only(right: 50),
          height: 400,
          width: 600,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
           customRow(title: "City Name:", value: "Peshawar"),
                          customRow(title: "Hostel Name: ", value: "Buttler Hostels"),
                          const SizedBox(width: 40),
                          customRow(title: "Owner Name:", value: "Zia Ullah"),
                          const SizedBox(width: 40),
        
                          customRow(title: "Phone:", value: "0315 8779341"),
                          const SizedBox(width: 40),
        
                          customRow(title: "AvailableRoom:", value: "5"),
                          const SizedBox(width: 40),
        
                          customRow(title: "Rent Rooms:", value: "12000"),
                          const SizedBox(width: 40),
                          customRow(title: "Total Rooms:", value: "25"),
                          const SizedBox(width: 40),
                           customRow(title: "Facilities:", value: "Hotwater,meals"),
                                                     const SizedBox(width: 40),
        
        
            ],
          ),
        ),
      ),
      ],
    );
    
  }
}
