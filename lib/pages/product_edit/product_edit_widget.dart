import 'dart:convert';

import 'package:n_y_d_app/components/cached_network_image.dart';
import 'package:http/http.dart' as http;
import '../../backend/firebase_storage/storage.dart';
import '../../components/LoadingWidget.dart';
import '../../components/constants.dart';
import '../../components/search_location_api.dart';
import '../../flutter_flow/upload_data.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/add_product_photo/add_product_photo_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/main.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'product_edit_model.dart';
export 'product_edit_model.dart';

class ProductEditWidget extends StatefulWidget {
  const ProductEditWidget({
    Key? key,
    this.productData,
  }) : super(key: key);

  final PostsRecord? productData;

  @override
  _ProductEditWidgetState createState() => _ProductEditWidgetState();
}

class _ProductEditWidgetState extends State<ProductEditWidget> {
  late ProductEditModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();
  LatLng? currentUserLocationValue;

  TextEditingController textController1 = TextEditingController();
  String? Function(BuildContext, String?)? textController1Validator;
  // State field(s) for TextField widget.
  TextEditingController textController2 = TextEditingController();
  String? Function(BuildContext, String?)? textController2Validator;
  TextEditingController subCategoryController = TextEditingController();
  String? Function(BuildContext, String?)? subCategoryControllerValidator;
  List<AutocompletePrediction> placePredictions = [];
  TextEditingController locationField = TextEditingController();
  double? latitude;
  double? longitude;
  bool? setLocation = false;
  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProductEditModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      setState(() {
        FFAppState().mediaUrl = widget.productData!.images!.toList().toList();
      });
    });
    locationField = TextEditingController(
      text: widget.productData!.address,
    );
    textController1 = TextEditingController(
        text: valueOrDefault<String>(
      widget.productData!.name,
      'null',
    ));
    textController2 = TextEditingController(
        text: valueOrDefault<String>(
      widget.productData!.description,
      'null',
    ));
    subCategoryController = TextEditingController(
        text: valueOrDefault<String>(
      widget.productData!.subCategory,
      'null',
    ));
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
      print('Latitude: $latitude');
      print('Longitude: $longitude');
    } else {
      print('Failed to retrieve coordinates.');
    }
  }

  @override
  void dispose() {
    _model.dispose();

    _unfocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(22.0, 0.0, 22.0, 0.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 30.0, 0.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            Navigator.pop(context);
                          },
                          child: Icon(
                            Icons.arrow_back_ios,
                            color: Colors.black,
                            size: 24.0,
                          ),
                        ),
                        Text(
                          'Post Edit',
                          style: FlutterFlowTheme.of(context).headlineSmall,
                        ),
                        InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            if (FFAppState().mediaUrl.length == 0) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    'Please select atleast one image',
                                    style: FlutterFlowTheme.of(context)
                                        .bodySmall
                                        .override(
                                          fontFamily: 'Roboto',
                                          color: Colors.white,
                                        ),
                                  ),
                                  duration: Duration(milliseconds: 4000),
                                  backgroundColor:
                                      FlutterFlowTheme.of(context).primary,
                                ),
                              );
                              return;
                            }
                            if (textController1.text == '') {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    'Title can\'t be empty',
                                    style: FlutterFlowTheme.of(context)
                                        .bodySmall
                                        .override(
                                          fontFamily: 'Roboto',
                                          color: Colors.white,
                                        ),
                                  ),
                                  duration: Duration(milliseconds: 4000),
                                  backgroundColor:
                                      FlutterFlowTheme.of(context).primary,
                                ),
                              );
                              return;
                            }
                            if (textController2.text == '') {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    'Description can\'t be empty',
                                    style: FlutterFlowTheme.of(context)
                                        .bodySmall
                                        .override(
                                          fontFamily: 'Roboto',
                                          color: Colors.white,
                                        ),
                                  ),
                                  duration: Duration(milliseconds: 4000),
                                  backgroundColor:
                                      FlutterFlowTheme.of(context).primary,
                                ),
                              );
                              return;
                            }
                            if (subCategoryController.text == '') {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    'Category can\'t be empty',
                                    style: FlutterFlowTheme.of(context)
                                        .bodySmall
                                        .override(
                                          fontFamily: 'Roboto',
                                          color: Colors.white,
                                        ),
                                  ),
                                  duration: Duration(milliseconds: 4000),
                                  backgroundColor:
                                      FlutterFlowTheme.of(context).primary,
                                ),
                              );
                              return;
                            }
                            if (locationField.text == '') {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    'Location can\'t be empty',
                                    style: FlutterFlowTheme.of(context)
                                        .bodySmall
                                        .override(
                                          fontFamily: 'Roboto',
                                          color: Colors.white,
                                        ),
                                  ),
                                  duration: Duration(milliseconds: 4000),
                                  backgroundColor:
                                      FlutterFlowTheme.of(context).primary,
                                ),
                              );
                              return;
                            }

                            LoadingOverlay.show(context);
                            if (textController1.text.isNotEmpty &&
                                textController2.text.isNotEmpty &&
                                subCategoryController.text.isNotEmpty &&
                                FFAppState().mediaUrl.isNotEmpty) {
                              currentUserLocationValue =
                                  await getCurrentUserLocation(
                                      defaultLocation: LatLng(0.0, 0.0));

                              final postsUpdateData = {
                                ...createPostsRecordData(
                                  name: textController1.text,
                                  description: textController2.text,
                                  postType: _model.dropDownValue1,
                                  foodType: _model.dropDownValue3,
                                  updatedAt: getCurrentTimestamp,
                                  public: true,
                                  isPickedUp: false,
                                  subCategory: subCategoryController.text,
                                  latlong: setLocation == true
                                      ? LatLng(latitude!, longitude!)
                                      : LatLng(
                                          widget.productData!.latlong
                                                  ?.latitude ??
                                              0,
                                          widget.productData!.latlong
                                                  ?.longitude ??
                                              0),
                                  address: locationField.text,
                                  userRef: currentUserReference,
                                  postedBy: currentUserUid,
                                ),
                                'images': FFAppState().mediaUrl,
                              };
                              await widget.productData!.reference
                                  .update(postsUpdateData);
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    'Post Update SuccessFully',
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                  duration: Duration(milliseconds: 4000),
                                  backgroundColor:
                                      FlutterFlowTheme.of(context).primary,
                                ),
                              );
                              FFAppState().update(() {
                                FFAppState().mediaUrl = [];
                              });
                              LoadingOverlay.hide();
                              await Navigator.pushAndRemoveUntil(
                                context,
                                PageTransition(
                                  type: PageTransitionType.fade,
                                  duration: Duration(milliseconds: 0),
                                  reverseDuration: Duration(milliseconds: 0),
                                  child: NavBarPage(initialPage: 'sellingPage'),
                                ),
                                (r) => false,
                              );
                            }
                          },
                          child: Text(
                            'Save',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Roboto',
                                  color: FlutterFlowTheme.of(context).primary,
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () async {
                      if (FFAppState().mediaUrl.length == 5) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              'Maximum 5 images select',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            duration: Duration(milliseconds: 4000),
                            backgroundColor:
                                FlutterFlowTheme.of(context).primary,
                          ),
                        );
                      } else {
                        _model.uploadedFileUrl = "";
                        final selectedMedia =
                            await selectMediaWithSourceBottomSheet(
                          context: context,
                          allowPhoto: true,
                          backgroundColor:
                              FlutterFlowTheme.of(context).tertiary,
                          textColor: Colors.black,
                          pickerFontFamily: 'Lexend Deca',
                        );
                        LoadingOverlay.show(context);
                        if (selectedMedia != null &&
                            selectedMedia.every((m) =>
                                validateFileFormat(m.storagePath, context))) {
                          setState(() => _model.isDataUploading = true);
                          var selectedUploadedFiles = <FFUploadedFile>[];
                          List downloadUrls = <String>[];
                          try {
                            selectedUploadedFiles = selectedMedia
                                .map((m) => FFUploadedFile(
                                      name: m.storagePath.split('/').last,
                                      bytes: m.bytes,
                                      height: m.dimensions?.height,
                                      width: m.dimensions?.width,
                                      blurHash: m.blurHash,
                                    ))
                                .toList();

                            downloadUrls = (await Future.wait(
                              selectedMedia.map(
                                (m) async =>
                                    await uploadData(m.storagePath, m.bytes),
                              ),
                            ))
                                .where((u) => u != null)
                                .map((u) => u!)
                                .toList();
                          } finally {
                            LoadingOverlay.hide();
                            _model.isDataUploading = false;
                          }
                          LoadingOverlay.hide();
                          if (selectedUploadedFiles.length ==
                                  selectedMedia.length &&
                              downloadUrls.length == selectedMedia.length) {
                            setState(() {
                              _model.uploadedLocalFile =
                                  selectedUploadedFiles.first;
                              _model.uploadedFileUrl = downloadUrls.first;
                            });
                          } else {
                            setState(() {});
                            return;
                          }
                        }

                        if (_model.uploadedFileUrl != null &&
                            _model.uploadedFileUrl != '') {
                          setState(() {
                            FFAppState().addToMediaUrl(_model.uploadedFileUrl);
                          });
                        } else {
                          LoadingOverlay.hide();
                        }
                      }
                    },
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 24.0, 0.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: 76.0,
                                height: 76.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  borderRadius: BorderRadius.circular(12.0),
                                  border: Border.all(
                                    color: FlutterFlowTheme.of(context).primary,
                                  ),
                                ),
                                child: Icon(
                                  Icons.photo_camera_outlined,
                                  color: Color(0xFF0065FD),
                                  size: 28.0,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 12.0, 0.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                'Select Photos',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Roboto',
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                    ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 200.0,
                    decoration: BoxDecoration(),
                    child: Stack(
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 40.0, 0.0, 50.0),
                          child: Builder(
                            builder: (context) {
                              final images = FFAppState().mediaUrl.toList();
                              return ListView.builder(
                                padding: EdgeInsets.zero,
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                itemCount: images.length,
                                itemBuilder: (context, imagesIndex) {
                                  final imagesItem = images[imagesIndex];
                                  return Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        10.0, 0.0, 10.0, 0.0),
                                    child: Container(
                                      width: 80.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .tertiary,
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                        shape: BoxShape.rectangle,
                                      ),
                                      child: Stack(
                                        alignment:
                                            AlignmentDirectional(1.0, -1.0),
                                        children: [
                                          ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(12.0),
                                              child: CachedNetworkImageWidget(
                                                image: imagesItem,
                                                width: 100.0,
                                                height: 85.0,
                                              )),
                                          InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              setState(() {
                                                FFAppState().removeFromMediaUrl(
                                                    valueOrDefault<String>(
                                                  imagesItem,
                                                  'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/sample-app-property-finder-834ebu/assets/lhbo8hbkycdw/addCoverImage@2x.png',
                                                ));
                                              });
                                            },
                                            child: Container(
                                              width: 26.0,
                                              height: 25.0,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                borderRadius: BorderRadius.only(
                                                  bottomLeft:
                                                      Radius.circular(22.0),
                                                  bottomRight:
                                                      Radius.circular(0.0),
                                                  topLeft: Radius.circular(0.0),
                                                  topRight:
                                                      Radius.circular(10.0),
                                                ),
                                                shape: BoxShape.rectangle,
                                              ),
                                              child: Align(
                                                alignment: AlignmentDirectional(
                                                    0.4, -0.2),
                                                child: Icon(
                                                  Icons.delete_outlined,
                                                  color: Colors.white,
                                                  size: 14.0,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    'Title',
                    style: FlutterFlowTheme.of(context).labelMedium.override(
                          fontFamily: 'Roboto',
                          color: Color(0xFF7D8180),
                        ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0, right: 10),
                    child: TextFormField(
                      cursorColor: Colors.grey,
                      textInputAction: TextInputAction.done,
                      controller: textController1,
                      obscureText: false,
                      decoration: InputDecoration(
                        hintText: 'Add Title',
                        hintStyle:
                            FlutterFlowTheme.of(context).bodySmall.override(
                                  fontFamily: 'Roboto',
                                  color: Color(0xFFE6E6E6),
                                  fontSize: 12.0,
                                ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xFFE6E6E6),
                            width: 1.0,
                          ),
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(4.0),
                            topRight: Radius.circular(4.0),
                          ),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xFFE6E6E6),
                            width: 1.0,
                          ),
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(4.0),
                            topRight: Radius.circular(4.0),
                          ),
                        ),
                        errorBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0x00000000),
                            width: 1.0,
                          ),
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(4.0),
                            topRight: Radius.circular(4.0),
                          ),
                        ),
                        focusedErrorBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0x00000000),
                            width: 1.0,
                          ),
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(4.0),
                            topRight: Radius.circular(4.0),
                          ),
                        ),
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium,
                      validator: textController1Validator.asValidator(context),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 26.0, 0.0, 0.0),
                    child: Text(
                      'Description',
                      style: FlutterFlowTheme.of(context).labelMedium.override(
                            fontFamily: 'Roboto',
                            color: Color(0xFF7D8180),
                          ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0, right: 10),
                    child: TextFormField(
                      cursorColor: Colors.grey,
                      textInputAction: TextInputAction.done,
                      controller: textController2,
                      obscureText: false,
                      decoration: InputDecoration(
                        hintText: 'Add Post Description',
                        hintStyle:
                            FlutterFlowTheme.of(context).bodySmall.override(
                                  fontFamily: 'Roboto',
                                  color: Color(0xFFE6E6E6),
                                  fontSize: 12.0,
                                ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xFFE6E6E6),
                            width: 1.0,
                          ),
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(4.0),
                            topRight: Radius.circular(4.0),
                          ),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xFFE6E6E6),
                            width: 1.0,
                          ),
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(4.0),
                            topRight: Radius.circular(4.0),
                          ),
                        ),
                        errorBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0x00000000),
                            width: 1.0,
                          ),
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(4.0),
                            topRight: Radius.circular(4.0),
                          ),
                        ),
                        focusedErrorBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0x00000000),
                            width: 1.0,
                          ),
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(4.0),
                            topRight: Radius.circular(4.0),
                          ),
                        ),
                      ),
                      maxLines: 8,
                      minLines: 1,
                      keyboardType: TextInputType.multiline,
                      style: FlutterFlowTheme.of(context).bodyMedium,
                      validator: textController2Validator.asValidator(context),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 26.0, 0.0, 0.0),
                    child: Text(
                      'Offer',
                      style: FlutterFlowTheme.of(context).labelMedium.override(
                            fontFamily: 'Roboto',
                            color: Color(0xFF7D8180),
                          ),
                    ),
                  ),
                  FlutterFlowDropDown<String>(
                    controller: _model.dropDownValueController1 ??=
                        FormFieldController<String>(
                      _model.dropDownValue1 ??= valueOrDefault<String>(
                        widget.productData!.postType,
                        'null',
                      ),
                    ),
                    options: ['Free', 'Exchange'],
                    optionLabels: ['Free', 'Exchange'],
                    onChanged: (val) =>
                        setState(() => _model.dropDownValue1 = val),
                    height: 50.0,
                    searchHintTextStyle:
                        FlutterFlowTheme.of(context).bodyLarge.override(
                              fontFamily: 'Roboto',
                              color: FlutterFlowTheme.of(context).secondaryText,
                            ),
                    textStyle: FlutterFlowTheme.of(context).bodyMedium,
                    hintText: 'Free/Exchange',
                    searchHintText: 'Search for an item...',
                    icon: Icon(
                      Icons.keyboard_arrow_down,
                      color: Colors.black,
                      size: 22.0,
                    ),
                    fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                    elevation: 2.0,
                    borderColor: Colors.transparent,
                    borderWidth: 0.0,
                    borderRadius: 0.0,
                    margin:
                        EdgeInsetsDirectional.fromSTEB(12.0, 4.0, 12.0, 4.0),
                    isSearchable: false,
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 26.0, 0.0, 0.0),
                    child: Text(
                      'Category',
                      style: FlutterFlowTheme.of(context).labelMedium.override(
                            fontFamily: 'Roboto',
                            color: Color(0xFF7D8180),
                          ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
                    child: TextFormField(
                      cursorColor: Colors.grey,
                      textInputAction: TextInputAction.done,
                      controller: subCategoryController,
                      obscureText: false,
                      decoration: InputDecoration(
                        hintText:
                            'Rice, Flour, Vegetables, Dairy Products etc..',
                        hintStyle:
                            FlutterFlowTheme.of(context).bodySmall.override(
                                  fontFamily: 'Roboto',
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.w500,
                                ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xFF000000).withOpacity(0.1),
                            width: 1.0,
                          ),
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(4.0),
                            topRight: Radius.circular(4.0),
                          ),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xFF000000).withOpacity(0.1),
                            width: 1.0,
                          ),
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(4.0),
                            topRight: Radius.circular(4.0),
                          ),
                        ),
                        errorBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0x00000000),
                            width: 1.0,
                          ),
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(4.0),
                            topRight: Radius.circular(4.0),
                          ),
                        ),
                        focusedErrorBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0x00000000),
                            width: 1.0,
                          ),
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(4.0),
                            topRight: Radius.circular(4.0),
                          ),
                        ),
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Roboto',
                            fontSize: 14.0,
                          ),
                      validator:
                          subCategoryControllerValidator.asValidator(context),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 26.0, 0.0, 0.0),
                    child: Text(
                      'Condition',
                      style: FlutterFlowTheme.of(context).labelMedium.override(
                            fontFamily: 'Roboto',
                            color: Color(0xFF7D8180),
                          ),
                    ),
                  ),
                  FlutterFlowDropDown<String>(
                    controller: _model.dropDownValueController3 ??=
                        FormFieldController<String>(
                      _model.dropDownValue3 ??= valueOrDefault<String>(
                        widget.productData!.foodType,
                        'null',
                      ),
                    ),
                    options: ['Raw', 'Cooked'],
                    optionLabels: ['Raw', 'Cooked'],
                    onChanged: (val) =>
                        setState(() => _model.dropDownValue3 = val),
                    height: 50.0,
                    searchHintTextStyle:
                        FlutterFlowTheme.of(context).bodyLarge.override(
                              fontFamily: 'Roboto',
                              color: FlutterFlowTheme.of(context).secondaryText,
                            ),
                    textStyle: FlutterFlowTheme.of(context).bodyMedium,
                    hintText: 'Raw/Cooked',
                    searchHintText: 'Search for an item...',
                    icon: Icon(
                      Icons.keyboard_arrow_down,
                      color: Colors.black,
                      size: 22.0,
                    ),
                    fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                    elevation: 2.0,
                    borderColor: Colors.transparent,
                    borderWidth: 0.0,
                    borderRadius: 0.0,
                    margin:
                        EdgeInsetsDirectional.fromSTEB(12.0, 4.0, 12.0, 4.0),
                    isSearchable: false,
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 26.0, 0.0, 0.0),
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
                      cursorColor: Colors.grey,
                      style: TextStyle(
                          color: Colors.black
                      ),
                      controller: locationField,
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
                  Container(
                      //color: Colors.pinkAccent,
                      height: 250,
                      child: ListView.builder(
                          padding: EdgeInsets.zero,
                          scrollDirection: Axis.vertical,
                          itemCount: placePredictions.length,
                          itemBuilder: (context, index) {
                            return Column(
                              children: [
                                ListTile(
                                  onTap: () async {
                                    locationField.text =
                                        placePredictions[index].description!;
                                    setState(() {});
                                    setLocation = true;
                                    getCoordinates(locationField.text);
                                    placePredictions.clear();
                                  },
                                  horizontalTitleGap: 0,
                                  leading: Icon(
                                    Icons.location_on_outlined,
                                    color: Colors.black,
                                    size: 24.0,
                                  ),
                                  title: Text(
                                    placePredictions[index].description!,
                                    style: TextStyle(
                                        fontSize: 14, color: Colors.black),
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
                          }))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
