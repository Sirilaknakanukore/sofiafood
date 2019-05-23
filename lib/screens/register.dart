import 'package:flutter/material.dart';
import 'package:http/http.dart' show get;
import 'dart:convert';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final formKey = GlobalKey<FormState>();

  String name, user, password;

  Widget registerButton() {
    return IconButton(
      icon: Icon(Icons.cloud_upload),
      onPressed: () {
        print('you click register');
        if (formKey.currentState.validate()) {
          formKey.currentState.save();
          print('name => $name,user => $user,password => $password');
          uploadValueToService();
        }
      },
    );
  }

  void uploadValueToService() async {
    String urlPHP =
        'https://www.androidthai.in.th/tid/addUserUng.php?isAdd=true&Name=$name&User=$user&Password=$password';

        var response = await get(urlPHP);
        var resultString = json.decode(response.body);
        print('resultString ==> $resultString');
  }

  Widget nameTextFormField() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Name : ', hintText: 'your name'),
      validator: (String value) {
        if (value.length == 0) {
          return 'please field name in blank';
        }
      },
      onSaved: (String value) {
        name = value;
      },
    );
  }

  Widget userTextFormField() {
    return TextFormField(
      decoration:
          InputDecoration(labelText: 'Text', hintText: 'Type your user'),
      validator: (String value) {
        if (value.length == 0) {
          return 'please field user in blank';
        }
      },
      onSaved: (String value) {
        user = value;
      },
    );
  }

  Widget passwordTextFormField() {
    return TextFormField(
      decoration:
          InputDecoration(labelText: 'Password', hintText: 'more 6 charecter'),
      validator: (String value) {
        if (value.length <= 6) {
          return 'ต้องมีตัวอักษรมากกว่า 6 ตัวอักษร';
        }
      },
      onSaved: (String value) {
        password = value;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register'),
        actions: <Widget>[registerButton()],
      ),
      body: Form(
        key: formKey,
        child: Container(
          padding: EdgeInsets.all(50.0),
          child: Column(
            children: <Widget>[
              nameTextFormField(),
              userTextFormField(),
              passwordTextFormField()
            ],
          ),
        ),
      ),
    );
  }
}
