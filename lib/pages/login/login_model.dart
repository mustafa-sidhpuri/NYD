import '/auth/firebase_auth/auth_util.dart';
import '/components/title_component_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/forgot_password/forgot_password_widget.dart';
import '/main.dart';
import '/pages/create_account/create_account_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class LoginModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // Model for titleComponent component.
  late TitleComponentModel titleComponentModel;
  // State field(s) for emailAddress widget.
  TextEditingController? emailAddressController;
  String? Function(BuildContext, String?)? emailAddressControllerValidator;
  // State field(s) for password widget.
  TextEditingController? passwordController;
  late bool passwordVisibility;
  String? Function(BuildContext, String?)? passwordControllerValidator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    titleComponentModel = createModel(context, () => TitleComponentModel());
    passwordVisibility = false;
  }

  void dispose() {
    titleComponentModel.dispose();
    emailAddressController?.dispose();
    passwordController?.dispose();
  }

  /// Additional helper methods are added here.

}
