import 'package:n_y_d_app/main.dart';
import 'package:n_y_d_app/pages/product_details/product_details_widget.dart';
import '../../components/cached_network_image.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/chat_list_item_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'chat_details_model.dart';
export 'chat_details_model.dart';

class ChatDetailsWidget extends StatefulWidget {
  const ChatDetailsWidget({
    Key? key,
    this.postData,
    this.username,
    this.productname,
    this.profileimage,
    this.productimage,
    this.productlocation,
    this.userRef,
    this.conversationsDoc,
  }) : super(key: key);

  final String? username;
  final String? productname;
  final String? profileimage;
  final String? productimage;
  final String? productlocation;
  final PostsRecord? postData;
  final DocumentReference? userRef;
  final ConversationsRecord? conversationsDoc;

  @override
  _ChatDetailsWidgetState createState() => _ChatDetailsWidgetState();
}

class _ChatDetailsWidgetState extends State<ChatDetailsWidget> {
  late ChatDetailsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  TextEditingController textController = TextEditingController();
  String? Function(BuildContext, String?)? textControllerValidator;
  ScrollController _scrollController = ScrollController();
  //final _scrollController = ScrollController(initialScrollOffset: 2000);
  final _unfocusNode = FocusNode();
  @override
  void initState() {
    super.initState();

    // _scrollController.animateTo(_scrollController.position.maxScrollExtent,
    //     duration: Duration(microseconds: 300), curve: Curves.easeOut);

    // print(_scrollController.hasClients);
    // if (_scrollController.hasClients){
    //   _scrollController.animateTo(
    //     _scrollController.position.maxScrollExtent,
    //     duration: Duration(seconds: 1),
    //     curve: Curves.easeOut,
    //   );
    // }

    if (!_scrollController.hasClients) {
      print(!_scrollController.hasClients);
      Future.delayed(Duration(milliseconds: 50), () {
        _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
      });
    }

    // WidgetsBinding.instance.addPostFrameCallback((_) {
    //   print("dtaaa11111");
    //   _scrollController.animateTo(
    //     _scrollController.position.maxScrollExtent,
    //     duration: const Duration(milliseconds: 300),
    //     curve: Curves.easeOut,
    //   );
    //   print("dtaaa22222");
    // });

    // WidgetsBinding.instance.addPostFrameCallback((_) {
    //   print("object");
    //   _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
    //   print("object");
    // });

    _model = createModel(context, () => ChatDetailsModel());

    textController = TextEditingController();
  }

  @override
  void dispose() {
    _model.dispose();
    _unfocusNode.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(
                          22.0, 30.0, 22.0, 18.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
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
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                50.0, 0.0, 0.0, 0.0),
                            child: Text(
                              'Message',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Roboto',
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                      ),
                      child: wrapWithModel(
                        model: _model.chatListItemModel,
                        updateCallback: () => setState(() {}),
                        child: InkWell(
                          onTap: ()async {
                            await Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    ProductDetailsWidget(
                                      productData:
                                      widget.postData,
                                      productId: widget.postData
                                          ?.reference,
                                    ),
                              ),
                            );
                          },
                          child: ChatListItemWidget(
                            profileImageChat: FutureBuilder<DocumentSnapshot>(
                              future: widget.conversationsDoc!.userDetails!
                                          .toList()
                                          .first
                                          .userId ==
                                      currentUserUid
                                  ? widget.conversationsDoc!.postedByRefrence!
                                      .get()
                                  : widget.conversationsDoc!.createUserRefrence!
                                      .get(),
                              builder: (context, snapshot) {
                                return snapshot.hasData
                                    ? snapshot.data!["photo_url"] == ""
                                        ? Icon(Icons.person)
                                        : CachedNetworkImageWidget(
                                            image: snapshot.data!["photo_url"])
                                    : Icon(Icons.person);
                              },
                            ),
                            nameText: widget.conversationsDoc!.userDetails!
                                        .toList()
                                        .first
                                        .userId ==
                                    currentUserUid
                                ? widget.conversationsDoc!.userDetails!
                                        .toList()
                                        .last
                                        .userName ??
                                    ""
                                : widget.conversationsDoc!.userDetails!
                                        .toList()
                                        .first
                                        .userName ??
                                    "",
                            discriptionText: widget.productname,
                            dateText: widget.productlocation,
                            productImage: widget.productimage,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            22.0, 10.0, 22.0, 10.0),
                        child: StreamBuilder<List<ChatsRecord>>(
                          stream: queryChatsRecord(
                            parent: widget.conversationsDoc!.reference,
                            queryBuilder: (chatsRecord) =>
                                chatsRecord.orderBy('created_at'),
                          ),
                          builder: (context, snapshot) {
                            // Customize what your widget looks like when it's loading.
                            // if (!snapshot.hasData) {
                            //   return Center(
                            //     child: SizedBox(
                            //       width: 50.0,
                            //       height: 50.0,
                            //       child: CircularProgressIndicator(
                            //         color: FlutterFlowTheme.of(context).primary,
                            //       ),
                            //     ),
                            //   );
                            // }
                            List<ChatsRecord> listViewChatsRecordList =
                                snapshot.data ?? [];
                            return ListView.builder(
                              padding: EdgeInsets.zero,
                              shrinkWrap: true,
                              physics: const AlwaysScrollableScrollPhysics(),
                              controller: _scrollController,
                              scrollDirection: Axis.vertical,
                              itemCount: listViewChatsRecordList.length,
                              itemBuilder: (context, listViewIndex) {
                                final listViewChatsRecord =
                                    listViewChatsRecordList[listViewIndex];
                                // log((listViewChatsRecord.createdBy !=
                                //         currentUserUid)
                                //     .toString());
                                // log(listViewChatsRecord.createdBy ?? "",
                                //     name: "User id");
                                return Visibility(
                                    visible: listViewChatsRecord.createdBy !=
                                        currentUserUid,
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 5.0, 0.0, 5.0),
                                          child: Text(
                                            //7:00 PM Apr 20
                                            '${dateTimeFormat('jm', DateTime.tryParse(listViewChatsRecord.createdAt!))} ${dateTimeFormat('MMMd', DateTime.tryParse(listViewChatsRecord.createdAt!))}',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Roboto',
                                                  color: Color(0xFF757575),
                                                  fontSize: 12.0,
                                                  fontWeight: FontWeight.normal,
                                                ),
                                          ),
                                        ),
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Container(
                                              constraints: BoxConstraints(
                                                maxWidth: 260.0,
                                              ),
                                              decoration: BoxDecoration(
                                                color: Color(0xFFE6E6E6),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        8.0, 8.0, 8.0, 8.0),
                                                child: Text(
                                                  listViewChatsRecord.message ??
                                                      "",
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Roboto',
                                                        fontSize: 15.0,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                      ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    replacement: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 5.0, 0.0, 5.0),
                                          child: Text(
                                            '${dateTimeFormat('jm', DateTime.tryParse(listViewChatsRecord.createdAt!))} ${dateTimeFormat('MMMd', DateTime.tryParse(listViewChatsRecord.createdAt!))}',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Roboto',
                                                  color: Color(0xFF757575),
                                                  fontSize: 12.0,
                                                  fontWeight: FontWeight.normal,
                                                ),
                                          ),
                                        ),
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      50.0, 0.0, 0.0, 0.0),
                                              child: Container(
                                                constraints: BoxConstraints(
                                                  maxWidth: 260.0,
                                                ),
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          8.0, 8.0, 8.0, 8.0),
                                                  child: Text(
                                                    listViewChatsRecord
                                                            .message ??
                                                        "",
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Roboto',
                                                          color: Colors.white,
                                                          fontSize: 15.0,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                        ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ));
                              },
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: currentUserUid == widget.postData!.postedBy
                    ? EdgeInsetsDirectional.fromSTEB(22.0, 0.0, 0.0, 20.0)
                    : EdgeInsetsDirectional.fromSTEB(11.0, 0.0, 0.0, 20.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Row(
                      children: [
                        Visibility(
                          visible: currentUserUid == widget.postData!.postedBy,
                          child: InkWell(
                            onTap: () async {
                              var confirmDialogResponse =
                                  await showDialog<bool>(
                                        context: context,
                                        builder: (alertDialogContext) {
                                          return AlertDialog(
                                            content: Text(
                                              'Are you sure the ' +
                                                  widget.conversationsDoc!
                                                      .userDetails!
                                                      .toList()
                                                      .first
                                                      .userName! +
                                                  ' has picked up your item?',
                                              style: TextStyle(
                                                color: Colors.black,
                                              ),
                                            ),
                                            actions: [
                                              TextButton(
                                                onPressed: () => Navigator.pop(
                                                    alertDialogContext, false),
                                                child: Text(
                                                  'Cancel',
                                                  style: TextStyle(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primary,
                                                  ),
                                                ),
                                              ),
                                              TextButton(
                                                onPressed: () => Navigator.pop(
                                                    alertDialogContext, true),
                                                child: Text(
                                                  'Confirm',
                                                  style: TextStyle(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primary,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          );
                                        },
                                      ) ??
                                      false;
                              if (confirmDialogResponse) {
                                if (loggedIn) {
                                  if (widget.postData?.public == true) {
                                    final postsUpdateData =
                                        createPostsRecordData(
                                      pickup: createPickupStruct(
                                        userId: widget.conversationsDoc
                                            ?.userDetails?.first.userId,
                                        userName: widget.conversationsDoc
                                            ?.userDetails?.first.userName,
                                        userImage: widget.conversationsDoc
                                            ?.userDetails?.first.userImage,
                                        pickupTime: getCurrentTimestamp,
                                        clearUnsetFields: false,
                                      ),
                                      isPickedUp: true,
                                      public: false,
                                    );
                                    await widget.postData!.reference
                                        .update(postsUpdateData);
                                    await Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => NavBarPage(
                                            initialPage: 'sellingPage'),
                                      ),
                                    );
                                  } else {
                                    ScaffoldMessenger.of(context)
                                        .clearSnackBars();
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          'Product is not in List',
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
                                } else {
                                  Navigator.pop(context);
                                }
                              } else {
                                return;
                              }
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(top: 15.0),
                              child: Column(
                                children: [
                                  Container(
                                    width: 43.0,
                                    height: 43.0,
                                    decoration: BoxDecoration(
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      shape: BoxShape.circle,
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          10.0, 10.0, 10.0, 10.0),
                                      child: SvgPicture.asset(
                                        'assets/images/Group_17.svg',
                                        width: 24.0,
                                        height: 24.0,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    "PickUp",
                                    style: TextStyle(
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                11.0, 0.0, 22.0, 0.0),
                            child: Container(
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                borderRadius: BorderRadius.circular(22.0),
                                border: Border.all(
                                  color: Color(0xFF7D8180),
                                ),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Expanded(
                                    child: TextFormField(
                                      cursorColor: Colors.grey,
                                      controller: textController,
                                      textCapitalization:
                                          TextCapitalization.words,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        hintText: 'Message...',
                                        hintStyle: FlutterFlowTheme.of(context)
                                            .bodySmall
                                            .override(
                                              fontFamily: 'Roboto',
                                              color: Color(0xFFACACAC),
                                              fontWeight: FontWeight.normal,
                                            ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0x00000000),
                                            width: 1.0,
                                          ),
                                          borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(4.0),
                                            topRight: Radius.circular(4.0),
                                          ),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0x00000000),
                                            width: 1.0,
                                          ),
                                          borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(4.0),
                                            topRight: Radius.circular(4.0),
                                          ),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0x00000000),
                                            width: 1.0,
                                          ),
                                          borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(4.0),
                                            topRight: Radius.circular(4.0),
                                          ),
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0x00000000),
                                            width: 1.0,
                                          ),
                                          borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(4.0),
                                            topRight: Radius.circular(4.0),
                                          ),
                                        ),
                                        contentPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                15.0, 15.0, 15.0, 15.0),
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium,
                                      maxLines: 5,
                                      minLines: 1,
                                      keyboardType: TextInputType.multiline,
                                      validator: textControllerValidator
                                          .asValidator(context),
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
                                        if (textController.text != '') {
                                          //print(currentUserUid);
                                          final chatsCreateData =
                                              createChatsRecordData(
                                            createdBy: currentUserUid,
                                            createdAt:
                                                getCurrentTimestamp.toString(),
                                            message: textController.text,
                                          );
                                          await widget.conversationsDoc!.ffRef!
                                              .update({
                                            "last_message_at": DateTime.now()
                                                .millisecondsSinceEpoch,
                                            "last_message_by": currentUserUid,
                                            "last_message": textController.text
                                          });
                                          await ChatsRecord.createDoc(widget
                                                  .conversationsDoc!.reference)
                                              .set(chatsCreateData);
                                          _scrollController.animateTo(
                                              _scrollController
                                                  .position.maxScrollExtent,
                                              duration: Duration(seconds: 1),
                                              curve: Curves.easeOut);
                                          setState(() {
                                            textController.clear();
                                          });
                                        } else {
                                          ScaffoldMessenger.of(context)
                                              .clearSnackBars();
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              content: Text(
                                                'Please Type Something...',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                ),
                                              ),
                                              duration:
                                                  Duration(milliseconds: 4000),
                                              backgroundColor:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                            ),
                                          );
                                        }
                                      },
                                      child: Icon(
                                        Icons.send_rounded,
                                        color: Color(0xFF7D8180),
                                        size: 28.0,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
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
      ),
    );
  }
}
