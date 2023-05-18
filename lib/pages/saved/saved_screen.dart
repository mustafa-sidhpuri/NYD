import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:n_y_d_app/backend/backend.dart';
import 'package:n_y_d_app/components/cached_network_image.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../app_state.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../product_details/product_details_widget.dart';

class SavedScreen extends StatelessWidget {
  const SavedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(22.0, 0.0, 22.0, 0.0),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 30.0, 8.0, 0.0),
                child: Row(
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
                          'Saved Posts',
                          style: FlutterFlowTheme.of(context).headlineSmall,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Divider(
                thickness: 1.0,
                color: Color(0xFFE6E6E6),
              ),
              if (FFAppState().savedPost.length > 0)
                Expanded(
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                    child: Builder(
                      builder: (context) {
                        final savedPost = FFAppState().savedPost.toList();
                        return GridView.builder(
                          padding: EdgeInsets.zero,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            crossAxisSpacing: 10.0,
                            mainAxisSpacing: 10.0,
                            childAspectRatio: 1.0,
                          ),
                          scrollDirection: Axis.vertical,
                          itemCount: savedPost.length,
                          itemBuilder: (context, index) {
                            return FutureBuilder<DocumentSnapshot>(
                                future: savedPost[index].get(),
                                builder: (context, snapshot) {
                                  return ClipRRect(
                                    borderRadius: BorderRadius.circular(12.0),
                                    child: snapshot.hasData
                                        ? InkWell(
                                            onTap: () async{
                                              final postData =
                                              await PostsRecord.getDocumentOnce(
                                                  savedPost[index]);
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      ProductDetailsWidget(
                                                        productData: postData,
                                                        productId:savedPost[index],
                                                      ),
                                                ),
                                              );

                                            },
                                            child: CachedNetworkImageWidget(
                                              image: snapshot.data!["images"]
                                                  .toList()
                                                  .first,
                                              width: 105.0,
                                              height: 105.0,
                                            ),
                                          )
                                        : Center(
                                            child: CircularProgressIndicator(),
                                          ),
                                  );
                                });
                          },
                        );
                      },
                    ),
                  ),
                ),
              if (FFAppState().savedPost.length < 1)
                Container(
                  height: 100,
                  child: Center(
                    child: Text('No Saved Post.'),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
