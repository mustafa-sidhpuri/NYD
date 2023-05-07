// Automatic FlutterFlow imports
import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';

import '/backend/backend.dart';
// Imports other custom actions
// Imports custom functions
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<ConversationsRecord?> getConversationData(String productId) async {
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
    
    return null;
  }
  // Get data from docs and convert map to List
  final conversation = querySnapshot.docs[0];
  Map<String, dynamic> conversationMap = conversation.data() as Map<String,dynamic>;
  // log(allData.data().toString(), name: "Conversations");
  return ConversationsRecord.getDocumentFromData(
      conversationMap, conversation.reference);
  
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the button on the right!
