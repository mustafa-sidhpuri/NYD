import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart'as http;


class NetworkUtility{
  static Future<String?> fetchUrl (Uri uri, {Map<String, String>? headers}) async{
      try{
        final response = await http.get(uri,headers: headers);
        if(response.statusCode == 200){
          return response.body;
        }
      }catch (e){
        debugPrint(e.toString());
      }
      return null;
  }
}

class AutocompletePrediction {
  /// [description] contains the human-readable name for the returned result. For establishment results, this is usually
  /// the business name.
  final String? description;

  /// [structuredFormatting] provides pre-formatted text that can be shown in your autocomplete results
  final StructuredFormatting? structuredFormatting;

  /// [placeId] is a textual identifier that uniquely identifies a place. To retrieve information about the place,
  /// pass this identifier in the placeId field of a Places API request. For more information about place IDs.
  final String? placeId;

  /// [reference] contains reference.
  final String? reference;

  AutocompletePrediction({
    this.description,
    this.structuredFormatting,
    this.placeId,
    this.reference,
  });

  factory AutocompletePrediction.fromJson(Map<String, dynamic> json) {
    return AutocompletePrediction(
      description: json['description'] as String?,
      placeId: json['place_id'] as String?,
      reference: json['reference'] as String?,
      structuredFormatting: json['structured_formatting'] != null
          ? StructuredFormatting.fromJson(json['structured_formatting'])
          : null,
    );
  }
}

class StructuredFormatting {
  /// [mainText] contains the main text of a prediction, usually the name of the place.
  final String? mainText;

  /// [secondaryText] contains the secondary text of a prediction, usually the location of the place.
  final String? secondaryText;

  StructuredFormatting({this.mainText, this.secondaryText});

  factory StructuredFormatting.fromJson(Map<String, dynamic> json) {
    return StructuredFormatting(
      mainText: json['main_text'] as String?,
      secondaryText: json['secondary_text'] as String?,
    );
  }
}


class PlaceAutocompleteResponse {
  final String? status;
  final List<AutocompletePrediction>? predictions;

  PlaceAutocompleteResponse({this.status, this.predictions});

  factory PlaceAutocompleteResponse.fromJson(Map<String, dynamic> json) {
    return PlaceAutocompleteResponse(
      status: json['status'] as String?,
      // ignore: prefer_null_aware_operators
      predictions: json['predictions'] != null
          ? json['predictions']
          .map<AutocompletePrediction>(
              (json) => AutocompletePrediction.fromJson(json))
          .toList()
          : null,
    );
  }

  static PlaceAutocompleteResponse parseAutocompleteResult(
      String responseBody) {
    final parsed = json.decode(responseBody).cast<String, dynamic>();

    return PlaceAutocompleteResponse.fromJson(parsed);
  }
}