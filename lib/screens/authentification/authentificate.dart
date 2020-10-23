import 'package:flutter/material.dart';
import 'package:mindmates/screens/authentification/sign_in.dart';

class Authentificate extends StatefulWidget {
  @override
  _AuthentificateState createState() => _AuthentificateState();
}

class _AuthentificateState extends State<Authentificate> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SignIn(),
    );
  }
}
