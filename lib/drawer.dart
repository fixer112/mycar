import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:mycar/Global/variables.dart' as prefix0;

class Draw extends StatefulWidget {
  Draw({Key key}) : super(key: key);

  _DrawState createState() => _DrawState();
}

class _DrawState extends State<Draw> {
  int selected = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Drawer(
        child: Container(
          child: Column(
            children: <Widget>[
              UserAccountsDrawerHeader(
                decoration: BoxDecoration(
                    //backgroundBlendMode: BlendMode.color,
                    gradient: LinearGradient(colors: [
                  prefix0.primaryColor,
                  prefix0.secondaryColor
                ])),
                //margin: ,
                currentAccountPicture: Hero(
                    tag: 'profilePic',
                    child: Material(
                      color: prefix0.primaryColor,
                      child: InkWell(
                        child: CircleAvatar(
                          backgroundColor: prefix0.primaryColor,
                          backgroundImage: AssetImage("assets/images/abu.jpg"),
                        ),
                        onTap: () => Navigator.pushNamed(context, '/profile'),
                      ),
                    )),
                accountEmail: Text('+2348106813749'),
                accountName: Text('Abubakar Lawal'),
              ),
              ListView(
                shrinkWrap: true,
                children: prefix0.listDrawer.map((item) {
                  return Container(
                      padding: EdgeInsets.only(bottom: 10.00, top: 10.00),
                      child: ListTile(
                        selected: prefix0.listDrawer.indexOf(item) == 0,
                        leading: Icon(
                          item['icon'], /* color: Colors.black */
                        ),
                        title: Text(item['name'],
                            style: TextStyle(
                                //color: Colors.black,
                                )),
                        onTap: () {
                          setState(() {
                            selected = prefix0.listDrawer.indexOf(item);
                          });
                          Navigator.pushNamed(context, item['route']);

                          //print(item['name']);
                        },
                      ));
                }).toList(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
