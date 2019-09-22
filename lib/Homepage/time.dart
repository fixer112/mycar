import 'package:flutter/material.dart';

class Time extends StatefulWidget {
  Time({Key key}) : super(key: key);

  _TimeState createState() => _TimeState();
}

class _TimeState extends State<Time> {
  var times = [
    'Last Location',
    'Today',
    'This Week',
    'This Month',
    'This Year'
  ];
  var _time;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _time = times[0];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: DropdownButton(
        hint: Text(_time),
        onChanged: (value) {
          setState(() {
            _time = value;
            print(_time);
          });
        },
        items: times.map((time) {
          return DropdownMenuItem(
            value: time,
            child: Text(time),
          );
        }).toList(),
      ),
    );
  }
}
