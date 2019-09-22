import 'package:flutter/material.dart';
import 'package:mycar/Homepage/cars.dart';
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
  @override
  void initState() {
    super.initState();
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
      appBar: AppBar(
        bottom: TabBar(controller: tabController, tabs: <Tab>[
          Tab(icon: Icon(Icons.location_on)),
          Tab(icon: Icon(Icons.error)),
        ]),
      ),
      body: WillPopScope(
        onWillPop: () async {
          false; //return a `Future` with false value so this route cant be popped or closed.
        },
        child: Stack(children: [
          TabBarView(controller: tabController, children: <Widget>[
            Location(),
            Fault(),
          ]),
          Positioned(
            bottom: 50.00,
            right: 25.00,
            child: Time(),
          ),
          Positioned(
            bottom: 50.00,
            left: 25.00,
            child: Cars(),
          ),
        ]),
      ),
    );
  }
}
