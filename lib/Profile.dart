import 'dart:ui' as prefix1;

import 'package:flutter/material.dart';
import 'package:keyboard_visibility/keyboard_visibility.dart';
import 'package:mycar/Global/variables.dart' as prefix0;

class Profile extends StatefulWidget {
  Profile({Key key}) : super(key: key);

  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  IconData emailIcon = Icons.email;
  IconData userIcon = Icons.supervised_user_circle;
  IconData phoneIcon = Icons.phone;
  FocusNode _focus = FocusNode();
  TextEditingController _controller = TextEditingController();
  bool focus = false;

  @override
  void initState() {
    super.initState();
    KeyboardVisibilityNotification().addNewListener(
      onChange: (bool visible) {
        print('visible: ' + visible.toString());
        setState(() {
          focus = visible;
        });
      },
    );
    _focus.addListener(() {
      print("Has focus: ${_focus.hasFocus}");
    });
  }

  test(context, String name, String input) {
    //double bottom = MediaQuery.of(context).viewInsets.bottom;
    _controller.text = input;
    showModalBottomSheet(
      //elevation: 50.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10.0), topRight: Radius.circular(10.0)),
      ),
      context: context,
      builder: (context) => Container(
        height: MediaQuery.of(context).viewInsets.bottom + 150.0,
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 0.0),
                    child: Column(
                      //mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Enter your ' + name,
                          style: TextStyle(
                              /* fontSize: 20.0, */ fontWeight:
                                  FontWeight.bold),
                        ),
                        TextField(
                            controller: _controller,
                            focusNode: _focus,
                            decoration: InputDecoration(
                              border: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: prefix0.primaryColor)),
                              enabledBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: prefix0.primaryColor)),
                            )),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                //crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  InkWell(
                    onTap: () => Navigator.pop(context),
                    child: Text(
                      'CANCEL',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: prefix0.primaryColor),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 50.0),
                    child: InkWell(
                      child: Text(
                        'SAVE',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: prefix0.primaryColor),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
    //print('test');
  }

  Widget field(String field, String input, IconData icon, Function function) {
    return Padding(
        padding: EdgeInsets.all(20.0),
        child: InkWell(
          onTap: () {
            function();
          },
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                //crossAxisAlignment: Cr,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0),
                    child: Icon(
                      icon,
                      color: prefix0.primaryColor,
                      size: 25.0,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 30.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(field, style: TextStyle(color: prefix0.textColor)),
                        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            //crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Text(input),
                              Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Icon(
                                  Icons.edit,
                                  color: prefix0.textColor,
                                  size: 15.0,
                                ),
                              ),
                            ]),
                      ],
                    ),
                  ),
                ],
              ),
              Divider()
            ],
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(title: Text('Profile')),
        body: Container(
          child: ListView(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Stack(
                      children: [
                        Hero(
                          tag: 'profilePic',
                          child: Container(
                            height: 150.0,
                            width: 150.0,
                            child: Material(
                              color: prefix0.backgroundColor,
                              child: CircleAvatar(
                                backgroundColor: prefix0.primaryColor,
                                backgroundImage:
                                    AssetImage("assets/images/abu.jpg"),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 0.0,
                          right: 0.0,
                          child: Container(
                            height: 50.0,
                            child: FloatingActionButton(
                              heroTag: 'changePic',
                              child: Icon(Icons.camera_alt),
                              onPressed: () {},
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
              field('Name', 'Abubakar Lawal', userIcon,
                  () => test(context, 'name', 'Abubakar Lawal')),
              field('Email', 'abula3003@gmail.com', emailIcon,
                  () => test(context, 'email', 'abula3003@gmail.com')),
              field('Phone', '+2348106813749', phoneIcon,
                  () => test(context, 'phone number', '+2348106813749')),
            ],
          ),
        ),
      ),
    );
  }
}
