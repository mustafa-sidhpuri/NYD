import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/chat_list_item_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ChatDetailsModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  // Model for ChatListItem component.
  late ChatListItemModel chatListItemModel;
  // State field(s) for TextField widget.
  // TextEditingController? textController;
  // String? Function(BuildContext, String?)? textControllerValidator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    chatListItemModel = createModel(context, () => ChatListItemModel());
  }

  void dispose() {
    chatListItemModel.dispose();
   // textController?.dispose();
  }

  /// Additional helper methods are added here.

}
