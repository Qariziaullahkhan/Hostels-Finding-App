import 'package:flutter/material.dart';

class CustomeTextField extends StatefulWidget {
  final controller;

  final hinttext;
  final labletext;
  final icons;
  // final dynamic title;

  final dynamic textType;
  final maxlength;
  final dynamic icon;
  final String? Function(String?)? validator;

  const CustomeTextField({
    super.key,
    // this.title,
    required this.controller,
    required this.hinttext,
    this.labletext,
    required this.icons,
    this.icon,
    this.textType,
    this.maxlength,
    this.validator,
  });

  @override
  State<CustomeTextField> createState() => _CustomeTextFieldState();
}

class _CustomeTextFieldState extends State<CustomeTextField> {
  bool _isvisiblity = true;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 105,
      width: 341,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 12, bottom: 6),
            // child: Text(
            // //  "${widget.title}",
            //   style: TextStyle(
            //       fontSize: 15,
            //       fontWeight: FontWeight.w500,
            //       color: Colors.black),
            // ),
          ),
          TextFormField(
            controller: widget.controller,
            keyboardType: widget.textType,
            maxLength: widget.maxlength,
            
            // style: const TextStyle(
            //   fontStyle: FontStyle.italic,
            //   fontSize: 20,
            //   fontWeight: FontWeight.normal,
            // ),
            decoration: InputDecoration(
              filled: true,
              hintText: widget.hinttext,
              labelText: widget.labletext,
              prefixIcon: Icon(widget.icons),
              suffixIcon: Icon(widget.icon),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
            ),
            toolbarOptions: ToolbarOptions(
copy: true,
cut: true,
paste:true,
selectAll: true,
),
          ),
        ],
      ),
    );
  }
}






// import 'package:flutter/material.dart';

// class UniHelper {
//   static CustomTextField(
//     TextEditingController controller,
//     String text,
//     IconData? iconData,
//     IconData? icons,
//   ) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 25),
//       child: TextField(
//         controller: controller,
//         decoration: InputDecoration(
//             hintText: text,
//             prefixIcon: iconData != null ? Icon(iconData) : null,
//             suffixIcon: icons != null ? Icon(icons) : null,
//             border: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(20),
//             )),
//       ),
//     );
//   }

//   static CustomButton(VoidCallback voidCallback, String text) {
//     return ElevatedButton(
//         style: ElevatedButton.styleFrom(
//             backgroundColor: Colors.red,
//             minimumSize: Size(250, 50),
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(20),
//             )),
//         onPressed: voidCallback,
//         child: Text(
//           text,
//           style: TextStyle(fontSize: 20, color: Colors.black),
//         ));
//   }
// }
