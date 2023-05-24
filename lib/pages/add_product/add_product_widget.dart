import 'package:n_y_d_app/components/LoadingWidget.dart';
import 'package:n_y_d_app/components/cached_network_image.dart';

import '/backend/firebase_storage/storage.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/upload_data.dart';
import '/pages/add_product_detail/add_product_detail_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'add_product_model.dart';
export 'add_product_model.dart';

class AddProductWidget extends StatefulWidget {
  const AddProductWidget({Key? key}) : super(key: key);

  @override
  _AddProductWidgetState createState() => _AddProductWidgetState();
}

class _AddProductWidgetState extends State<AddProductWidget> {
  late AddProductModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();
  TextEditingController textController1 = TextEditingController();
  String? Function(BuildContext, String?)? textController1Validator;
  // State field(s) for TextField widget.
  TextEditingController textController2 = TextEditingController();
  String? Function(BuildContext, String?)? textController2Validator;
  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AddProductModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      FFAppState().update(() {
        FFAppState().mediaUrl = [];
      });
    });

    textController1 = TextEditingController();
    textController2 = TextEditingController();
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
        resizeToAvoidBottomInset: false,
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(22.0, 0.0, 22.0, 0.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Post Item',
                                style:
                                    FlutterFlowTheme.of(context).headlineSmall,
                              ),
                            ],
                          ),
                        ),
                        InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            // if (FFAppState().mediaUrl.length == 5) {
                            //   ScaffoldMessenger.of(context).showSnackBar(
                            //     SnackBar(
                            //       content: Text(
                            //         'Maximum 5 images select',
                            //         style: TextStyle(
                            //           color: Colors.white,
                            //         ),
                            //       ),
                            //       duration: Duration(milliseconds: 4000),
                            //       backgroundColor:
                            //           FlutterFlowTheme.of(context).primary,
                            //     ),
                            //   );
                            // } else {
                              _model.uploadedFileUrl = "";
                              final selectedMedia =
                                  await selectMediaWithSourceBottomSheet(
                                context: context,
                                allowPhoto: true,
                                backgroundColor:
                                    FlutterFlowTheme.of(context).tertiary,
                                textColor: Colors.black,
                              );
                              LoadingOverlay.show(context);
                              if (selectedMedia != null &&
                                  selectedMedia.every((m) => validateFileFormat(
                                      m.storagePath, context))) {
                                setState(() => _model.isDataUploading = true);
                                var selectedUploadedFiles = <FFUploadedFile>[];
                                var downloadUrls = <String>[];
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
                                      (m) async => await uploadData(
                                          m.storagePath, m.bytes),
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
                                    downloadUrls.length ==
                                        selectedMedia.length) {
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
                              if (_model.uploadedFileUrl != '') {
                                setState(() {
                                  if(FFAppState().mediaUrl.length > 0){
                                    FFAppState().removeFromMediaUrl(FFAppState().mediaUrl.first);
                                  }
                                  FFAppState().addToMediaUrl(valueOrDefault<String>(
                                    _model.uploadedFileUrl,
                                    'null',
                                  ));
                                });
                              } else {
                                LoadingOverlay.hide();
                              }
                          //  }
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 24.0, 0.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        width: 100.0,
                                        height: 100.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          borderRadius:
                                              BorderRadius.circular(12.0),
                                          border: Border.all(
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                          ),
                                        ),
                                        child:FFAppState().mediaUrl.length > 0?
                                        ClipRRect(
                                          borderRadius:
                                          BorderRadius.circular(
                                              12.0),
                                          child: CachedNetworkImageWidget(

                                            image: FFAppState().mediaUrl.toList().first,
                                            width: 100.0,
                                            height: 85.0,
                                          ),
                                        ):
                                        Icon(
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
                                  child: Text(
                                    'Select Photos',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Roboto',
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                        ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        // if (FFAppState().mediaUrl.length > 0)
                        //   Padding(
                        //     padding: EdgeInsetsDirectional.fromSTEB(
                        //         0.0, 40.0, 0.0, 40.0),
                        //     child: Builder(
                        //       builder: (context) {
                        //         final gallery = FFAppState().mediaUrl.toList();
                        //         return SizedBox(
                        //           height: 80,
                        //           child: ListView.builder(
                        //             padding: EdgeInsets.zero,
                        //             shrinkWrap: true,
                        //             scrollDirection: Axis.horizontal,
                        //             itemCount: gallery.length,
                        //             itemBuilder: (context, galleryIndex) {
                        //               final galleryItem = gallery[galleryIndex];
                        //               return Padding(
                        //                 padding: EdgeInsetsDirectional.fromSTEB(
                        //                     10.0, 0.0, 10.0, 0.0),
                        //                 child: Container(
                        //                   width: 80.0,
                        //                   decoration: BoxDecoration(
                        //                     color: FlutterFlowTheme.of(context)
                        //                         .tertiary,
                        //                     borderRadius:
                        //                         BorderRadius.circular(12.0),
                        //                     shape: BoxShape.rectangle,
                        //                   ),
                        //                   child: Stack(
                        //                     alignment:
                        //                         AlignmentDirectional(1.0, -1.0),
                        //                     children: [
                        //                       ClipRRect(
                        //                           borderRadius:
                        //                               BorderRadius.circular(
                        //                                   12.0),
                        //                           child:
                        //                               CachedNetworkImageWidget(
                        //                             image: galleryItem,
                        //                             width: 100.0,
                        //                             height: 85.0,
                        //                           )),
                        //                       InkWell(
                        //                         splashColor: Colors.transparent,
                        //                         focusColor: Colors.transparent,
                        //                         hoverColor: Colors.transparent,
                        //                         highlightColor:
                        //                             Colors.transparent,
                        //                         onTap: () async {
                        //                           setState(() {
                        //                             FFAppState()
                        //                                 .removeFromMediaUrl(
                        //                                     valueOrDefault<
                        //                                         String>(
                        //                               galleryItem,
                        //                               'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/sample-app-property-finder-834ebu/assets/lhbo8hbkycdw/addCoverImage@2x.png',
                        //                             ));
                        //                           });
                        //                         },
                        //                         child: Container(
                        //                           width: 26.0,
                        //                           height: 25.0,
                        //                           decoration: BoxDecoration(
                        //                             color: FlutterFlowTheme.of(
                        //                                     context)
                        //                                 .primary,
                        //                             borderRadius:
                        //                                 BorderRadius.only(
                        //                               bottomLeft:
                        //                                   Radius.circular(22.0),
                        //                               bottomRight:
                        //                                   Radius.circular(0.0),
                        //                               topLeft:
                        //                                   Radius.circular(0.0),
                        //                               topRight:
                        //                                   Radius.circular(10.0),
                        //                             ),
                        //                             shape: BoxShape.rectangle,
                        //                           ),
                        //                           child: Align(
                        //                             alignment:
                        //                                 AlignmentDirectional(
                        //                                     0.4, -0.2),
                        //                             child: Icon(
                        //                               Icons.delete_outlined,
                        //                               color: Colors.white,
                        //                               size: 14.0,
                        //                             ),
                        //                           ),
                        //                         ),
                        //                       ),
                        //                     ],
                        //                   ),
                        //                 ),
                        //               );
                        //             },
                        //           ),
                        //         );
                        //       },
                        //     ),
                        //   ),
                        // if (FFAppState().mediaUrl.length < 1)
                          Container(
                            height: 20.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                            ),
                          ),
                        Text(
                          'Title',
                          style:
                              FlutterFlowTheme.of(context).labelMedium.override(
                                    fontFamily: 'Roboto',
                                    color: Color(0xFF7D8180),
                                  ),
                        ),
                        TextFormField(
                          cursorColor: Colors.grey,
                          controller: textController1,
                          textCapitalization: TextCapitalization.words,
                          textInputAction: TextInputAction.next,
                          obscureText: false,
                          decoration: InputDecoration(
                            hintText: 'Add title',
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
                          maxLines: 5,
                          minLines: 1,
                          keyboardType: TextInputType.multiline,
                          validator: textController1Validator
                              .asValidator(context),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 26.0, 0.0, 0.0),
                          child: Text(
                            'Description',
                            style: FlutterFlowTheme.of(context)
                                .labelMedium
                                .override(
                                  fontFamily: 'Roboto',
                                  color: Color(0xFF7D8180),
                                ),
                          ),
                        ),
                        TextFormField(
                          cursorColor: Colors.grey,
                          controller: textController2,
                          textCapitalization: TextCapitalization.words,
                          obscureText: false,
                          decoration: InputDecoration(
                            hintText: 'Add post Description',
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
                          maxLines: 8,
                          minLines: 1,
                          keyboardType: TextInputType.multiline,
                          validator: textController2Validator
                              .asValidator(context),
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

                      if ((textController1.text != '') &&
                          (textController2.text != '') &&
                          (FFAppState().mediaUrl.length > 0)) {
                        await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AddProductDetailWidget(
                              productName: textController1.text,
                              productDescription: textController2.text,
                              images: FFAppState().mediaUrl.toList(),
                            ),
                          ),
                        );
                      }
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 12),
                      alignment: Alignment.center,
                      height: 43.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).primary,
                        borderRadius: BorderRadius.circular(22.0),
                        shape: BoxShape.rectangle,
                      ),
                      child: Text(
                        'Next',
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
