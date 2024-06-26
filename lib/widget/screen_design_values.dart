import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget screenDesign ({ required Widget widget, context}){
  return  Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration:  const BoxDecoration(
              gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.white, Colors.green],
            ),
            ),
            child: widget,
          ),
          Positioned(
            left: 20,
            top: 30,
            child: Material(
              elevation: 3,
              borderRadius: BorderRadius.circular(10),
              child: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  height: 30,
                  width: 30,
                  decoration:  BoxDecoration(
                    color: const Color.fromARGB(255, 253, 253, 253),
                    borderRadius: BorderRadius.circular(10)
                  ),
                  child: const Center(child: Icon(Icons.arrow_back_ios_new_outlined,color: Colors.amber,),),
                ),
              ),
            ),
          ),
        ],
      );
}