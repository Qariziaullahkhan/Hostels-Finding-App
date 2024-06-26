import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RadioButtonRow extends StatefulWidget {
  const RadioButtonRow({super.key});

  @override
  State<RadioButtonRow> createState() => _RadioButtonRowState();
}

class _RadioButtonRowState extends State<RadioButtonRow> {
  int? selectedValue = 1;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Gender:',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),

          Radio(
            value: 1,
            groupValue: selectedValue,
            onChanged: (value) {
              setState(() {
                selectedValue = value;
              });
            },
          ),
          const Text(' Male'),
          Radio(
            value: 2,
            groupValue: selectedValue,
            onChanged: (value) {
              setState(() {
                selectedValue = value;
              });
            },
          ),
          const Text(' Female'),
          // Radio(
          //   value: 3,
          //   groupValue: selectedValue,
          //   onChanged: (value) {
          //     setState(() {
          //       selectedValue = value;
          //     });
          //   },
          // ),
          // const Text(' Other'),
        ],
      ),
    );
  }
}
