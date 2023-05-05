import 'package:flutter/material.dart';
import 'package:n_y_d_app/flutter_flow/flutter_flow_theme.dart';

class LoadingOverlay {
  static OverlayEntry? _overlay;

  static void show(BuildContext context) {
    if (_overlay == null) {
      _overlay = OverlayEntry(
        // replace with your own layout
        builder: (context) =>  ColoredBox(
          color: Color(0x80000000),
          child: Center(
              child: CircularProgressIndicator(color:
              FlutterFlowTheme.of(context).primary, )),
        ),
      );
      Overlay.of(context).insert(_overlay!);
    }
  }

  static void hide() {
    if (_overlay != null) {
      _overlay?.remove();
      _overlay = null;
    }
  }
}