import 'package:flutter/material.dart';
import 'package:mycar/Global/variables.dart' as prefix0;
import 'package:pin_view/pin_view.dart';

class OTP extends StatefulWidget {
  OTP({Key key}) : super(key: key);

  _OTPState createState() => _OTPState();
}

class _OTPState extends State<OTP> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WillPopScope(
        onWillPop: () async {
          false; //return a `Future` with false value so this route cant be popped or closed.
        },
        child: Container(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: Text('Enter one time password'),
                ),
                Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: PinView(
                    autoFocusFirstField: false, // defaults to true
                    margin: EdgeInsets.all(2.5), // margin between the fields
                    obscureText: true,
                    //sms: SmsListener(),
                    inputDecoration: InputDecoration(
                      border: UnderlineInputBorder(),
                      enabledBorder: UnderlineInputBorder(),
                    ),
                    count: 6,
                    submit: () {},
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(5.0),
                  child: RaisedButton(
                    onPressed: () {
                      Navigator.popAndPushNamed(context, '/homepage');
                    },
                    child: Text('Confirm'),
                    textColor: prefix0.textColor,

                    //shape:,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
