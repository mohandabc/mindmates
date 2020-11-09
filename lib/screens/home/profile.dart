import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mindmates/services/database.dart';
import 'package:provider/provider.dart';

import 'appBar.dart';

// Profile Route
class ProfilePage extends StatefulWidget {
  ProfilePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return StreamProvider<QuerySnapshot>.value(
      value: DatabaseService().profile,
      child: Scaffold(
          appBar: TopBar(
            backgroundColor: Color(0xff0f0f0f),
            context: context,
            view: 1,
          ),
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
                        style:
                            TextStyle(fontSize: 25, color: Color(0xFFf2526e))),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 0, top: 10),
                    width: MediaQuery.of(context).size.width * 0.7,
                    child: Text(
                        'I\'m 27yo, from Bouira, here to challenge myself and you. Are we on the same wave length ? let\'s see.',
                        style: TextStyle(fontSize: 12, color: Colors.grey)),
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
