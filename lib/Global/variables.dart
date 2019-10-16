import 'package:flutter/material.dart';

String appName = 'MyCar';
Color primarySwatch = Colors.blue;
Color primaryColor = Colors.blue;
Color backgroundColor = Colors.white;
Color textColor = Colors.grey;
Color disabledColor = Colors.grey;
Color secondaryColor = Colors.lightBlue;
//Color textColor = Colors.grey;

final List listDrawer = [
  {'name': 'Home', 'icon': Icons.home, 'route': '/homepage'},
  {
    'name': 'Profile',
    'icon': Icons.supervised_user_circle,
    'route': '/profile'
  },
  {'name': 'Cars', 'icon': Icons.directions_car, 'route': '/cars'},
  {'name': 'Payment', 'icon': Icons.credit_card, 'route': '/payment'},
  {'name': 'Support', 'icon': Icons.help, 'route': '/support'},
  {'name': 'About', 'icon': Icons.info, 'route': '/about'},
];
