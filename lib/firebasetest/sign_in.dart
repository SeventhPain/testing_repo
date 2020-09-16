import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:material_test/firebasetest/welcome.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final TextEditingController _mailController = TextEditingController();
  final TextEditingController _passController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  GlobalKey<ScaffoldState> _scaffKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffKey,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [withEmailPassword()],
      ),
    );
  }

  Widget withEmailPassword() {
    return Form(
      key: _formKey,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                alignment: Alignment.center,
                child: const Text(
                  'Sign In with Email and Password',
                  style: TextStyle(
                      fontWeight: FontWeight.w800, color: Colors.blueGrey),
                ),
              ),
              TextFormField(
                controller: _mailController,
                decoration: const InputDecoration(
                  labelText: "Email",
                ),
                validator: (String value) {
                  if (value.isEmpty) {
                    return "Plese enter mail";
                  }
                  return null;
                },
              ),
              TextFormField(
                obscureText: true,
                controller: _passController,
                decoration: const InputDecoration(
                  labelText: "Password",
                ),
                validator: (String value) {
                  if (value.isEmpty) {
                    return "Plese enter password";
                  }
                  return null;
                },
              ),
              Container(
                child: RaisedButton(
                  onPressed: () async {
                    if (_formKey.currentState.validate()) {
                      _signInWithEmailPassword();
                    }
                  },
                  child: Text("signIn"),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void _signInWithEmailPassword() async {
    try {
      final User user = (await _auth.signInWithEmailAndPassword(
              email: _mailController.text, password: _passController.text))
          .user;
      if (!user.emailVerified) {
        await user.sendEmailVerification();
      }
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (_) {
            return Welcome(
              user: user,
            );
          },
        ),
      );
    } catch (e) {
      print('aaaaaaaaaaaaaaa');
      _scaffKey.currentState
          .showSnackBar(SnackBar(content: Text("go to register")));
      print(e);
    }
  }
}
