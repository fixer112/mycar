import 'dart:async';
import 'dart:core';

import 'package:flutter/material.dart';
import 'package:mycar/Global/variables.dart';
import 'package:mycar/Global/widgets.dart';
import 'package:mycar/Homepage/cars.dart';
import 'package:mycar/Homepage/date.dart';
import 'package:mycar/Homepage/fault.dart';
import 'package:mycar/Homepage/location.dart';
import 'package:mycar/Homepage/time.dart';
import 'package:mycar/drawer.dart';

class Homepage extends StatefulWidget {
  Homepage({Key key}) : super(key: key);

  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage>
    with SingleTickerProviderStateMixin {
  TabController tabController;
  bool show = true;
  final double height = 150.0;
  bool showMap = false;
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

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
      resizeToAvoidBottomPadding: true,
      resizeToAvoidBottomInset: false,
      drawer: Draw(),
      appBar: AppBar(
        //leading: Drawer(),
        //titleSpacing: -30.0,
        /* title: Text(appName,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              //fontSize: 20.00,
            )), */
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
                    //color: primaryColor,
                    child: Center(
                      child: loader(),
                    ),
                  ),
            Fault(),
          ]),
          Positioned(
            bottom: show ? height + 20.0 : 20.0,
            right: 10.00,
            child: Container(
              height: 35.00,
              child: FittedBox(
                child: FloatingActionButton(
                  heroTag: 'visibility',
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
          show
              ? Align(
                  //bottom: 20.0,
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(15.0),
                            topRight: Radius.circular(15.0)),
                        color: Colors.white),
                    height: MediaQuery.of(context).size.height -
                        (MediaQuery.of(context).size.height - height),
                    //color: Colors.white,
                    child: Align(
                      //alignment: Alignment.bottomCenter,
                      child: Column(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(top: 20.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[Date()],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 20.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[Time(), Cars()],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                )
              : Container(),
          /* Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 200.0,
                color: Colors.white,
                child: Stack(
                  children: <Widget>[
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
                            child: Align(
                                alignment: Alignment.bottomCenter, child: Date()),
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
                  ],
                ),
              ),
            ), */
          /* Positioned(
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
                    child:
                        Align(alignment: Alignment.bottomCenter, child: Date()),
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
            ), */
        ]),
      ),
    );
  }
}
