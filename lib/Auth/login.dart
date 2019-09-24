import 'package:flutter/material.dart';
import 'package:mycar/Global/variables.dart';
import 'package:mycar/Global/variables.dart' as prefix0;

class Login extends StatefulWidget {
  Login({Key key}) : super(key: key);

  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        //color: Colors.amber,
        child: Center(
          child: Form(
            autovalidate: true,
            key: _formkey,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(15.00),
                    child: TextFormField(
                      //enabled: false,
                      decoration: InputDecoration(
                        prefixText: '+234',
                        prefixIcon: Icon(
                          Icons.phone,
                          color: primaryColor,
                        ),
                        labelText: 'Mobile Number',
                      ),
                      keyboardType: TextInputType.phone,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(5.0),
                    child: RaisedButton(
                      onPressed: () {
                        Navigator.popAndPushNamed(context, '/otp');
                      },
                      child: Text('Continue'),
                      textColor: prefix0.textColor,

                      //shape:,
                    ),
                  )
                ]),
          ),
        ),
      ),
    );
  }
}
