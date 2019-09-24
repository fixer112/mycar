import 'dart:async';
import 'dart:core';

import 'package:flutter/material.dart';
import 'package:mycar/Global/variables.dart';
import 'package:mycar/Homepage/cars.dart';
import 'package:mycar/Homepage/date.dart';
import 'package:mycar/Homepage/fault.dart';
import 'package:mycar/Homepage/location.dart';
import 'package:mycar/Homepage/time.dart';

class Homepage extends StatefulWidget {
  Homepage({Key key}) : super(key: key);

  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage>
    with SingleTickerProviderStateMixin {
  TabController tabController;
  bool show = true;
  bool showMap = false;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 1), () {
      setState(() {
        showMap = true;
      });
    });
    tabController = TabController(vsync: this, length: 2);
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        //titleSpacing: -30.0,
        title: Text(appName,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              //fontSize: 20.00,
            )),
        bottom: TabBar(controller: tabController, tabs: <Tab>[
          Tab(icon: Icon(Icons.location_on)),
          Tab(icon: Icon(Icons.error)),
        ]),
        //centerTitle: true,
      ),
      body: WillPopScope(
        onWillPop: () async {
          false; //return a `Future` with false value so this route cant be popped or closed.
        },
        child: Stack(children: [
          TabBarView(controller: tabController, children: <Widget>[
            //Container(),
            showMap
                ? Map()
                : Container(
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  ),
            Fault(),
          ]),
          Positioned(
            bottom: show ? 220.00 : 70,
            right: 10.00,
            child: Container(
              height: 35.00,
              child: FittedBox(
                child: FloatingActionButton(
                  child: Icon(
                    show ? Icons.visibility_off : Icons.visibility,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    setState(() {
                      show = !show;
                    });
                  },
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 70.00,
            right: 10.00,
            child: AnimatedOpacity(
              duration: Duration(seconds: 1),
              opacity: show ? 1.0 : 0.0,
              child: Visibility(
                visible: show,
                child: Time(),
              ),
            ),
          ),
          Positioned(
            //alignment: Alignment(0.0, 10.0),
            bottom: 130.00,
            //right: 15.00,
            left: 25.00,
            child: AnimatedOpacity(
                duration: Duration(seconds: 1),
                opacity: show ? 1.0 : 0.0,
                child: Visibility(
                  visible: show,
                  child: Date(),
                )),
          ),
          Positioned(
            bottom: 70.00,
            left: 10.00,
            child: AnimatedOpacity(
                duration: Duration(seconds: 1),
                opacity: show ? 1.0 : 0.0,
                child: Visibility(
                  visible: show,
                  child: Cars(),
                )),
          ),
        ]),
      ),
    );
  }
}
