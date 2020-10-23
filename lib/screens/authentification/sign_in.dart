import 'package:flutter/material.dart';
import 'package:mindmates/services/auth.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final Auth_service _auth = Auth_service();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown,
      appBar: AppBar(
        backgroundColor: Colors.brown[400],
        elevation: 0.0,
        title: Text('Sign in'),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 50),
        child: RaisedButton(
          child: Text("Sign in anon"),
          onPressed: () async {
            dynamic result = await _auth.sign_in_anon();
            if (result == null)
              print("error");
            else {
              print("signed in");
              print(result);
            }
          },
        ),
      ),
    );
  }
}
