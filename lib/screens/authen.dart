import 'package:flutter/material.dart';
import 'package:sofia_food/screens/register.dart';
import 'package:http/http.dart' show get;
import 'dart:convert';

class Authen extends StatefulWidget {
  @override
  _AuthenState createState() => _AuthenState();
}

class _AuthenState extends State<Authen> {
  final formKey = GlobalKey<FormState>();
  String user, password;

  Widget showSignUp(BuildContext context) {
    return RaisedButton(
      child: Text('Sign Up'),
      onPressed: () {
        print('You Click SignUp');

        // create Router
        var registerRouter =
            MaterialPageRoute(builder: (BuildContext) => Register());
        Navigator.of(context).push(registerRouter);
      },
    );
  }

  void CheckUserAndPassword() async {
    String urlPHP =
        'https://www.androidthai.in.th/tid/getUserWhereUserMaster.php?isAdd=true&User=$user';
    var response = await get(urlPHP);
    var result = json.decode(response.body);
    print('result ==> $result');
  }

  Widget showSignIn() {
    return RaisedButton(
      child: Text('Sign In'),
      onPressed: () {
        if (formKey.currentState.validate()) {
          formKey.currentState.save();
          CheckUserAndPassword();
        }
      },
    );
  }

  Widget showPassword() {
    return TextFormField(
      decoration: InputDecoration(
          labelText: 'Password :', hintText: 'More 6 Charactor'),
      validator: (String value) {
        if (value.length <= 5) {
          return 'ต้องมากกว่า 6 ตัวอักษร';
        }
      },
      onSaved: (String value) {
        password = value;
      },
    );
  }

  Widget showUser() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'User :', hintText: 'Your User'),
      validator: (String value) {
        if (value.length == 0) {
          return 'กรอก username';
        }
      },
      onSaved: (String value) {
        user = value;
      },
    );
  }

  Widget showLogo() {
    return Image.asset('images/logo.png');
  }

  Widget showTitle() {
    return Text(
      'Sofia Food',
      style: TextStyle(
          fontSize: 25.0, fontWeight: FontWeight.bold, color: Colors.red[900]),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomPadding: false,
        body: Form(
          key: formKey,
          child: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [Colors.white, Colors.green[50]],
                    begin: Alignment(-1, -1))),
            padding: EdgeInsets.only(top: 70.0),
            alignment: Alignment(0, -1),
            child: Column(
              children: <Widget>[
                showLogo(),
                Container(
                  margin: EdgeInsets.only(top: 10.0),
                  child: showTitle(),
                ),
                Container(
                  margin: EdgeInsets.only(left: 50.0, right: 50.0),
                  child: showUser(),
                ),
                Container(
                  margin: EdgeInsets.only(left: 50.0, right: 50.0, top: 20.0),
                  child: showPassword(),
                ),
                Container(
                  margin: EdgeInsets.only(left: 50.0, right: 50.0, top: 20.0),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: showSignIn(),
                      ),
                      Expanded(
                        child: showSignUp(context),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
