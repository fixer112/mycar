import 'package:flutter/material.dart';
import 'package:mycar/Global/variables.dart';
import 'package:mycar/Global/widgets.dart';
import 'package:mycar/Homepage/time.dart';

class Fault extends StatelessWidget {
  var data = [
    {
      'first': 'CODE',
      'second': 'DESCRIPTION',
      'third': 'DIAGNOSIS',
      'style': FontWeight.bold,
      'height': 30.00
    },
    {
      'first': '01',
      'second': 'This ia a test',
      'third': 'Faulty engine',
      'error': 'high'
    },
    {
      'first': '02',
      'second': 'This ia another test',
      'third': 'Change oil',
      'error': 'medium'
    },
    {
      'first': '01',
      'second': 'This ia a test',
      'third': 'Faulty engine',
      'error': 'high'
    },
    {
      'first': '03',
      'second': 'Ignore test',
      'third': 'Use sit belt',
      'error': 'low'
    },
    {
      'first': '03',
      'second': 'Ignore test',
      'third': 'Use sit belt',
      'error': 'low'
    },
    {
      'first': '01',
      'second': 'This ia a test',
      'third': 'Faulty engine',
      'error': 'high'
    },
    {
      'first': '02',
      'second': 'This ia another test',
      'third': 'Change oil',
      'error': 'medium'
    },
    {
      'first': '03',
      'second': 'Ignore test',
      'third': 'Use sit belt',
      'error': 'low'
    },
    {
      'first': '01',
      'second': 'This ia a test',
      'third': 'Faulty engine',
      'error': 'high'
    },
    {
      'first': '01',
      'second': 'This ia a test',
      'third': 'Faulty engine',
      'error': 'high'
    },
    {
      'first': '03',
      'second': 'Ignore test',
      'third': 'Use sit belt',
      'error': 'low'
    },
    {
      'first': '01',
      'second': 'This ia a test',
      'third': 'Faulty engine',
      'error': 'high'
    },
    {
      'first': '02',
      'second': 'This ia another test',
      'third': 'Change oil',
      'error': 'medium'
    },
  ];
  var errorColors = {
    'low': Colors.green,
    'medium': Colors.orange,
    'high': Colors.red
  };
  /* var errorIcons = {
    'low': Icons.warning,
    'medium': Icons.notification_important,
    'high': Icons.error
  }; */

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Table(
          //border: TableBorder.all(),
          columnWidths: {
            0: FlexColumnWidth(0.2),
            1: FlexColumnWidth(0.5),
          },
          //defaultColumnWidth: FixedColumnWidth(150.0),
          /* border: TableBorder(
            horizontalInside: tableBorderSide(),
            verticalInside: tableBorderSide(),
            //top: tableBorderSide(),
            bottom: tableBorderSide(),
            left: tableBorderSide(),
            right: tableBorderSide(),
          ), */
          children: data.map((msg) {
            return TableRow(

                /* decoration: msg.containsKey('error')
                    ? BoxDecoration(color: errorColors[msg['error']])
                    : null, */
                children: [
                  TableCell(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                        child: msg.containsKey('error')
                            ? Container(
                                /* height:
                                    msg.containsKey('height') ? msg['height'] : 50.00, */
                                child: Icon(
                                  Icons.error,
                                  color: errorColors[msg['error']],
                                  size: 20.00,
                                ),
                              )
                            : Container(),
                      ),
                    ),
                  ),
                  TableCell(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                        child: Container(
                          height:
                              msg.containsKey('height') ? msg['height'] : 50.00,
                          child: Text(
                            msg['first'],
                            style: TextStyle(
                              fontWeight: msg.containsKey('style')
                                  ? msg['style']
                                  : FontWeight.normal,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  TableCell(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                        child: Container(
                          child: Text(
                            msg['second'],
                            style: TextStyle(
                              fontWeight: msg.containsKey('style')
                                  ? msg['style']
                                  : FontWeight.normal,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  TableCell(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                        child: Container(
                          child: Text(
                            msg['third'],
                            style: TextStyle(
                              fontWeight: msg.containsKey('style')
                                  ? msg['style']
                                  : FontWeight.normal,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ]);
          }).toList(),
        ),
      ),
    );
  }
}
