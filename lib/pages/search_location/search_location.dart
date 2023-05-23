import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import '../../app_state.dart';
import '../../backend/schema/posts_record.dart';
import '../../components/constants.dart';
import '../../components/search_location_api.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/lat_lng.dart';

class SearchLocation extends StatefulWidget {
  final TextEditingController locationField;
   double? setLat;
   double? setLong;
   bool? setLocation;
   SearchLocation({Key? key, required this.locationField, required this.setLat, required this.setLong, required this.setLocation}) : super(key: key);

  @override
  State<SearchLocation> createState() => _SearchLocationState();
}

class _SearchLocationState extends State<SearchLocation> {
  List<AutocompletePrediction> placePredictions = [];
  double? latitude;
  double? longitude;
  @override
  void initState() {
    super.initState();

  }

  void placeAutocomplete(String query) async {
    Uri uri =
        Uri.https("maps.googleapis.com", 'maps/api/place/autocomplete/json', {
      "input": query,
      "key": apiKey,
    });

    String? response = await NetworkUtility.fetchUrl(uri);

    if (response != null) {
      //print(response);
      PlaceAutocompleteResponse result =
          PlaceAutocompleteResponse.parseAutocompleteResult(response);
      if (result.predictions != null) {
        setState(() {
          placePredictions = result.predictions!;
        });
      }
    }
  }

  Future<Map<String, dynamic>?> getLocationFromAddress(String address) async {
    final apiKey =
        "AIzaSyAZuQe6qz_GdmxUJ2PBs6xA4Lm5LAjj0CQ"; // Replace with your Google Geocoding API key
    final encodedAddress = Uri.encodeQueryComponent(address);
    final url =
        'https://maps.googleapis.com/maps/api/geocode/json?address=$encodedAddress&key=$apiKey';

    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final decodedData = json.decode(response.body);
      if (decodedData['status'] == 'OK') {
        final results = decodedData['results'] as List<dynamic>;
        if (results.isNotEmpty) {
          final location = results[0]['geometry']['location'];
          final latitude = location['lat'];
          final longitude = location['lng'];
          return {
            'latitude': latitude,
            'longitude': longitude,
          };
        }
      }
    }
    return null;
  }

  void getCoordinates(String selectedAddress) async {
    final address = selectedAddress;
    final coordinates = await getLocationFromAddress(address);
    if (coordinates != null) {

      latitude = coordinates['latitude'];
     longitude = coordinates['longitude'];

     FFAppState().postLatLng =  LatLng(position?.latitude ?? 0, position?.longitude ?? 0);

      print('Latitude: ${latitude}');
      print('Longitude: ${longitude}');

    } else {
      print('Failed to retrieve coordinates.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 22, right: 22.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 30.0, 0.0, 0.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () async {
                        Navigator.pop(context);
                      },
                      child: Icon(
                        Icons.arrow_back_ios,
                        color: Colors.black,
                        size: 24.0,
                      ),
                    ),
                    Expanded(
                      child: Center(
                        child: Text(
                          'Search Location',
                          style: FlutterFlowTheme.of(context).headlineSmall,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 26.0, 0.0, 0.0),
                child: Text(
                  'Location',
                  style: FlutterFlowTheme.of(context).labelMedium.override(
                        fontFamily: 'Roboto',
                        color: Color(0xFF7D8180),
                      ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: TextFormField(
                  style: TextStyle(color: Colors.black),
                  cursorColor: Colors.grey,
                  controller: widget.locationField,
                  onChanged: (value) {
                    placeAutocomplete(value);
                  },
                  textInputAction: TextInputAction.search,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Search your location",
                    hintStyle: TextStyle(color: Colors.grey, fontSize: 14),
                    suffixIcon: Icon(
                      Icons.location_on_outlined,
                      color: Colors.black,
                      size: 24.0,
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xFF000000).withOpacity(0.1),
                      ),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xFF000000).withOpacity(0.1),
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: ListView.builder(
                    padding: EdgeInsets.zero,
                    scrollDirection: Axis.vertical,
                    itemCount: placePredictions.length,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          ListTile(
                            onTap: () async {
                              widget.locationField.text =
                                  placePredictions[index].description!;
                              widget.setLocation = true;
                              getCoordinates(widget.locationField.text);
                              placePredictions.clear();
                               Navigator.pop(context,[widget.setLocation]);
                              print(widget.locationField.text);
                              print(widget.setLocation);
                            },
                            horizontalTitleGap: 0,
                            leading: Icon(
                              Icons.location_on_outlined,
                              color: Colors.black,
                              size: 24.0,
                            ),
                            title: Text(
                              placePredictions[index].description!,
                              style:
                                  TextStyle(fontSize: 14, color: Colors.black),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Divider(
                            height: 2,
                            thickness: 2,
                            color: Colors.grey,
                          )
                        ],
                      );
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
