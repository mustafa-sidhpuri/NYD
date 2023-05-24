import '../../components/cached_network_image.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/chat_details/chat_details_widget.dart';
import '/pages/pick_up_product/pick_up_product_widget.dart';
import '/pages/product_edit/product_edit_widget.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:smooth_page_indicator/smooth_page_indicator.dart'
    as smooth_page_indicator;
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'product_details_model.dart';
export 'product_details_model.dart';

class ProductDetailsWidget extends StatefulWidget {
  const ProductDetailsWidget({
    Key? key,
    this.productData,
    required this.productId,
  }) : super(key: key);

  final PostsRecord? productData;
  final DocumentReference? productId;

  @override
  _ProductDetailsWidgetState createState() => _ProductDetailsWidgetState();
}

class _ProductDetailsWidgetState extends State<ProductDetailsWidget> {
  late ProductDetailsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  int get pageViewCurrentIndex => _model.pageViewController != null &&
          _model.pageViewController!.hasClients &&
          _model.pageViewController!.page != null
      ? _model.pageViewController!.page!.round()
      : 0;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProductDetailsModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return StreamBuilder<UsersRecord>(
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
        final productDetailsUsersRecord = snapshot.data!;
        return Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
          body: SafeArea(
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(22.0, 0.0, 22.0, 0.0),
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
                          'Post Details',
                          style: FlutterFlowTheme.of(context).headlineSmall,
                        ),
                        if (widget.productData!.postedBy ==
                            productDetailsUsersRecord.uid)
                          InkWell(
                            onTap: ()  {
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => ProductEditWidget(
                                  productData: widget.productData,
                                ),
                              ));
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
                        if (widget.productData!.postedBy !=
                            productDetailsUsersRecord.uid)
                          Text(
                            'Edit',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Roboto',
                                  color: Colors.white,
                                ),
                          ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 27.0, 0.0, 0.0),
                    child: Container(
                      height: 199.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: Builder(
                        builder: (context) {
                          final productImages =
                              widget.productData!.images!.toList();
                          return Container(
                            width: double.infinity,
                            height: 500.0,
                            child: Stack(
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 35.0),
                                  child: PageView.builder(
                                    controller: _model.pageViewController ??=
                                        PageController(
                                            initialPage: min(
                                                0, productImages.length - 1)),
                                    scrollDirection: Axis.horizontal,
                                    itemCount: productImages.length,
                                    itemBuilder: (context, productImagesIndex) {
                                      final productImagesItem =
                                          productImages[productImagesIndex];
                                      return ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                        child: productImagesItem != null &&
                                                productImagesItem != ""
                                            ? CachedNetworkImageWidget(
                                                image: productImagesItem,
                                                width: 100.0,
                                                height: 100.0,
                                              )
                                            : Icon(
                                                Icons.error_outline,
                                                color: Colors.black,
                                                size: 30,
                                              ),
                                      );
                                    },
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(0.0, 1.0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 10.0),
                                    child: smooth_page_indicator
                                        .SmoothPageIndicator(
                                      controller: _model.pageViewController ??=
                                          PageController(
                                              initialPage: min(
                                                  0, productImages.length - 1)),
                                      count: productImages.length,
                                      axisDirection: Axis.horizontal,
                                      onDotClicked: (i) async {
                                        await _model.pageViewController!
                                            .animateToPage(
                                          i,
                                          duration: Duration(milliseconds: 500),
                                          curve: Curves.ease,
                                        );
                                      },
                                      effect: smooth_page_indicator
                                          .ExpandingDotsEffect(
                                        expansionFactor: 2.0,
                                        spacing: 8.0,
                                        radius: 16.0,
                                        dotWidth: 10.0,
                                        dotHeight: 10.0,
                                        dotColor: FlutterFlowTheme.of(context)
                                            .accent2,
                                        activeDotColor:
                                            FlutterFlowTheme.of(context)
                                                .primary,
                                        paintStyle: PaintingStyle.fill,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 18.0, 0.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          valueOrDefault<String>(
                            widget.productData!.name,
                            'Food Dish',
                          ).maybeHandleOverflow(maxChars: 75),
                          maxLines: 3,
                          style: FlutterFlowTheme.of(context).titleSmall,
                        ),
                        Text(
                          valueOrDefault<String>(
                            widget.productData!.postType,
                            'Free',
                          ),
                          style:
                              FlutterFlowTheme.of(context).titleSmall.override(
                                    fontFamily: 'Roboto',
                                    color: FlutterFlowTheme.of(context).primary,
                                  ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 9.0, 0.0, 23.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        SvgPicture.asset(
                          'assets/images/Group_(5).svg',
                          width: 14.0,
                          height: 14.0,
                          fit: BoxFit.cover,
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              6.0, 0.0, 0.0, 0.0),
                          child: Text(
                            '${valueOrDefault<String>(
                              dateTimeFormat(
                                  'jm', widget.productData!.createdAt),
                              '12:00 AM',
                            )} ${valueOrDefault<String>(
                              dateTimeFormat(
                                  'yMMMd', widget.productData!.createdAt),
                              '19 Apr, 23',
                            )}',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Roboto',
                                  color: Color(0xFF7D8180),
                                ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    thickness: 1.0,
                    color: FlutterFlowTheme.of(context).accent4,
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 14.0, 0.0, 14.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: Color(0xFFE6E6E6),
                            ),
                          ),
                          child: Container(
                            width: 53.0,
                            height: 53.0,
                            clipBehavior: Clip.antiAlias,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                            ),
                            child: FutureBuilder<DocumentSnapshot>(
                              future: widget.productData!.userRef!.get(),
                              builder: (context, snapshot) {
                                return snapshot.hasData
                                    ? CachedNetworkImageWidget(
                                        image: snapshot.data!["photo_url"])
                                    : Icon(Icons.person);
                              },
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              15.0, 0.0, 0.0, 0.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 8.0),
                                child: Text(
                                  widget.productData!.postedByName!,
                                  textAlign: TextAlign.start,
                                  style:
                                      FlutterFlowTheme.of(context).bodyMedium,
                                ),
                              ),
                              Text(
                                '${valueOrDefault<String>(
                                  dateTimeFormat('jm',
                                      productDetailsUsersRecord.createdTime),
                                  '12:00 AM',
                                )} ${valueOrDefault<String>(
                                  dateTimeFormat('yMMMd',
                                      productDetailsUsersRecord.createdTime),
                                  '19 Apr, 23',
                                )}',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Roboto',
                                      color: Color(0xFF7D8180),
                                    ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    thickness: 1.0,
                    color: FlutterFlowTheme.of(context).accent4,
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 22.0, 0.0, 0.0),
                    child: Text(
                      'About Details',
                      style: FlutterFlowTheme.of(context).bodyMedium,
                    ),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Text(
                        valueOrDefault<String>(
                          widget.productData!.description,
                          'post description',
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Roboto',
                              color: Color(0xFF7D8180),
                              fontSize: 14.0,
                            ),
                      ),
                    ),
                  ),
                  //Spacer(),
                  if (widget.productData!.postedBy ==
                      productDetailsUsersRecord.uid)
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 20.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              await Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => PickUpProductWidget(
                                    pickupProductDoc: widget.productData!,
                                  ),
                                ),
                              );
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 110),
                              height: 43.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                borderRadius: BorderRadius.circular(22.0),
                                border: Border.all(
                                  color: FlutterFlowTheme.of(context).primary,
                                  width: 2.0,
                                ),
                              ),
                              child: Text(
                                'Picked Up',
                                textAlign: TextAlign.center,
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Roboto',
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.w600,
                                    ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  if (widget.productData!.postedBy != currentUserUid)
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 34.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              // Added action that will return conversation refrence if there, else
                              // we have to create a conversation.
                              ConversationsRecord? convRef = await actions
                                  .getConversationData(widget.productId!.id);
                              if (convRef == null) {
                                await actions.storeChatUsers(
                                  currentUserUid,
                                  widget.productData!.postedBy!,
                                );

                                final conversationsCreateData = {
                                  ...createConversationsRecordData(
                                    productName: widget.productData!.name,
                                    productImage: widget.productData!.images!
                                        .toList()
                                        .first,
                                    productId: widget.productData!.reference.id,
                                    postedByRefrence:
                                        widget.productData!.userRef,
                                    createUserRefrence: currentUserReference,
                                    postedByLocation:
                                        widget.productData!.address,
                                  ),
                                  'users': FFAppState().chatUsers,
                                  'user_details': [
                                    {
                                      "user_id": currentUserUid,
                                      "user_image": currentUserPhoto,
                                      "user_name": currentUserDisplayName,
                                    },
                                    {
                                      "user_id": widget.productData!.postedBy!,
                                      "user_image":
                                          widget.productData!.postedByProfile!,
                                      "user_name":
                                          widget.productData!.postedByName!,
                                    }
                                  ]
                                };

                                await ConversationsRecord.collection
                                    .doc()
                                    .set(conversationsCreateData);

                                List<String> convIds = widget
                                        .productData!.conversations
                                        ?.map((p0) => p0)
                                        .toList() ??
                                    [];

                                convRef = await actions
                                    .getConversationData(widget.productId!.id);
                                convIds.add(convRef!.ffRef!.id);
                                await widget.productData!.ffRef!
                                    .update(
                                    {"conversations": convIds,
                                     "conversationUserId": currentUserDocument?.uid,
                                    });
                              }


                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => ChatDetailsWidget(
                                  postData: widget.productData,
                                  username: widget.productData!.postedByName,
                                  productname: widget.productData!.name,
                                  profileimage:
                                  widget.productData!.postedByProfile,
                                  productimage: widget.productData!.images!
                                      .toList()
                                      .first,
                                  conversationsDoc: convRef,
                                  productlocation:
                                  widget.productData!.address,
                                  userRef: widget.productData!.userRef,
                                ),
                              ));
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 12, horizontal: 90),
                              height: 43.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context).primary,
                                borderRadius: BorderRadius.circular(22.0),
                              ),
                              child: Text(
                                'Start Conversation',
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
                        ],
                      ),
                    ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
