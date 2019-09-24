import 'package:flutter/material.dart';
import 'dart:async';

import 'package:mycar/Global/variables.dart';

class Date extends StatefulWidget {
  Date({Key key}) : super(key: key);

  _DateState createState() => _DateState();
}

class _DateState extends State<Date> {
  DateTime from = DateTime.now();
  DateTime to = DateTime.now();

  Future<Null> _selectFrom(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: from,
        firstDate: DateTime(2018, 1),
        lastDate: DateTime(2101));
    if (picked != null && picked != from) {
      setState(() {
        from = picked;
        print(from.toString());
      });
    }
  }

  Future<Null> _selectTo(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: to,
        firstDate: DateTime(2018, 1),
        lastDate: DateTime(2101));
    if (picked != null && picked != to) {
      setState(() {
        to = picked;
        print(to.toString());
      });
    }
  }

  Card dateLayout(DateTime date, String d) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(5.00),
        child: Row(
          children: <Widget>[
            Icon(Icons.timer),
            Text(
              '$d : ${date.day}/${date.month}/${date.year}',
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: primaryColor),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: <Widget>[
            Row(
              //mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                GestureDetector(
                    onTap: () => _selectFrom(context),
                    child: dateLayout(from, 'From')),
                GestureDetector(
                  onTap: () => _selectTo(context),
                  child: dateLayout(to, 'To'),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
