import 'package:firebase_auth/firebase_auth.dart';
import 'package:mindmates/models/myuser.dart';
import 'package:mindmates/services/database.dart';

class Auth_service {
  final FirebaseAuth _auth = FirebaseAuth.instance;

// create our user from firebase user
  MyUser _userFromFirebaseUser(User user) {
    return user != null ? MyUser(uid: user.uid) : null;
  }

  // auth change user stream
  Stream<MyUser> get user {
    return _auth
        .authStateChanges()
        .map((User user) => _userFromFirebaseUser(user));
  }

  // sign in anonymous
  Future sign_in_anon() async {
    try {
      UserCredential result = await _auth.signInAnonymously();
      User user = result.user;
      return _userFromFirebaseUser(user);
    } catch (e) {
      return null;
    }
  }

  // Register with email and password
  Future registerEmail(String email, String password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      MyUser user = _userFromFirebaseUser(result.user);

      // create a record for the user profile
      await DatabaseService(uid: user.uid)
          .updateUserData("New Profile", 18, "Male");
      return user;
    } catch (e) {
      return null;
    }
  }

  // Sign in with email
  Future signInEmail(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      MyUser user = _userFromFirebaseUser(result.user);
      return user;
    } catch (e) {
      return null;
    }
  }

  // sign out
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
