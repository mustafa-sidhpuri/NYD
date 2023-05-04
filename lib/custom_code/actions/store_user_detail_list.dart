// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<List<UserStruct>> storeUserDetailList(
  UsersRecord currentUser,
  UsersRecord postUser,
) async {
  return [
    createUserStruct(
        userId: currentUser.uid,
        userName: currentUser.displayName,
        userImage: currentUser.photoUrl),
    createUserStruct(
        userId: postUser.uid,
        userName: postUser.displayName,
        userImage: postUser.photoUrl),
  ];
}
