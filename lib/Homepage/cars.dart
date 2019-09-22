import 'package:flutter/material.dart';

class Cars extends StatefulWidget {
  Cars({Key key}) : super(key: key);

  _CarsState createState() => _CarsState();
}

class _CarsState extends State<Cars> {
  var cars = ['AB-123-SXN', 'CD-12-AKM', 'WQ-546-IUY'];
  var _car;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _car = cars[0];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: DropdownButton(
        hint: Text(_car),
        onChanged: (value) {
          setState(() {
            _car = value;
            print(_car);
          });
        },
        items: cars.map((car) {
          return DropdownMenuItem(
            value: car,
            child: Text(car),
          );
        }).toList(),
      ),
    );
  }
}
