import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../flutter_flow/flutter_flow_theme.dart';

class HelpScreen extends StatelessWidget {
  const HelpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(22.0, 0.0, 22.0, 0.0),
          child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
            stream: FirebaseFirestore.instance.collection('contactUs').snapshots(),
            builder: (context, snapshot) {

              if (snapshot.hasError)
                return Text('Error = ${snapshot.error}');

              if(snapshot.hasData){
                final docs = snapshot.data!.docs;
                final data = docs[0].data();
                return Column(
                  children: [
                    Padding(
                      padding:
                      EdgeInsetsDirectional.fromSTEB(0.0, 30.0, 0.0, 0.0),
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
                                'Help',
                                style: FlutterFlowTheme.of(context).headlineSmall,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Text("Hello! We're here to assist you. if you have any question, need guidance, or want to report an issue, our dedicated support team is just a message or call away. We value your experience with our app and strive to provide timely and effective support. Don't hesitate to reach out to us - we're committed to ensuring your satisfaction!",
                      style: FlutterFlowTheme.of(
                          context)
                          .bodyMedium
                          .override(
                        fontFamily:
                        'Roboto',
                        fontSize: 16.0,
                      ),
                      textAlign: TextAlign.justify,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.email,
                          color: Colors.grey,
                          size: 24.0,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        InkWell(
                          onTap: () async{
                            String email = Uri.encodeComponent(data["email_id"]);

                            Uri mail = Uri.parse('mailto:$email');

                            if (await launchUrl(mail)) {
                              print("success");
                            } else {
                              throw 'Could not launch $mail';
                            }
                          },
                          child: Text(data["email_id"],
                            style: FlutterFlowTheme.of(
                                context)
                                .bodyMedium
                                .override(
                              color: FlutterFlowTheme.of(context).primary,
                              fontFamily:
                              'Roboto',
                              fontSize: 16.0,
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.phone,
                          color: Colors.grey,
                          size: 24.0,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        InkWell(
                          onTap: () async{
                            String phone = Uri.encodeComponent(data["phone_number"]);

                            Uri telephone = Uri.parse('tel:$phone');

                            if (await launchUrl(telephone)) {
                              print("success");
                            } else {
                              throw 'Could not launch $telephone';
                            }
                          },
                          child: Text(data["phone_number"],
                            style: FlutterFlowTheme.of(
                                context)
                                .bodyMedium
                                .override(
                              color: FlutterFlowTheme.of(context).primary,
                              fontFamily:
                              'Roboto',
                              fontSize: 16.0,
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                );
              }


              return Center(child: CircularProgressIndicator());
            }
          ),
        )

      ),
    );
  }
}
