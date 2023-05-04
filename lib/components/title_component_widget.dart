import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'title_component_model.dart';
export 'title_component_model.dart';

class TitleComponentWidget extends StatefulWidget {
  const TitleComponentWidget({
    Key? key,
    this.title,
    this.subtitle,
  }) : super(key: key);

  final String? title;
  final String? subtitle;

  @override
  _TitleComponentWidgetState createState() => _TitleComponentWidgetState();
}

class _TitleComponentWidgetState extends State<TitleComponentWidget> {
  late TitleComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TitleComponentModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.title!,
          style: FlutterFlowTheme.of(context).displaySmall.override(
                fontFamily: 'Roboto',
                color: Colors.black,
                fontSize: 28.0,
                fontWeight: FontWeight.bold,
              ),
        ),
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
          child: Text(
            widget.subtitle!,
            style: FlutterFlowTheme.of(context).displaySmall.override(
                  fontFamily: 'Roboto',
                  color: Color(0xFF7D8180),
                  fontSize: 14.0,
                  fontWeight: FontWeight.w500,
                ),
          ),
        ),
      ],
    );
  }
}
