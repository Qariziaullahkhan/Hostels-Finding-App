import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget custonTextField({var title ,var hintText, var suffixIcon}){
  return SizedBox(
    height: 105,
    width: 341,
    //color: Colors.green,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
                 Padding(
                   padding:  EdgeInsets.only(left:12.0, bottom: 6),
                   child: Text("$title",style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w500,color: Colors.black),),
                 ),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: hintText,
                    suffixIcon: suffixIcon,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    filled: true,
                    fillColor: Colors.white
                  ),
                )

      ],
    ),
  );
}