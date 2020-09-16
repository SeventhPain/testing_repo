import 'package:flutter/material.dart';
import 'package:material_test/firebasetest/register.dart';
import 'package:material_test/firebasetest/sign_in.dart';

class AuthPage extends StatefulWidget {
  @override
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Firebase Example App"),
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          RaisedButton(
            onPressed: () {
              _navigateTo(context, SignIn());
            },
            child: Text('sign'),
          ),
          SizedBox(
            width: 10,
          ),
          RaisedButton(
            onPressed: () {
              _navigateTo(context, Register());
            },
            child: Text('Register'),
          ),
        ],
      ),
    );
  }

  _navigateTo(BuildContext context, Widget goTo) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) {
        return goTo;
      }),
    );
  }
}
