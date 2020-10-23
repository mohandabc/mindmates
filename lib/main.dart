import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mindmates/models/myuser.dart';
import 'package:mindmates/screens/wrapper.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:mindmates/services/auth.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MindMates());
}

class MindMates extends StatelessWidget {
  // This widget is the root of your application.
  // Color color1 = Color(0xff0f0f0f);
  @override
  Widget build(BuildContext context) {
    return StreamProvider<MyUser>.value(
      value: Auth_service().user,
      child: MaterialApp(
        title: 'Mind Mates',
        theme: ThemeData(
          primaryIconTheme: IconThemeData(color: Color(0xFFf2526e)),
          primaryColor: Colors.blue,
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),

        // for now its explore page, but will become login page
        home: Wrapper(),
      ),
    );
  }
}
