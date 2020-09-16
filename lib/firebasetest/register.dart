import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:material_test/firebasetest/welcome.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  TextEditingController _nameController = TextEditingController();
  TextEditingController _mailController = TextEditingController();
  TextEditingController _passController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Form(
          key: _formKey,
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TextFormField(
                    controller: _nameController,
                    decoration: const InputDecoration(
                      labelText: "Full Name",
                    ),
                    validator: (String value) {
                      if (value.isEmpty) {
                        return "Plese enter name";
                      }
                      return null;
                    },
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
                          _registerAccount();
                        }
                      },
                      child: Text("Register"),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  _registerAccount() async {
    final User user = (await _auth.createUserWithEmailAndPassword(
            email: _mailController.text, password: _passController.text))
        .user;

    if (user != null) {
      if (!user.emailVerified) {
        await user.sendEmailVerification();
      }
      await user.updateProfile(displayName: _nameController.text);
      final user1 = _auth.currentUser;
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) {
            return Welcome(user: user1);
          },
        ),
      );
    }
  }
}
