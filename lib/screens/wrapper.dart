import 'package:flutter/material.dart';
import 'package:mindmates/models/myuser.dart';
import 'package:mindmates/screens/home/explore.dart';
import 'package:mindmates/screens/authentification/authentificate.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<MyUser>(context);

    // return home or login
    if (user == null)
      return Authentificate();
    else
      return ExplorePage();
  }
}
