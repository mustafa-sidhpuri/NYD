import 'package:n_y_d_app/pages/search_location/search_location.dart';
import '../../components/LoadingWidget.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/main.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'add_product_detail_model.dart';
export 'add_product_detail_model.dart';

class AddProductDetailWidget extends StatefulWidget {
  const AddProductDetailWidget({
    Key? key,
    this.productName,
    this.productDescription,
    this.images,
  }) : super(key: key);

  final String? productName;
  final String? productDescription;
  final List<String>? images;

  @override
  _AddProductDetailWidgetState createState() => _AddProductDetailWidgetState();
}

class _AddProductDetailWidgetState extends State<AddProductDetailWidget> {
  late AddProductDetailModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();
  LatLng? currentUserLocationValue;
  TextEditingController locationField = TextEditingController();

  TextEditingController subCategoryController = TextEditingController();
  String? Function(BuildContext, String?)? subCategoryControllerValidator;

  bool? setLocation = false;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AddProductDetailModel());
    subCategoryController = TextEditingController();
    locationField = TextEditingController(
      text: FFAppState().setLocation,
    );
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 30.0, 0.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
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
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    72.0, 0.0, 0.0, 0.0),
                                child: Text(
                                  'Add Post Details',
                                  style: FlutterFlowTheme.of(context)
                                      .headlineSmall,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 26.0, 0.0, 0.0),
                          child: Text(
                            'Offer',
                            style: FlutterFlowTheme.of(context)
                                .labelMedium
                                .override(
                                  fontFamily: 'Roboto',
                                  color: Color(0xFF7D8180),
                                ),
                          ),
                        ),
                        FlutterFlowDropDown<String>(
                          controller: _model.dropDownValueController1 ??=
                              FormFieldController<String>(
                            _model.dropDownValue1 ??= '',
                          ),
                          options: ['Free', 'Exchange'],
                          optionLabels: ['Free', 'Exchange'],
                          onChanged: (val) =>
                              setState(() => _model.dropDownValue1 = val),
                          height: 50.0,
                          searchHintTextStyle: FlutterFlowTheme.of(context)
                              .bodyLarge
                              .override(
                                fontFamily: 'Roboto',
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                              ),
                          textStyle: FlutterFlowTheme.of(context).bodyMedium,
                          hintText: 'Free/Exchange',
                          searchHintText: 'Search for an item...',
                          icon: Icon(
                            Icons.keyboard_arrow_down,
                            color: Colors.black,
                            size: 22.0,
                          ),
                          fillColor:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          elevation: 2.0,
                          borderColor: Colors.transparent,
                          borderWidth: 0.0,
                          borderRadius: 0.0,
                          margin: EdgeInsetsDirectional.fromSTEB(
                              12.0, 4.0, 12.0, 4.0),
                          isSearchable: false,
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 26.0, 0.0, 0.0),
                          child: Text(
                            'Category',
                            style: FlutterFlowTheme.of(context)
                                .labelMedium
                                .override(
                                  fontFamily: 'Roboto',
                                  color: Color(0xFF7D8180),
                                ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              10.0, 0.0, 10.0, 0.0),
                          child: TextFormField(
                            cursorColor: Colors.grey,
                            controller: subCategoryController,
                            obscureText: false,
                            decoration: InputDecoration(
                              hintText:
                                  'Rice, Flour, Vegetables, Dairy Products etc..',
                              hintStyle: FlutterFlowTheme.of(context)
                                  .bodySmall
                                  .override(
                                    fontFamily: 'Roboto',
                                    fontSize: 14.0,
                                    color: Colors.grey,
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
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Roboto',
                                  fontSize: 14.0,
                                ),
                            validator: subCategoryControllerValidator
                                .asValidator(context),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 26.0, 0.0, 0.0),
                          child: Text(
                            'Condition',
                            style: FlutterFlowTheme.of(context)
                                .labelMedium
                                .override(
                                  fontFamily: 'Roboto',
                                  color: Color(0xFF7D8180),
                                ),
                          ),
                        ),
                        FlutterFlowDropDown<String>(
                          controller: _model.dropDownValueController2 ??=
                              FormFieldController<String>(
                            _model.dropDownValue2 ??= '',
                          ),
                          options: ['Raw', 'Cooked'],
                          optionLabels: ['Raw', 'Cooked'],
                          onChanged: (val) =>
                              setState(() => _model.dropDownValue2 = val),
                          height: 50.0,
                          searchHintTextStyle: FlutterFlowTheme.of(context)
                              .bodyLarge
                              .override(
                                fontFamily: 'Roboto',
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                              ),
                          textStyle: FlutterFlowTheme.of(context).bodyMedium,
                          hintText: 'Raw/Cooked',
                          searchHintText: 'Search for an item...',
                          icon: Icon(
                            Icons.keyboard_arrow_down,
                            color: Colors.black,
                            size: 22.0,
                          ),
                          fillColor:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          elevation: 2.0,
                          borderColor: Colors.transparent,
                          borderWidth: 0.0,
                          borderRadius: 0.0,
                          margin: EdgeInsetsDirectional.fromSTEB(
                              12.0, 4.0, 12.0, 4.0),
                          isSearchable: false,
                        ),
                        GestureDetector(
                          onTap: (){
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => SearchLocation(
                                  locationField:locationField,
                                setLocation: setLocation,
                              ),
                            )).then((value) {
                              setLocation = value[0];
                              print("-------------------------------------"+value.toString());
                              setState(() {

                              });
                            });
                          },
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
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
                                padding: EdgeInsetsDirectional.fromSTEB(8.0, 10.0, 8.0, 0.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Flexible(
                                      child: Text(
                                        locationField.text,
                                        maxLines: 5,
                                        overflow: TextOverflow.ellipsis,
                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                          fontFamily: 'Roboto',
                                          fontSize: 16.0,
                                        ),
                                      ),
                                    ),
                                    Icon(
                                      Icons.location_on_outlined,
                                      color: Colors.black,
                                      size: 24.0,
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Divider(
                                      thickness: 1.0,
                                      color: Color(0xFF000000).withOpacity(0.1),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 30.0),
                  child: InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
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
                      if (_model.dropDownValue1 == '') {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              'Offer can\'t be empty',
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

                      if (_model.dropDownValue2 == '') {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              'Condition can\'t be empty',
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
                      currentUserLocationValue = await getCurrentUserLocation(
                          defaultLocation: LatLng(0.0, 0.0));
                      if ((_model.dropDownValue1 != null &&
                              _model.dropDownValue1 != '') &&
                          (subCategoryController.text != '') &&
                          (_model.dropDownValue2 != null &&
                              _model.dropDownValue2 != '')) {
                        final postsCreateData = {
                          ...createPostsRecordData(
                            name: valueOrDefault<String>(
                              widget.productName,
                              '',
                            ),
                            description: valueOrDefault<String>(
                              widget.productDescription,
                              '',
                            ),
                            postType: valueOrDefault<String>(
                              _model.dropDownValue1,
                              'Free',
                            ),
                            foodType: valueOrDefault<String>(
                              _model.dropDownValue2,
                              'Cooked',
                            ),
                            latlong: setLocation == true?
                            FFAppState().postLatLng:currentUserLocationValue,
                            address: locationField.text,
                            createdAt: getCurrentTimestamp,
                            updatedAt: getCurrentTimestamp,
                            public: true,
                            isDelete: false,
                            isPickedUp: false,
                            subCategory: subCategoryController.text,
                            postedByName: currentUserDisplayName,
                            postedByProfile: currentUserPhoto,
                            userRef: currentUserReference,
                            postedBy: currentUserUid,
                          ),
                          'images': widget.images,
                        };
                        var postsRecordReference = PostsRecord.collection.doc();
                        await postsRecordReference.set(postsCreateData);
                        _model.postData = PostsRecord.getDocumentFromData(
                            postsCreateData, postsRecordReference);
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              'Post Added Successfully',
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
                            child: NavBarPage(initialPage: 'sellingPage',index: 0,),
                          ),
                          (r) => false,
                        );
                      }

                      setState(() {});
                    },
                    child: Container(
                      height: 43.0,
                      padding: EdgeInsets.symmetric(vertical: 12),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).primary,
                        borderRadius: BorderRadius.circular(22.0),
                      ),
                      child: Text(
                        'Post',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Roboto',
                              color: Colors.white,
                              fontSize: 16.0,
                              fontWeight: FontWeight.w600,
                            ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
