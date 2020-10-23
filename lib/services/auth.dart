import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class Auth_service {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  // sighn in anonymous
  // Firebase.initializeApp();
  Future sign_in_anon() async {
    try {
      UserCredential result = await _auth.signInAnonymously();
      return result.user;
    } catch (e) {
      print("error sign in");
      return null;
    }
  }
  // sign out
}
