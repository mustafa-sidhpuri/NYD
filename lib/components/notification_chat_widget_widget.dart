import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'notification_chat_widget_model.dart';
export 'notification_chat_widget_model.dart';

class NotificationChatWidgetWidget extends StatefulWidget {
  const NotificationChatWidgetWidget({
    Key? key,
    this.iconNotification,
    this.desNotification,
    this.dayAgoNotification,
  }) : super(key: key);

  final String? iconNotification;
  final String? desNotification;
  final String? dayAgoNotification;

  @override
  _NotificationChatWidgetWidgetState createState() =>
      _NotificationChatWidgetWidgetState();
}

class _NotificationChatWidgetWidgetState
    extends State<NotificationChatWidgetWidget> {
  late NotificationChatWidgetModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NotificationChatWidgetModel());
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
      children: [
        Align(
          alignment: AlignmentDirectional(0.0, 0.0),
          child: Container(
            width: double.infinity,
            height: 77.0,
            decoration: BoxDecoration(
              color: Color(0xFFC9DDFF),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Align(
                  alignment: AlignmentDirectional(0.0, 0.0),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(28.0, 0.0, 0.0, 0.0),
                    child: Container(
                      width: 42.0,
                      height: 42.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        shape: BoxShape.circle,
                      ),
                      child: SvgPicture.asset(
                        'assets/images/person_icon.svg',
                        width: 17.0,
                        height: 17.0,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 80.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'New items from sellers you follow',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Roboto',
                                  fontSize: 12.0,
                                ),
                          ),
                          Text(
                            '1 day ago',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Roboto',
                                  color: Color(0xFF7D8180),
                                  fontSize: 10.0,
                                  fontWeight: FontWeight.normal,
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
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(22.0, 0.0, 22.0, 0.0),
          child: Container(
            width: 346.0,
            height: 2.0,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).secondaryBackground,
            ),
          ),
        ),
      ],
    );
  }
}
