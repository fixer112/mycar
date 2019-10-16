import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:mycar/Global/variables.dart';

BorderSide tableBorderSide() {
  return BorderSide(
    color: primaryColor,
    style: BorderStyle.solid,
    width: 2.0,
  );
}

Widget loader() {
  return Align(
    alignment: Alignment.center,
    child: SpinKitWave(color: primaryColor),
  );
}
