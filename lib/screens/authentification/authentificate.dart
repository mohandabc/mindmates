import 'package:flutter/material.dart';
import 'package:mindmates/screens/authentification/sign_in.dart';
import 'package:mindmates/screens/authentification/sign_up.dart';

class Authentificate extends StatefulWidget {
  @override
  _AuthentificateState createState() => _AuthentificateState();
}

class _AuthentificateState extends State<Authentificate> {
  bool showSignIn = true;

  void toggleShowSignIn() {
    setState(() {
      showSignIn = !showSignIn;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showSignIn)
      return SignIn(toggleView: toggleShowSignIn);
    else
      return Register(toggleView: toggleShowSignIn);
  }
}
