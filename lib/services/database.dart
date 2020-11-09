import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String uid;
  DatabaseService({this.uid});

  final CollectionReference profileCollection =
      FirebaseFirestore.instance.collection('profile');

  Future updateUserData(String name, int age, String sexe) async {
    return await profileCollection.doc(uid).set({
      'name': name,
      'age': age,
      'sexe': sexe,
    });
  }

  // get profile stream
  Stream<QuerySnapshot> get profile {
    return profileCollection.snapshots();
  }
}
