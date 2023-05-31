import 'package:n_y_d_app/pages/product_details/product_details_widget.dart';

import '../../components/cached_network_image.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/edit_profile/edit_profile_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'public_profile_model.dart';
export 'public_profile_model.dart';

class PublicProfileWidget extends StatefulWidget {
  const PublicProfileWidget({Key? key}) : super(key: key);

  @override
  _PublicProfileWidgetState createState() => _PublicProfileWidgetState();
}

class _PublicProfileWidgetState extends State<PublicProfileWidget> {
  late PublicProfileModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PublicProfileModel());
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
            child: StreamBuilder<UsersRecord>(
              stream: UsersRecord.getDocument(currentUserReference!),
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
                final columnUsersRecord = snapshot.data!;
                return Column(
                  mainAxisSize: MainAxisSize.max,
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
                              Icons.arrow_back_ios,
                              color: Colors.black,
                              size: 24.0,
                            ),
                          ),
                          Text(
                            'Profile',
                            style: FlutterFlowTheme.of(context).headlineSmall,
                          ),
                          InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              await Navigator.push(
                                context,
                                PageTransition(
                                  type: PageTransitionType.fade,
                                  duration: Duration(milliseconds: 0),
                                  reverseDuration: Duration(milliseconds: 0),
                                  child: EditProfileWidget(),
                                ),
                              );
                            },
                            child: Text(
                              'Edit',
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
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 30.0, 0.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          AuthUserStreamWidget(
                            builder: (context) => Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(22.0),
                                  border: Border.all(color: Colors.grey)),
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(22.0),
                                  child: CachedNetworkImageWidget(
                                    image: currentUserPhoto,
                                    height: 100,
                                    width: 100,
                                  )),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 15.0, 0.0, 0.0),
                      child: AuthUserStreamWidget(
                        builder: (context) => Text(
                          currentUserDisplayName,
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Roboto',
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 6.0, 0.0, 0.0),
                      child: Text(
                        'Joined ${valueOrDefault<String>(
                          dateTimeFormat(
                              'yMMMd', columnUsersRecord.createdTime),
                          'null',
                        )}',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Roboto',
                              color: Color(0xFF7D8180),
                              fontSize: 12.0,
                            ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 6.0, 0.0, 0.0),
                      child: Text(
                        FFAppState().setLocation,
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Roboto',
                              color: Color(0xFF7D8180),
                              fontSize: 12.0,
                            ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 35.0, 0.0, 0.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Divider(
                            thickness: 1.0,
                            color: Color(0xFFE6E6E6),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
                        child: StreamBuilder<List<PostsRecord>>(
                          stream: queryPostsRecord(
                            queryBuilder: (postsRecord) => postsRecord
                                .where('posted_by',
                                    isEqualTo: columnUsersRecord.uid)
                                .where('is_delete', isEqualTo: false)
                                .orderBy('created_at', descending: true),
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

                            if (snapshot.data!.isEmpty) {
                              return Center(
                                child: SizedBox(
                                  child: Text(
                                    "No Post Found",
                                    style: TextStyle(
                                        fontSize: 18, color: Colors.black),
                                  ),
                                ),
                              );
                            }

                            List<PostsRecord> gridViewPostsRecordList =
                                snapshot.data!;
                            return GridView.builder(
                              padding: EdgeInsets.zero,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3,
                                crossAxisSpacing: 10.0,
                                mainAxisSpacing: 10.0,
                                childAspectRatio: 1.0,
                              ),
                              scrollDirection: Axis.vertical,
                              itemCount: gridViewPostsRecordList.length,
                              itemBuilder: (context, gridViewIndex) {
                                final gridViewPostsRecord =
                                    gridViewPostsRecordList[gridViewIndex];
                                return InkWell(
                                  onTap: () async {
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
                                  child: ClipRRect(
                                      borderRadius: BorderRadius.circular(12.0),
                                      child: CachedNetworkImageWidget(
                                        image: gridViewPostsRecord.images!
                                            .toList()
                                            .first,
                                        width: 105.0,
                                        height: 105.0,
                                      )),
                                );
                              },
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
