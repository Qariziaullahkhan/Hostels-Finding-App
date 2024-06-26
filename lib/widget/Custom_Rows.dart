import 'package:flutter/cupertino.dart';

Widget customRow({var title, var value}) {
  return Padding(
    padding: EdgeInsets.only(left: 50, top: 20),
    child: SizedBox(
      height: 20,
      width: 359,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
              height: 20,
              width: 100,
              child: Text(
                "$title ",
                style: const TextStyle(fontWeight: FontWeight.bold),
              )),
      const    SizedBox(
            width: 70,
          ),
          SizedBox(height: 20, width: 100, child: Text("$value"))
        ],
      ),
    ),
  );
}
