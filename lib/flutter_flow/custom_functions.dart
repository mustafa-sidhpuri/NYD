import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import '../backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../auth/firebase_auth/auth_util.dart';

double ratingSummary(
  double totalRatings,
  double rating,
) {
  // get average rating to one decimal point from list of reviews
  if (totalRatings > 0) {
    return (rating +
            (totalRatings - rating) ~/ math.max((totalRatings ~/ 5), 1)) /
        2;
  } else {
    return rating;
  }
}

String ratingSummaryList(List<ReviewsRecord> rating) {
  if (rating.isEmpty) {
    return '-';
  }
  var ratingsSum = 0.0;
  for (final comment in rating) {
    ratingsSum += comment.rating!;
  }
  return (ratingsSum / rating.length).toStringAsFixed(1);
}

List<UserStruct>? getUserDetailList(
  String cUserId,
  String cUserImage,
  String cUserName,
  String pUserId,
  String pUserImage,
  String pUserName,
) {
  List<UserStruct> users = [];
  users.add(createUserStruct(
      userId: cUserId,
      userName: cUserName,
      userImage: cUserImage,
      clearUnsetFields: false,
      create: true));
  users.add(createUserStruct(
      userId: pUserId,
      userName: pUserName,
      userImage: pUserImage,
      clearUnsetFields: false,
      create: true));
  return users;
}

String? getData() {
  CollectionReference _collectionRef =
      FirebaseFirestore.instance.collection('conversation');
  // Get docs from collection reference
  QuerySnapshot querySnapshot = await _collectionRef.get();
  // Get data from docs and convert map to List
  final allData = querySnapshot.docs.map((doc) => doc.data()).toList();
  print(allData);
}
