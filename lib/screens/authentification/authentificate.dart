import 'package:flutter/material.dart';
import 'package:mindmates/screens/authentification/sign_in.dart';
import 'package:mindmates/screens/authentification/sign_up.dart';

class Authentificate extends StatefulWidget {
  @override
  _AuthentificateState createState() => _AuthentificateState();
}

class _AuthentificateState extends State<Authentificate> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: [0.1, 0.3, 0.9],
          colors: [
            Color(0xFFf3a9ba),
            Color(0xFFf27f97),
            Color(0xFFf2526e),
          ],
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('images/logo.png'),
          SizedBox(
            height: 70,
          ),
          ButtonTheme(
            minWidth: MediaQuery.of(context).size.width * 0.7,
            height: 50,
            child: RaisedButton.icon(
              icon: Icon(Icons.mail),
              label: Text("Connect with email"),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SignIn(),
                    ));
              },
            ),
          ),
          SizedBox(
            height: 20,
          ),
          ButtonTheme(
            minWidth: MediaQuery.of(context).size.width * 0.7,
            height: 50,
            child: RaisedButton.icon(
              icon: Icon(Icons.phone),
              label: Text("Connect with phone"),
              onPressed: () {},
            ),
          ),
          SizedBox(
            height: 20,
          ),
          ButtonTheme(
            minWidth: MediaQuery.of(context).size.width * 0.7,
            height: 50,
            child: RaisedButton.icon(
              icon: ImageIcon(AssetImage('images/facebook.png')),
              label: Text("Connect with Facebook"),
              onPressed: () {},
            ),
          ),
        ],
      ),
    );

    // SignIn();
  }
}
