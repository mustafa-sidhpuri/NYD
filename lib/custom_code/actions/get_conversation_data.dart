// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<String> getConversationData(
  String productId,
) async {
  CollectionReference _collectionRef =
      FirebaseFirestore.instance.collection('/conversation');
  // Get docs from collection reference
  QuerySnapshot querySnapshot =
      await _collectionRef.where("product_id", isEqualTo: productId).get();
  // Get data from docs and convert map to List
  final allData = querySnapshot.docs.map((doc) => doc.data()).toList();
  print(allData);
  return querySnapshot.docs[0].id;
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the button on the right!
