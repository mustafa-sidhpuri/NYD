// Automatic FlutterFlow imports
import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';

import '/backend/backend.dart';
// Imports other custom actions
// Imports custom functions
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<DocumentReference?> getConversationData(String productId) async {
  CollectionReference _collectionRef =
      FirebaseFirestore.instance.collection('conversations');

  // current logged in user
  User? currentUser = FirebaseAuth.instance.currentUser;
  // Get docs from collection reference
  QuerySnapshot querySnapshot = await _collectionRef
      .where("product_id", isEqualTo: productId)
      .where("users", arrayContains: currentUser?.uid)
      .get();
  if (querySnapshot.size <= 0) {
    log("null");
    return null;
  }
  // Get data from docs and convert map to List
  final allData = querySnapshot.docs[0];
  log(allData.data().toString(), name: "Conversations");
  return querySnapshot.docs[0].reference;
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the button on the right!
