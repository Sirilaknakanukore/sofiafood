import 'package:flutter/material.dart';

class Authen extends StatefulWidget {
  @override
  _AuthenState createState() => _AuthenState();
}

class _AuthenState extends State<Authen> {
  Widget showlogo() {
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
      alignment: Alignment(0,-1),
      child: Column(
        children: <Widget>[
          showlogo(),
          Container(
            margin: EdgeInsets.only(top: 20.0),
            child: showTitle(),
          )
        ],
      ),
    ));
  }
}
