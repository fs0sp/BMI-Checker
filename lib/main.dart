import 'package:flutter/material.dart';

import 'package:bmi_app/ui/home.dart';

void main() {
  runApp(new MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'BMI',
    home: new Bmi(),
  ));
}