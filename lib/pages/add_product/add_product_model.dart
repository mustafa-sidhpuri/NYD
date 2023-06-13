import '/backend/firebase_storage/storage.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/upload_data.dart';
import '/pages/add_product_detail/add_product_detail_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AddProductModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  bool isDataUploading = false;
  List<FFUploadedFile> uploadedLocalFiles = [];
  List<String> uploadedFileUrls = [];
  //
  // // State field(s) for TextField widget.
  // TextEditingController? textController1;
  // String? Function(BuildContext, String?)? textController1Validator;
  // // State field(s) for TextField widget.
  // TextEditingController? textController2;
  // String? Function(BuildContext, String?)? textController2Validator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    // textController1?.dispose();
    // textController2?.dispose();
  }

  /// Additional helper methods are added here.

}
