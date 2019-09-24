import 'package:flutter/material.dart';

class Time extends StatefulWidget {
  Time({Key key}) : super(key: key);
  //var time = _TimeState().times[0];

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
      //color: Colors.white,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: DropdownButton(
            isDense: true,
            icon: Icon(Icons.directions),
            underline: Text(''),
            hint: Text(_time),
            onChanged: (value) {
              setState(() {
                _time = value;
                //Time().time = value;
                //print(Time().time);
              });
            },
            items: times.map((time) {
              return DropdownMenuItem(
                value: time,
                child: Text(time),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
