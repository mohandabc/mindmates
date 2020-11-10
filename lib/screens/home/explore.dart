import 'package:flutter/material.dart';
import 'package:mindmates/models/myprofile.dart';
import 'package:mindmates/screens/home/appBar.dart';
import 'package:mindmates/services/auth.dart';
import 'package:provider/provider.dart';
import 'profile_tile.dart';
import 'appBar.dart';

class ExplorePage extends StatefulWidget {
  ExplorePage({Key key}) : super(key: key);

  @override
  _ExplorePageState createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  final formKey = GlobalKey<FormState>();

  String _reponse1;
  final questions = <String>[];
  final responses = <String>[];

  // int _counter = 0;

  void _submit() {
    setState(() {
      if (formKey.currentState.validate()) {
        formKey.currentState.save();

        // /* TODO : check if answers are correct*/
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final profile = Provider.of<List<MyProfile>>(context);

    return ListView.builder(
      padding: EdgeInsets.all(0),
      itemCount: profile.length,
      itemBuilder: (context, index) {
        return ProfileTile(profile: profile[index]);
      },
    );
  }
}
