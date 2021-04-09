import 'package:cloud_firestore/cloud_firestore.dart';

class BobModel {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<List> getAllBobs() async {
    List bobs = [];
    await firestore
        .collection('BOB_LOCATIONS')
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        bobs.add(doc.data());
      });
    });
    return bobs;
  }
}
