import '/auth/firebase_auth/auth_util.dart';
import '/components/title_component_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/login/login_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ForgotPasswordModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  // Model for titleComponent component.
  late TitleComponentModel titleComponentModel;
  // State field(s) for email widget.
  TextEditingController? emailController;
  String? Function(BuildContext, String?)? emailControllerValidator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    titleComponentModel = createModel(context, () => TitleComponentModel());
  }

  void dispose() {
    titleComponentModel.dispose();
    emailController?.dispose();
  }

  /// Additional helper methods are added here.

}
