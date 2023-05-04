import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'app_button_widget_model.dart';
export 'app_button_widget_model.dart';

class AppButtonWidgetWidget extends StatefulWidget {
  const AppButtonWidgetWidget({
    Key? key,
    this.buttonName,
  }) : super(key: key);

  final String? buttonName;

  @override
  _AppButtonWidgetWidgetState createState() => _AppButtonWidgetWidgetState();
}

class _AppButtonWidgetWidgetState extends State<AppButtonWidgetWidget> {
  late AppButtonWidgetModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AppButtonWidgetModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Container();
  }
}
