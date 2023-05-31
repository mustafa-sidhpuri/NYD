import 'package:n_y_d_app/pages/product_details/product_details_widget.dart';

import '../../components/cached_network_image.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/chat_details/chat_details_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'chat_main_model.dart';
export 'chat_main_model.dart';

class ChatMainWidget extends StatefulWidget {
  const ChatMainWidget({Key? key}) : super(key: key);

  @override
  _ChatMainWidgetState createState() => _ChatMainWidgetState();
}

class _ChatMainWidgetState extends State<ChatMainWidget> {
  //late ChatMainModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    //_model = createModel(context, () => ChatMainModel());
  }

  @override
  void dispose() {
    // _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Align(
              alignment: AlignmentDirectional(0.0, 0.0),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(22.0, 30.0, 0.0, 27.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      'Inbox',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Roboto',
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: DefaultTabController(
                length: 2,
                initialIndex: 0,
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment(0.0, 0),
                      child: TabBar(
                        labelColor: FlutterFlowTheme.of(context).primary,
                        unselectedLabelColor:
                            FlutterFlowTheme.of(context).primaryText,
                        labelStyle: FlutterFlowTheme.of(context).bodyMedium,
                        indicatorColor: Color(0xFF0065FD),
                        tabs: [
                          Tab(
                            text: 'Messages',
                          ),
                          Tab(
                            text: 'Notifications',
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: TabBarView(
                        children: [
                          StreamBuilder<List<ConversationsRecord>>(
                            stream: queryConversationsRecord(
                              queryBuilder: (conversationsRecord) =>
                                  conversationsRecord
                                      .where('users',
                                          arrayContains: currentUserUid)
                                      .orderBy('last_message_at',
                                          descending: true),
                            ),
                            builder: (context, snapshot) {
                              // Customize what your widget looks like when it's loading.
                              if (!snapshot.hasData) {
                                return Center(
                                  child: SizedBox(
                                    width: 50.0,
                                    height: 50.0,
                                    child: CircularProgressIndicator(
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                    ),
                                  ),
                                );
                              }
                              if (snapshot.data!.isEmpty) {
                                return Center(
                                  child: SizedBox(
                                    child: Text(
                                      "No Data Found",
                                      style: TextStyle(
                                          fontSize: 18, color: Colors.black),
                                    ),
                                  ),
                                );
                              }
                              List<ConversationsRecord>
                                  listViewConversationsRecordList =
                                  snapshot.data!;
                              return ListView.builder(
                                padding: EdgeInsets.zero,
                                scrollDirection: Axis.vertical,
                                itemCount:
                                    listViewConversationsRecordList.length,
                                itemBuilder: (context, listViewIndex) {
                                  //print(listViewConversationsRecordList.length);
                                  final listViewConversationsRecord =
                                      listViewConversationsRecordList[
                                          listViewIndex];
                                  return InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      // fetchign product from firebase
                                      final product = await FirebaseFirestore
                                          .instance
                                          .collection("Posts")
                                          .doc(listViewConversationsRecord
                                              .productId)
                                          .get();

                                      final productRec =
                                          PostsRecord.getDocumentFromData(
                                              product.data()
                                                  as Map<String, dynamic>,
                                              product.reference);
                                      await Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              ChatDetailsWidget(
                                            postData: productRec,
                                            username: valueOrDefault<String>(
                                              listViewConversationsRecord
                                                  .userDetails!
                                                  .toList()
                                                  .last
                                                  .userName,
                                              'null',
                                            ),
                                            productname:
                                                listViewConversationsRecord
                                                    .productName,
                                            profileimage:
                                                listViewConversationsRecord
                                                    .userDetails!
                                                    .toList()
                                                    .first
                                                    .userImage,
                                            productimage:
                                                listViewConversationsRecord
                                                    .productImage,
                                            productlocation:
                                                listViewConversationsRecord
                                                    .postedByLocation,
                                            userRef: listViewConversationsRecord
                                                .postedByRefrence,
                                            conversationsDoc:
                                                listViewConversationsRecord,
                                          ),
                                        ),
                                      );
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                      ),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            22.0, 0.0, 22.0, 0.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 20.0, 0.0, 0.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  if (listViewConversationsRecord
                                                          .userDetails!
                                                          .toList()
                                                          .first
                                                          .userId ==
                                                      currentUserUid)
                                                    Container(
                                                      width: 53.0,
                                                      height: 53.0,
                                                      clipBehavior:
                                                          Clip.antiAlias,
                                                      decoration: BoxDecoration(
                                                        border: Border.all(
                                                            color: Colors.black
                                                                .withOpacity(
                                                                    0.5)),
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                        shape: BoxShape.circle,
                                                      ),
                                                      child: FutureBuilder<
                                                          DocumentSnapshot>(
                                                        future:
                                                            listViewConversationsRecord
                                                                .postedByRefrence!
                                                                .get(),
                                                        builder: (context,
                                                            snapshot) {
                                                          return snapshot
                                                                  .hasData
                                                              ? snapshot.data![
                                                                          "photo_url"] ==
                                                                      ""
                                                                  ? Icon(Icons
                                                                      .person)
                                                                  : CachedNetworkImageWidget(
                                                                      image: snapshot
                                                                              .data![
                                                                          "photo_url"])
                                                              : Icon(
                                                                  Icons.person);
                                                        },
                                                      ),
                                                    ),
                                                  if (listViewConversationsRecord
                                                          .userDetails!
                                                          .toList()
                                                          .first
                                                          .userId !=
                                                      currentUserUid)
                                                    Container(
                                                      width: 53.0,
                                                      height: 53.0,
                                                      clipBehavior:
                                                          Clip.antiAlias,
                                                      decoration: BoxDecoration(
                                                        border: Border.all(
                                                            color: Colors.black
                                                                .withOpacity(
                                                                    0.5)),
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                        shape: BoxShape.circle,
                                                      ),
                                                      child: FutureBuilder<
                                                          DocumentSnapshot>(
                                                        future: listViewConversationsRecord
                                                            .createUserRefrence!
                                                            .get(),
                                                        builder: (context,
                                                            snapshot) {
                                                          return snapshot
                                                                  .hasData
                                                              ? snapshot.data![
                                                                          "photo_url"] ==
                                                                      ""
                                                                  ? Icon(Icons
                                                                      .person)
                                                                  : CachedNetworkImageWidget(
                                                                      image: snapshot
                                                                              .data![
                                                                          "photo_url"])
                                                              : Icon(
                                                                  Icons.person);
                                                        },
                                                      ),
                                                    ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                6.0, 0.0),
                                                    child: Container(
                                                      width: 200.0,
                                                      decoration: BoxDecoration(
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                        shape:
                                                            BoxShape.rectangle,
                                                      ),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    6.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            if (listViewConversationsRecord
                                                                    .userDetails!
                                                                    .toList()
                                                                    .first
                                                                    .userId ==
                                                                currentUserUid)
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            4.0),
                                                                child: Text(
                                                                  valueOrDefault<
                                                                      String>(
                                                                    listViewConversationsRecord
                                                                        .userDetails!
                                                                        .toList()
                                                                        .last
                                                                        .userName,
                                                                    'null',
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Roboto',
                                                                        fontSize:
                                                                            16.0,
                                                                        fontWeight:
                                                                            FontWeight.bold,
                                                                      ),
                                                                ),
                                                              ),
                                                            if (listViewConversationsRecord
                                                                    .userDetails!
                                                                    .toList()
                                                                    .first
                                                                    .userId !=
                                                                currentUserUid)
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            4.0),
                                                                child: Text(
                                                                  valueOrDefault<
                                                                      String>(
                                                                    listViewConversationsRecord
                                                                        .userDetails!
                                                                        .toList()
                                                                        .first
                                                                        .userName,
                                                                    'null',
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Roboto',
                                                                        fontSize:
                                                                            16.0,
                                                                        fontWeight:
                                                                            FontWeight.bold,
                                                                      ),
                                                                ),
                                                              ),
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          2.0),
                                                              child: Text(
                                                                "${currentUserUid == listViewConversationsRecord.lastMessageBy ? "You: " : ""}${listViewConversationsRecord.lastMessage ?? ""}",
                                                                maxLines: 2,
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Roboto',
                                                                      fontSize:
                                                                          12.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .normal,
                                                                    ),
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          4.0),
                                                              child: Text(
                                                                listViewConversationsRecord.lastMessageAt ==
                                                                            null ||
                                                                        listViewConversationsRecord.lastMessageAt ==
                                                                            0
                                                                    ? ""
                                                                    : '${dateTimeFormat('jm', DateTime.fromMillisecondsSinceEpoch(listViewConversationsRecord.lastMessageAt!))} ${dateTimeFormat('yMMMd', DateTime.fromMillisecondsSinceEpoch(listViewConversationsRecord.lastMessageAt!))}',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Roboto',
                                                                      color: Color(
                                                                          0xFF7D8180),
                                                                      fontSize:
                                                                          12.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .normal,
                                                                    ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              6.0),
                                                      child:
                                                          CachedNetworkImageWidget(
                                                        image:
                                                            listViewConversationsRecord
                                                                .productImage!,
                                                        width: 61.0,
                                                        height: 45.0,
                                                      )),
                                                ],
                                              ),
                                            ),
                                            Divider(
                                              thickness: 1.0,
                                              color: Color(0xFFE6E6E6),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              );
                            },
                          ),
                          StreamBuilder<List<NotificationsRecord>>(
                            stream: queryNotificationsRecord(
                              queryBuilder: (notificationsRecord) =>
                                  notificationsRecord
                                      .where('users_id',
                                          arrayContains: currentUserUid)
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
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                    ),
                                  ),
                                );
                              }

                              if (snapshot.data!.isEmpty) {
                                return Center(
                                  child: SizedBox(
                                    child: Text(
                                      "No Data Found",
                                      style: TextStyle(
                                          fontSize: 18, color: Colors.black),
                                    ),
                                  ),
                                );
                              }
                              List<NotificationsRecord>
                                  listViewNotificationsRecordList =
                                  snapshot.data!;

                              return ListView.builder(
                                padding: EdgeInsets.zero,
                                scrollDirection: Axis.vertical,
                                itemCount:
                                    listViewNotificationsRecordList.length,
                                itemBuilder: (context, listViewIndex) {
                                  final listViewNotificationsRecord =
                                      listViewNotificationsRecordList[
                                          listViewIndex];
                                  bool read = false;
                                  listViewNotificationsRecord.users!
                                      .forEach((user) {
                                    if (user.userId == currentUserUid) {
                                      read = user.read ?? false;
                                    }
                                  });
                                  return InkWell(
                                    onTap: () async {
                                      final postData =
                                          await PostsRecord.getDocumentOnce(
                                              listViewNotificationsRecord
                                                  .postData!);
                                      // already read then redirect only action to perform

                                      if(postData.isDelete == true){
                                        ScaffoldMessenger.of(context).showSnackBar(
                                          SnackBar(
                                            content: Text(
                                              'Product is delete.',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 14,
                                              ),
                                            ),
                                            duration: Duration(milliseconds: 4000),
                                            backgroundColor:
                                            FlutterFlowTheme.of(context)
                                                .primary,
                                          ),
                                        );
                                      }
                                      if (read) {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                ProductDetailsWidget(
                                              productData: postData,
                                              productId:
                                                  listViewNotificationsRecord
                                                      .postData,
                                            ),
                                          ),
                                        );
                                      } else {
                                        List<Map<String, dynamic>> usersData =
                                            listViewNotificationsRecord.users!
                                                .map((p0) => {
                                                      "read": p0.read,
                                                      "user_id": p0.userId,
                                                      "user_profile":
                                                          p0.userProfile
                                                    })
                                                .toList();

                                        usersData.forEach((u) {
                                          if (currentUserUid == u["user_id"]) {
                                            u["read"] = true;
                                          }
                                        });
                                        await listViewNotificationsRecord
                                            .reference
                                            .update({"users": usersData});
                                        await Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                ProductDetailsWidget(
                                              productData: postData,
                                              productId:
                                                  listViewNotificationsRecord
                                                      .postData,
                                            ),
                                          ),
                                        );
                                      }
                                    },
                                    child: Container(
                                      height: 77.0,
                                      decoration: BoxDecoration(
                                        color: read
                                            ? Colors.white
                                            : Color(0xFFC9DDFF),
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.symmetric(horizontal: 20.0),
                                            child: Container(
                                              width: 42.0,
                                              height: 42.0,
                                              clipBehavior: Clip.antiAlias,
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: Colors.black
                                                        .withOpacity(0.5)),
                                                color: FlutterFlowTheme.of(
                                                        context)
                                                    .secondaryBackground,
                                                shape: BoxShape.circle,
                                              ),
                                              child:
                                                  listViewNotificationsRecord
                                                              .userRef !=
                                                          null
                                                      ? FutureBuilder<
                                                          DocumentSnapshot>(
                                                          future:
                                                              listViewNotificationsRecord
                                                                  .userRef!
                                                                  .get(),
                                                          builder: (context,
                                                              snapshot) {
                                                            return snapshot
                                                                    .hasData
                                                                ? snapshot.data![
                                                                            "photo_url"] !=
                                                                        ""
                                                                    ? CachedNetworkImageWidget(
                                                                        image: snapshot.data![
                                                                            "photo_url"])
                                                                    : Icon(Icons
                                                                        .person)
                                                                : Icon(Icons
                                                                    .person);
                                                          },
                                                        )
                                                      : Icon(Icons.person),
                                            ),
                                          ),
                                          Expanded(
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  listViewNotificationsRecord
                                                      .message!,
                                                  maxLines: 2,
                                                  overflow: TextOverflow.ellipsis,
                                                  style:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Roboto',
                                                            fontSize: 12.0,
                                                          ),
                                                ),
                                                Padding(
                                                  padding:
                                                      EdgeInsetsDirectional
                                                          .fromSTEB(0.0, 5.0,
                                                              0.0, 0.0),
                                                  child: Text(
                                                    dateTimeFormat(
                                                        'relative',
                                                        listViewNotificationsRecord
                                                            .createdAt!),
                                                    style:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .override(
                                                              fontFamily:
                                                                  'Roboto',
                                                              color: Color(
                                                                  0xFF7D8180),
                                                              fontSize: 10.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .normal,
                                                            ),
                                                  ),
                                                ),
                                              ],
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
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
