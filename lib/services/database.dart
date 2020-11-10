import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mindmates/models/myprofile.dart';

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

  // profile from snapshot
  List<MyProfile> _profileListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return MyProfile(
        name: doc.get('name') ?? '',
        age: doc.get('age') ?? 0,
        sexe: doc.get('sexe') ?? '',
      );
    }).toList();
  }

  // get profile stream
  Stream<List<MyProfile>> get profile {
    return profileCollection.snapshots().map(_profileListFromSnapshot);
  }
}
