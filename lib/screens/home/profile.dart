import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mindmates/models/myprofile.dart';
import 'package:mindmates/services/auth.dart';
import 'package:provider/provider.dart';

// Profile Route
class ProfilePage extends StatefulWidget {
  ProfilePage({Key key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final formKey = GlobalKey<FormState>();
  final Auth_service _auth = Auth_service();

  @override
  Widget build(BuildContext context) {
    // for (var doc in profile.docs) print(doc.data());

    return Scaffold(
        body: Container(
      color: Color(0xff0f0f0f),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(left: 0.0, top: 20),
              width: 200,
              height: 200,
              child: CircleAvatar(
                child: CircleAvatar(
                  radius: 95,
                  backgroundImage: AssetImage("images/profile.jpg"),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 0, top: 20),
              child: Text('Mazigh Ab',
                  style: TextStyle(fontSize: 25, color: Color(0xFFf2526e))),
            ),
            Container(
              margin: EdgeInsets.only(left: 0, top: 10),
              width: MediaQuery.of(context).size.width * 0.7,
              child: Text(
                  'I\'m 27yo, from Bouira, here to challenge myself and you. Are we on the same wave length ? let\'s see.',
                  style: TextStyle(fontSize: 12, color: Colors.grey)),
            ),
            Container(
              margin: EdgeInsets.only(left: 0, top: 20),
              child: Text("Are we brain-mates/mind-mates :",
                  style: TextStyle(fontSize: 14, color: Colors.grey[600])),
            ),
            Form(
              key: formKey,
              child: Column(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.7,
                    child: TextFormField(
                      decoration: InputDecoration(
                          labelText:
                              "Who said 'There is no cure for being a cunt in GOT?'",
                          fillColor: Colors.red),
                      // onSaved: (value) => _reponse1 = value,
                    ),
                  ),
                  RaisedButton(
                    child: Text("Done"),
                    onPressed: () {}, //_submit,
                  ),
                  RaisedButton(
                    child: Text("Logout"),
                    onPressed: () async {
                      _auth.signOut();
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    ));
  }
}
