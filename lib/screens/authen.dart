import 'package:flutter/material.dart';

class Authen extends StatefulWidget {
  @override
  _AuthenState createState() => _AuthenState();
}

class _AuthenState extends State<Authen> {
  Widget showPassword() {
    return TextFormField(
      decoration: InputDecoration(
          labelText: 'Password : ', hintText: 'More 6 charecter'),
    );
  }

  Widget showUser() {
    return TextFormField(
      decoration:
          InputDecoration(labelText: 'Username : ', hintText: 'Your Username'),
    );
  }

  Widget showLogo() {
    return Image.asset('images/logo.png');
  }

  Widget showTitle() {
    return Text(
      'Sofia Food',
      style: TextStyle(
          fontSize: 25.0, fontWeight: FontWeight.bold, color: Colors.red[300]),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      margin: EdgeInsets.only(top: 70.0),
      alignment: Alignment(0, -1),
      child: Column(
        children: <Widget>[
          showLogo(),
          Container(
            margin: EdgeInsets.only(top: 20.0),
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
        ],
      ),
    ));
  }
}
