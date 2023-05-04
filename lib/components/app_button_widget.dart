import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'app_button_model.dart';
export 'app_button_model.dart';

class AppButtonWidget extends StatefulWidget {
  const AppButtonWidget({
    Key? key,
    this.buttonText,
  }) : super(key: key);

  final String? buttonText;

  @override
  _AppButtonWidgetState createState() => _AppButtonWidgetState();
}

class _AppButtonWidgetState extends State<AppButtonWidget> {
  late AppButtonModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AppButtonModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Container(
      width: 124.0,
      height: 43.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).primary,
        borderRadius: BorderRadius.circular(22.0),
      ),
      child: InkWell(
        splashColor: Colors.transparent,
        focusColor: Colors.transparent,
        hoverColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap: () async {
          final user = await authManager.signInWithEmail(
            context,
            _model.appButtonController0.text,
            _model.appButtonController0.text,
          );
          if (user == null) {
            return;
          }

          await Navigator.push(
            context,
            PageTransition(
              type: PageTransitionType.fade,
              duration: Duration(milliseconds: 0),
              reverseDuration: Duration(milliseconds: 0),
              child: NavBarPage(initialPage: 'homePage'),
            ),
          );
        },
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              widget.buttonText!,
              style: FlutterFlowTheme.of(context).titleSmall.override(
                    fontFamily: 'Roboto',
                    color: Colors.white,
                  ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 0.0, 0.0),
              child: SvgPicture.asset(
                'assets/images/Vector.svg',
                width: 18.0,
                height: 14.0,
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
