import 'package:flutter/material.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import 'cached_network_image.dart';

class ShowFullImage extends StatelessWidget {
  final String postImage;
  const ShowFullImage({Key? key, required this.postImage}) : super(key: key);

  final double minScale = 1;
  final double maxScale = 4;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 22, right: 22,top: 30),
          child: Column(
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () async {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.arrow_back_ios,
                      color: Colors.black,
                      size: 24.0,
                    ),
                  ),
                  Expanded(
                    child: Center(
                      child: Text(
                        'Post Image',
                        style: FlutterFlowTheme.of(context).headlineSmall,
                      ),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: InteractiveViewer(
                  panEnabled: false,
                  clipBehavior: Clip.none,
                  minScale: minScale,
                  maxScale: maxScale,
                  child: Container(
                    alignment: Alignment.center,
                    width: double.infinity,
                    height: 300,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12.0),
                      child: postImage != null && postImage != ""
                          ? CachedNetworkImageWidget(
                            image: postImage,
                            width: double.infinity,
                            height: 300,
                          )
                          : Icon(
                              Icons.error_outline,
                              color: Colors.black,
                              size: 30,
                            ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
