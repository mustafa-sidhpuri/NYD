import 'package:geolocator/geolocator.dart';
import 'package:n_y_d_app/pages/home_page/location.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../components/cached_network_image.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/product_details/product_details_widget.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'home_page_model.dart';
export 'home_page_model.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({Key? key}) : super(key: key);

  @override
  _HomePageWidgetState createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  late HomePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
 // LatLng? currentUserLocationValue;

  Position? position;
  TextEditingController textController = TextEditingController();
  String? Function(BuildContext, String?)? textControllerValidator;

  Future<void> _requestPermission() async {


    PermissionStatus status = await Permission.locationWhenInUse.request();

    if (status == PermissionStatus.denied ||
        status == PermissionStatus.permanentlyDenied) {
      Permission.locationWhenInUse.request();
    } else {
      position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
      FFAppState().update(() {
        FFAppState().savedPost =
            (currentUserDocument?.savedPost?.toList() ?? []).toList();
      });
      if(FFAppState().userlocation == null || FFAppState().userlocation == "") {
        SchedulerBinding.instance.addPostFrameCallback((_) async {
          FFAppState().currentUserLocationValue =
              LatLng(position?.latitude ?? 23.102456, position?.longitude ?? 72.5383451);
          await actions.getLocation(
            FFAppState().currentUserLocationValue,
          );
          FFAppState().update(() {
            FFAppState().setLocation = FFAppState().userlocation;
            FFAppState().savedPost =
                (currentUserDocument?.savedPost?.toList() ?? []).toList();
          });

          final usersUpdateData = createUsersRecordData(
            userAddress: FFAppState().setLocation,
            latlng: FFAppState().currentUserLocationValue,
          );
          await currentUserReference!.update(usersUpdateData);
        });

        //  currentUserLocationValue = LatLng(position.latitude,position.longitude);
        print('Location service is enabled and permission is granted.');
      }

    }
  }

  final _unfocusNode = FocusNode();
  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomePageModel());
      _requestPermission();
    // On page load action.

    textController = TextEditingController();
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
    if (FFAppState().currentUserLocationValue == null) {
      return Container(
        color: FlutterFlowTheme.of(context).primaryBackground,
        child: Center(
          child: SizedBox(
            width: 50.0,
            height: 50.0,
            child: CircularProgressIndicator(
              color: FlutterFlowTheme.of(context).primary,
            ),
          ),
        ),
      );
    }

    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(22.0, 30.0, 22.0, 0.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AuthUserStreamWidget(
                          builder: (context) => Text(
                            'Hello $currentUserDisplayName!',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Roboto',
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.of(context)
                                .push(MaterialPageRoute(
                              builder: (context) => UserLocation(

                              ),
                            ))
                                .then((value) {
                              setState(() {});
                            });
                          },
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 4.0, 0.0, 0.0),
                            child: Container(
                              width: 280,
                              child: Text(
                                FFAppState().userlocation,
                                maxLines: 4,
                                overflow: TextOverflow.ellipsis,
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Roboto',
                                      color: Color(0xFF7D8180),
                                    ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    AuthUserStreamWidget(
                      builder: (context) => Container(
                        height: 41,
                        width: 41,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(40.0),
                            border: Border.all(color: Colors.grey)),
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(40.0),
                            child: currentUserPhoto != "" &&
                                    currentUserPhoto != null
                                ? CachedNetworkImageWidget(
                                    image: currentUserPhoto,
                                    height: 41,
                                    width: 41,
                                  )
                                : Icon(Icons.person)),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 44.0, 0.0, 0.0),
                  child: Container(
                    height: 50.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.0),
                      border: Border.all(
                        color: Colors.black,
                        width: 1.0,
                      ),
                    ),
                    child: Row(
                      // mainAxisSize: MainAxisSize.max,
                      // mainAxisAlignment: MainAxisAlignment.start,
                      // crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: TextFormField(
                            cursorColor: Colors.grey,
                            controller: textController,
                            onChanged: (_) => EasyDebounce.debounce(
                              '_model.textController',
                              Duration(milliseconds: 0),
                              () async {
                                setState(() {
                                  FFAppState().searchstring =
                                      textController.text;
                                });
                              },
                            ),
                            obscureText: false,
                            decoration: InputDecoration(
                              labelStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Roboto',
                                    color: Color(0xFF7D8180),
                                  ),
                              hintText: 'Search items nearby',
                              hintStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Roboto',
                                    color: Color(0xFF7D8180),
                                    fontSize: 12.0,
                                  ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              prefixIcon: Icon(
                                Icons.search_sharp,
                                color: Color(0xFF7D8180),
                                size: 24.0,
                              ),
                            ),
                            style: FlutterFlowTheme.of(context).bodyMedium,
                            validator:
                                textControllerValidator.asValidator(context),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 10.0, 0.0),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              setState(() {
                                FFAppState().searchstring = "";
                                textController?.clear();
                              });
                            },
                            child: Icon(
                              Icons.clear,
                              color: Color(0xFF7D8180),
                              size: 24.0,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 25.0, 0.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Near to you',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Roboto',
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            if (FFAppState().showListView == false)
                              InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  setState(() {
                                    FFAppState().showListView = true;
                                    FFAppState().showFullList = true;
                                    FFAppState().showgrid = false;
                                  });
                                },
                                child: Icon(
                                  Icons.format_list_bulleted_rounded,
                                  color: Colors.black,
                                  size: 24.0,
                                ),
                              ),
                            if (FFAppState().showListView == true)
                              InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  setState(() {
                                    FFAppState().showListView = false;
                                    FFAppState().showFullList = true;
                                    FFAppState().showgrid = true;
                                  });
                                },
                                child: SvgPicture.asset(
                                  'assets/images/Group.svg',
                                  width: 20.0,
                                  height: 20.0,
                                  fit: BoxFit.cover,
                                ),
                              ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                if (FFAppState().showListView == false)
                  Expanded(
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 20.0),
                      child: FutureBuilder<List<PostsRecord>>(
                        future: PostsRecord.search(
                          term: FFAppState().searchstring,
                          location: FFAppState().currentUserLocationValue,
                          searchRadiusMeters: 5000.0,
                        ),
                        builder: (context, snapshot) {
                          // Customize what your widget looks like when it's loading.
                          if (!snapshot.hasData) {
                            return Center(
                              child: SizedBox(
                                width: 50.0,
                                height: 50.0,
                                child: CircularProgressIndicator(
                                  color: FlutterFlowTheme.of(context).primary,
                                ),
                              ),
                            );
                          }
                          List<PostsRecord> gridViewPostsRecordList =
                              snapshot.data??[];
                          print(gridViewPostsRecordList.length.toString());
                          // Customize what your widget looks like with no search results.

                          if (snapshot.data!.isEmpty) {
                            return Container(
                              height: 100,
                              child: Center(
                                child: Text('No results.'),
                              ),
                            );
                          }
                          return RefreshIndicator(
                            onRefresh: () async {
                              setState(
                                  () => _model.algoliaSearchResults = null);
                              await PostsRecord.search(
                                term: textController.text,
                                location: FFAppState().currentUserLocationValue,
                                searchRadiusMeters: 5000.0,
                              )
                                  .then((r) => _model.algoliaSearchResults = r)
                                  .onError((_, __) =>
                                      _model.algoliaSearchResults = [])
                                  .whenComplete(() => setState(() {}));
                            },
                            child: GridView.builder(
                              padding: EdgeInsets.zero,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 10.0,
                                mainAxisSpacing: 10.0,
                                childAspectRatio: 0.84,
                              ),
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              itemCount: gridViewPostsRecordList.length,
                              itemBuilder: (context, gridViewIndex) {
                                final gridViewPostsRecord =
                                    gridViewPostsRecordList[gridViewIndex];
                                return Stack(
                                  children: [
                                    InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        FocusScope.of(context)
                                            .requestFocus(_unfocusNode);
                                        await Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                ProductDetailsWidget(
                                              productData: gridViewPostsRecord,
                                              productId:
                                                  gridViewPostsRecord.reference,
                                            ),
                                          ),
                                        );
                                      },
                                      child: Container(
                                        padding: EdgeInsets.only(bottom: 7),
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          boxShadow: [
                                            BoxShadow(
                                              blurRadius: 6.0,
                                              color: Color(0x340065FD),
                                              offset: Offset(2.0, 2.0),
                                            )
                                          ],
                                          borderRadius:
                                              BorderRadius.circular(12.0),
                                        ),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Expanded(
                                              child: ClipRRect(
                                                borderRadius: BorderRadius.only(
                                                  bottomLeft:
                                                      Radius.circular(0.0),
                                                  bottomRight:
                                                      Radius.circular(0.0),
                                                  topLeft:
                                                      Radius.circular(12.0),
                                                  topRight:
                                                      Radius.circular(12.0),
                                                ),
                                                child: CachedNetworkImageWidget(
                                                  image: gridViewPostsRecord
                                                      .images!
                                                      .toList()
                                                      .first,
                                                  width: double.infinity,
                                                  // height: 130.0,
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(9.0, 9.0, 0.0, 0.0),
                                              child: Text(
                                                gridViewPostsRecord.name!
                                                    .maybeHandleOverflow(
                                                  maxChars: 20,
                                                  replacement: '…',
                                                ),
                                                maxLines: 1,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Roboto',
                                                          fontSize: 12.0,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(9.0, 7.0, 0.0, 0.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  SvgPicture.asset(
                                                    'assets/images/Group_(3).svg',
                                                    width: 14.0,
                                                    height: 14.0,
                                                    fit: BoxFit.cover,
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(5.0, 0.0,
                                                                0.0, 0.0),
                                                    child: Text(
                                                      '${dateTimeFormat('jm', gridViewPostsRecord.createdAt)} ${dateTimeFormat('yMMMd', gridViewPostsRecord.createdAt)}',
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Roboto',
                                                                color: Color(
                                                                    0xFF7D8180),
                                                                fontSize: 8.0,
                                                              ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(9.0, 7.0, 0.0, 0.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  SvgPicture.asset(
                                                    'assets/images/Group_(4).svg',
                                                    width: 14.0,
                                                    height: 14.0,
                                                    fit: BoxFit.cover,
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(5.0, 0.0,
                                                                0.0, 0.0),
                                                    child: Text(
                                                      gridViewPostsRecord
                                                                  .conversations
                                                                  ?.length ==
                                                              null
                                                          ? '0 Conversations'
                                                          : '${gridViewPostsRecord.conversations?.length} ${"Conversations"}',
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Roboto',
                                                                color: Color(
                                                                    0xFF7D8180),
                                                                fontSize: 8.0,
                                                              ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    if (gridViewPostsRecord.postType == 'Free')
                                      Container(
                                        width: 42.0,
                                        height: 42.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(0.0),
                                            bottomRight: Radius.circular(35.0),
                                            topLeft: Radius.circular(12.0),
                                            topRight: Radius.circular(0.0),
                                          ),
                                        ),
                                        child: Align(
                                          alignment:
                                              AlignmentDirectional(-0.1, 0.0),
                                          child: Text(
                                            'FREE',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Roboto',
                                                  color: Colors.white,
                                                  fontSize: 8.0,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                          ),
                                        ),
                                      ),
                                    Positioned(
                                      right: 10,
                                      top: 10,
                                      child: InkWell(
                                        onTap: () async {
                                          if (FFAppState().savedPost.contains(
                                              gridViewPostsRecord.reference)) {
                                            FFAppState().removeFromSavedPost(
                                                gridViewPostsRecord.reference);
                                            await currentUserReference!.update({
                                              "saved_post":
                                                  FFAppState().savedPost
                                            });
                                            setState(() {});
                                          } else {
                                            FFAppState().addToSavedPost(
                                                gridViewPostsRecord.reference);
                                            await currentUserReference!.update({
                                              "saved_post":
                                                  FFAppState().savedPost
                                            });
                                            setState(() {});
                                          }
                                        },
                                        child: Container(
                                            padding: EdgeInsets.all(4),
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(6),
                                              boxShadow: [
                                                BoxShadow(
                                                    color: Color(0x190E2B)
                                                        .withOpacity(0.3),
                                                    offset: const Offset(3, 3),
                                                    blurRadius: 10),
                                                BoxShadow(
                                                    color: Color(0xECECFF),
                                                    offset: Offset(-3, -3),
                                                    blurRadius: 15),
                                              ],
                                            ),
                                            child: FFAppState()
                                                    .savedPost
                                                    .contains(
                                                        gridViewPostsRecord
                                                            .reference)
                                                ? Icon(
                                                    Icons.favorite,
                                                    color: Colors.red,
                                                  )
                                                : Icon(
                                                    Icons.favorite_border,
                                                    color: Colors.red,
                                                  )),
                                      ),
                                    ),
                                  ],
                                );
                              },
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                if (FFAppState().showListView == true)
                  Expanded(
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 22.0, 0.0, 0.0),
                      child: FutureBuilder<List<PostsRecord>>(
                        future: PostsRecord.search(
                          term: FFAppState().searchstring,
                          location: FFAppState().currentUserLocationValue,
                          searchRadiusMeters: 5000.0,
                        ),
                        builder: (context, snapshot) {
                          // Customize what your widget looks like when it's loading.
                          if (!snapshot.hasData) {
                            return Center(
                              child: SizedBox(
                                width: 50.0,
                                height: 50.0,
                                child: CircularProgressIndicator(
                                  color: FlutterFlowTheme.of(context).primary,
                                ),
                              ),
                            );
                          }
                          List<PostsRecord> listViewPostsRecordList =
                              snapshot.data!;
                          // Customize what your widget looks like with no search results.
                          if (snapshot.data!.isEmpty) {
                            return Container(
                              height: 100,
                              child: Center(
                                child: Text('No results.'),
                              ),
                            );
                          }
                          return ListView.builder(
                            padding: EdgeInsets.zero,
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemCount: listViewPostsRecordList.length,
                            itemBuilder: (context, listViewIndex) {
                              final listViewPostsRecord =
                                  listViewPostsRecordList[listViewIndex];
                              return Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 22.0),
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    FocusScope.of(context)
                                        .requestFocus(_unfocusNode);
                                    await Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            ProductDetailsWidget(
                                          productData: listViewPostsRecord,
                                          productId:
                                              listViewPostsRecord.reference,
                                        ),
                                      ),
                                    );
                                  },
                                  child: Stack(
                                    children: [
                                      Container(
                                        height: 100.0,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          boxShadow: [
                                            BoxShadow(
                                              blurRadius: 6.0,
                                              color: Color(0x340065FD),
                                              offset: Offset(2.0, 2.0),
                                            )
                                          ],
                                        ),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Stack(
                                              alignment: AlignmentDirectional(
                                                  -0.65, -0.75),
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(10.0, 10.0, 0.0,
                                                          10.0),
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12.0),
                                                    child:
                                                        CachedNetworkImageWidget(
                                                      image: listViewPostsRecord
                                                          .images!
                                                          .toList()
                                                          .first,
                                                      width: 80.0,
                                                      height: 80.0,
                                                    ),
                                                  ),
                                                ),
                                                if (listViewPostsRecord
                                                        .postType ==
                                                    'Free')
                                                  Container(
                                                    width: 32.0,
                                                    height: 30.0,
                                                    decoration: BoxDecoration(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                      borderRadius:
                                                          BorderRadius.only(
                                                        bottomLeft:
                                                            Radius.circular(
                                                                0.0),
                                                        bottomRight:
                                                            Radius.circular(
                                                                35.0),
                                                        topLeft:
                                                            Radius.circular(
                                                                12.0),
                                                        topRight:
                                                            Radius.circular(
                                                                0.0),
                                                      ),
                                                    ),
                                                    child: Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              -0.1, 0.0),
                                                      child: Text(
                                                        'FREE',
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyMedium
                                                            .override(
                                                              fontFamily:
                                                                  'Roboto',
                                                              color:
                                                                  Colors.white,
                                                              fontSize: 8.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                            ),
                                                      ),
                                                    ),
                                                  ),
                                              ],
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      20.0, 15.0, 0.0, 7.0),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 6.0),
                                                    child: Text(
                                                      listViewPostsRecord.name!
                                                          .maybeHandleOverflow(
                                                        maxChars: 25,
                                                        replacement: '…',
                                                      ),
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .labelMedium
                                                          .override(
                                                            fontFamily:
                                                                'Roboto',
                                                            color: Colors.black,
                                                            fontSize: 15.0,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                          ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 7.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .end,
                                                      children: [
                                                        SvgPicture.asset(
                                                          'assets/images/Group_(3).svg',
                                                          width: 14.0,
                                                          height: 14.0,
                                                          fit: BoxFit.cover,
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      3.0,
                                                                      3.0,
                                                                      30.0,
                                                                      0.0),
                                                          child: Text(
                                                            '12:00 PM 19 Apr, 23',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .labelSmall
                                                                .override(
                                                                  fontFamily:
                                                                      'Roboto',
                                                                  color: Color(
                                                                      0xFF7D8180),
                                                                  fontSize:
                                                                      10.0,
                                                                ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      SvgPicture.asset(
                                                        'assets/images/Group_(4).svg',
                                                        width: 14.0,
                                                        height: 14.0,
                                                        fit: BoxFit.cover,
                                                      ),
                                                      Text(
                                                        listViewPostsRecord
                                                                    .conversations
                                                                    ?.length ==
                                                                null
                                                            ? '0 Conversations'
                                                            : '${listViewPostsRecord.conversations?.length} ${"Conversations"}',
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyMedium
                                                            .override(
                                                              fontFamily:
                                                                  'Roboto',
                                                              color: Color(
                                                                  0xFF7D8180),
                                                              fontSize: 11.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                            ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Positioned(
                                        bottom: 10,
                                        right: 10,
                                        child: InkWell(
                                          onTap: () async {
                                            if (FFAppState().savedPost.contains(
                                                listViewPostsRecord
                                                    .reference)) {
                                              FFAppState().removeFromSavedPost(
                                                  listViewPostsRecord
                                                      .reference);
                                              await currentUserReference!
                                                  .update({
                                                "saved_post":
                                                    FFAppState().savedPost
                                              });
                                              setState(() {});
                                            } else {
                                              FFAppState().addToSavedPost(
                                                  listViewPostsRecord
                                                      .reference);
                                              await currentUserReference!
                                                  .update({
                                                "saved_post":
                                                    FFAppState().savedPost
                                              });
                                              setState(() {});
                                            }
                                          },
                                          child: FFAppState()
                                                  .savedPost
                                                  .contains(listViewPostsRecord
                                                      .reference)
                                              ? Icon(
                                                  Icons.favorite,
                                                  size: 30,
                                                  color: Colors.red,
                                                )
                                              : Icon(
                                                  Icons.favorite_border,
                                                  size: 30,
                                                  color: Colors.red,
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
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
