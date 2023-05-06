import 'package:n_y_d_app/components/cached_network_image.dart';

import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'chat_list_item_model.dart';
export 'chat_list_item_model.dart';

class ChatListItemWidget extends StatefulWidget {
  const ChatListItemWidget({
    Key? key,
    this.profileImageChat,
    this.nameText,
    this.discriptionText,
    this.dateText,
    this.productImage,
  }) : super(key: key);

  final String? profileImageChat;
  final String? nameText;
  final String? discriptionText;
  final String? dateText;
  final String? productImage;

  @override
  _ChatListItemWidgetState createState() => _ChatListItemWidgetState();
}

class _ChatListItemWidgetState extends State<ChatListItemWidget> {
  late ChatListItemModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ChatListItemModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(22.0, 0.0, 22.0, 0.0),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 53.0,
                  height: 53.0,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: CachedNetworkImageWidget(
                    image:  widget.profileImageChat!,
                  )
                ),
                Container(
                  width: 200.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                    shape: BoxShape.rectangle,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.nameText!,
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Roboto',
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      Text(
                        widget.discriptionText!,
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Roboto',
                              fontSize: 12.0,
                              fontWeight: FontWeight.normal,
                            ),
                      ),
                      Text(
                        widget.dateText!,
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Roboto',
                              color: Color(0xFF7D8180),
                              fontSize: 10.0,
                              fontWeight: FontWeight.normal,
                            ),
                      ),
                    ],
                  ),
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(6.0),
                  child: CachedNetworkImageWidget(
                    image:  widget.productImage!,
                      width: 61.0,
                      height: 45.0,
                  )
                ),
              ],
            ),
          ),
          Divider(
            thickness: 1.0,
            color: Color(0xFFE6E6E6),
          ),
        ],
      ),
    );
  }
}
