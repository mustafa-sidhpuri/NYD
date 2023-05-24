import 'package:n_y_d_app/main.dart';

import '../../components/cached_network_image.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'pick_up_product_model.dart';
export 'pick_up_product_model.dart';

class PickUpProductWidget extends StatefulWidget {
  const PickUpProductWidget({
    Key? key,
    required this.pickupProductDoc,
  }) : super(key: key);

  final PostsRecord? pickupProductDoc;

  @override
  _PickUpProductWidgetState createState() => _PickUpProductWidgetState();
}

class _PickUpProductWidgetState extends State<PickUpProductWidget> {
  late PickUpProductModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PickUpProductModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      setState(() {
        FFAppState().showPickProductList = false;
        FFAppState().showUser = false;
      });
    });
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
                            Icons.arrow_back_ios_rounded,
                            color: Colors.black,
                            size: 22.0,
                          ),
                        ),
                        Text(
                          'Pick up',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Roboto',
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                        Text(
                          '.',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Roboto',
                                    color: Colors.white,
                                  ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 40.0, 0.0, 20.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10.0),
                          child: CachedNetworkImageWidget(
                            image: widget.pickupProductDoc!.images!.toList()[0],
                            width: 75.0,
                            height: 65.0,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              20.0, 0.0, 0.0, 0.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.pickupProductDoc!.name!,
                                style: FlutterFlowTheme.of(context).bodyMedium,
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 12.0, 0.0, 0.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    SvgPicture.asset(
                                      'assets/images/Group_(3).svg',
                                      width: 12.0,
                                      height: 12.0,
                                      fit: BoxFit.cover,
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          6.0, 0.0, 0.0, 0.0),
                                      child: Text(
                                        '${valueOrDefault<String>(
                                          dateTimeFormat(
                                              'jm',
                                              widget
                                                  .pickupProductDoc!.createdAt),
                                          '',
                                        )}${valueOrDefault<String>(
                                          dateTimeFormat(
                                              'yMMMd',
                                              widget
                                                  .pickupProductDoc!.createdAt),
                                          '',
                                        )}',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Roboto',
                                              color: Color(0xFF7D8180),
                                              fontSize: 12.0,
                                            ),
                                      ),
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
                  Divider(
                    height: 0.0,
                    thickness: 1.0,
                    color: Color(0xFFE6E6E6),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                    child:
                        (widget.pickupProductDoc!.conversationUsersId?.length ??
                                    0) >
                                0
                            ? Text(
                                '  select who pickup the item',
                                style: FlutterFlowTheme.of(context).bodyMedium,
                              )
                            : SizedBox(),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  (widget.pickupProductDoc!.conversationUsersId?.length ?? 0) >
                          0
                      ? FutureBuilder(
                          future: FirebaseFirestore.instance
                              .collection("users")
                              .where("uid",
                                  whereIn: widget
                                      .pickupProductDoc?.conversationUsersId
                                      ?.toList())
                              .get(),
                          builder:
                              (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                            if (!snapshot.hasData) {
                              return SizedBox();
                            }
                            return FlutterFlowDropDown<String>(
                              controller: _model.dropDownValueController ??=
                                  FormFieldController<String>(
                                _model.dropDownValue ??= widget
                                    .pickupProductDoc!
                                    .conversationUsersId
                                    ?.length
                                    .toString(),
                              ),
                              options: snapshot.data?.docs
                                      .map((e) => (e.data() as Map<String,
                                              dynamic>)["display_name"]
                                          .toString())
                                      .toList() ??
                                  [],
                              onChanged: (val) {
                                setState(() {
                                  _model.dropDownValue = val;
                                 _model.dropDownId = snapshot.data?.docs.firstWhere(
                                         (element) =>
                                     (element.data() as Map<String,
                                         dynamic>)["display_name"] ==
                                         val)["uid"];
                                 _model.dropDownProfile = snapshot.data?.docs.firstWhere(
                                         (element) =>
                                     (element.data() as Map<String,
                                         dynamic>)["display_name"] ==
                                         val)["photo_url"];
                                 print(val);
                                  print(snapshot.data?.docs.firstWhere(
                                          (element) =>
                                      (element.data() as Map<String,
                                          dynamic>)["display_name"] ==
                                          val)["uid"]);
                                });
                              },
                              width: 300.0,
                              height: 50.0,
                              searchHintTextStyle:
                                  FlutterFlowTheme.of(context).labelMedium,
                              textStyle:
                                  FlutterFlowTheme.of(context).bodyMedium,
                              hintText: 'Please select user',
                              searchHintText: 'Search for an item...',
                              icon: Icon(
                                Icons.keyboard_arrow_down_rounded,
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                size: 24.0,
                              ),
                              fillColor: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              elevation: 2.0,
                              borderColor:
                                  FlutterFlowTheme.of(context).alternate,
                              borderWidth: 2.0,
                              borderRadius: 8.0,
                              margin: EdgeInsetsDirectional.fromSTEB(
                                  16.0, 4.0, 16.0, 4.0),
                              hidesUnderline: true,
                              isSearchable: false,
                            );
                          })
                      : Text(
                          "No Conversation found with this product",
                          style: TextStyle(fontSize: 16, color: Colors.black),
                        ),
                  (widget.pickupProductDoc!.conversationUsersId?.length ?? 0) >
                          0
                      ? Center(
                          child: Padding(
                            padding: const EdgeInsets.only(top: 20.0),
                            child: GestureDetector(
                              onTap: () async {
                                if (widget.pickupProductDoc!.public == true) {
                                  final postsUpdateData = createPostsRecordData(
                                    pickup: createPickupStruct(
                                      userId: _model.dropDownId??"",
                                      userName: _model.dropDownValue??"",
                                      userImage: _model.dropDownProfile??"",
                                      pickupTime: getCurrentTimestamp,
                                      clearUnsetFields: false,
                                    ),
                                    isPickedUp: true,
                                    public: false,
                                  );
                                  await widget.pickupProductDoc!.reference
                                      .update(postsUpdateData);
                                  await Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => NavBarPage(
                                          initialPage: 'sellingPage'),
                                    ),
                                  );
                                }
                                else {
                                  ScaffoldMessenger.of(context)
                                      .clearSnackBars();
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        'Product is not in List',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 14.0,
                                        ),
                                      ),
                                      duration: Duration(milliseconds: 4000),
                                      backgroundColor:
                                          FlutterFlowTheme.of(context).primary,
                                    ),
                                  );
                                }
                              },
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    vertical: 12, horizontal: 30),
                                height: 43.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context).primary,
                                  borderRadius: BorderRadius.circular(22.0),
                                ),
                                child: Text(
                                  'Confirm',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Roboto',
                                        color: Colors.white,
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.w600,
                                      ),
                                ),
                              ),
                            ),
                          ),
                        )
                      : SizedBox()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
