// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:geocoding/geocoding.dart';

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the button on the right!

Future getLocation(LatLng? latlng) async {
  List<Placemark> placemarks = await placemarkFromCoordinates(
      latlng?.latitude ?? 0, latlng?.longitude ?? 0);
  // FFAppState().userlocation =
  FFAppState().userlocation =
      '${placemarks[0].subLocality ?? ''}, ${placemarks[0].locality ?? ''}, ${placemarks[0].administrativeArea ?? ''}';
  // Add your function code here!
}
