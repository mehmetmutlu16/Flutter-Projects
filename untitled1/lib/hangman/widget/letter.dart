import 'package:flutter/material.dart';

Widget letter(String character, bool hidden){
  return Container(
    height: 50,
    width: 40,
    padding: const EdgeInsets.all(4.0),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(4),
    ),
    child: Visibility(
      visible: !hidden,
      child: Center(
        child: Text(
          character,
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 30.0,
          ),
        ),
      ),
    ),
  );
}