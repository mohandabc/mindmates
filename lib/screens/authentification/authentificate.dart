import 'package:flutter/material.dart';
import 'package:mindmates/screens/authentification/sign_in.dart';

class Autenticate extends StatefulWidget {
  @override
  _AutenticateState createState() => _AutenticateState();
}

class _AutenticateState extends State<Autenticate> {
  @override
  Widget build(BuildContext context) {
    return Container(child: SignIn());
  }
}
