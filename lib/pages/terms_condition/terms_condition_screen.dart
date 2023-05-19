import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:n_y_d_app/flutter_flow/flutter_flow_theme.dart';

class TermsCondition extends StatelessWidget {
  const TermsCondition({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 22, right: 22),
          child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
              stream: FirebaseFirestore.instance
                  .collection('contactUs')
                  .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.hasError) return Text('Error = ${snapshot.error}');

                if (snapshot.hasData) {
                  final docs = snapshot.data!.docs;
                  final data = docs[0].data();
                  return SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 30,
                        ),
                        Row(
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
                                  'Terms & Conditions',
                                  style: FlutterFlowTheme.of(context)
                                      .headlineSmall,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Text(
                          "Terms & Conditions for Food share:",
                          style: FlutterFlowTheme.of(context).displaySmall,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "Last updated: May 18, 2023",
                          style: FlutterFlowTheme.of(context).bodySmall,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "This Privacy Policy describes Our policies and procedures on the collection, use and disclosure of Your information when You use the Service and tells You about Your privacy rights and how the law protects You.3",
                          style: FlutterFlowTheme.of(context).bodySmall,
                          textAlign: TextAlign.justify,
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          "We use Your Personal data to provide and improve the Service. By using the Service, You agree to the collection and use of information in accordance with this Privacy Policy. This Privacy Policy has been created with the help of the Privacy Policy Generator.",
                          style: FlutterFlowTheme.of(context).bodySmall,
                          textAlign: TextAlign.justify,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "Collecting and Using Your Personal Data",
                          style: FlutterFlowTheme.of(context).displaySmall,
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          "Personal Data",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          "While using Our Service, We may ask You to provide Us with certain personally identifiable information that can be used to contact or identify You. Personally identifiable information may include, but is not limited to:",
                          style: FlutterFlowTheme.of(context).bodySmall,
                          textAlign: TextAlign.justify,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "   • Email address",
                          style: FlutterFlowTheme.of(context).bodySmall,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "   • First name and last name",
                          style: FlutterFlowTheme.of(context).bodySmall,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "   • Phone number",
                          style: FlutterFlowTheme.of(context).bodySmall,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "   • Address, State, Province, ZIP/Postal code, City",
                          style: FlutterFlowTheme.of(context).bodySmall,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "   • Usage Data",
                          style: FlutterFlowTheme.of(context).bodySmall,
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          "Usage Data",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.w600),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          "Usage Data is collected automatically when using the Service.",
                          style: FlutterFlowTheme.of(context).bodySmall,
                          textAlign: TextAlign.justify,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Usage Data may include information such as Your Device's Internet Protocol address (e.g. IP address), browser type, browser version, the pages of our Service that You visit, the time and date of Your visit, the time spent on those pages, unique device identifiers and other diagnostic data.",
                          style: FlutterFlowTheme.of(context).bodySmall,
                          textAlign: TextAlign.justify,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "When You access the Service by or through a mobile device, We may collect certain information automatically, including, but not limited to, the type of mobile device You use, Your mobile device unique ID, the IP address of Your mobile device, Your mobile operating system, the type of mobile Internet browser You use, unique device identifiers and other diagnostic data.",
                          style: FlutterFlowTheme.of(context).bodySmall,
                          textAlign: TextAlign.justify,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "We may also collect information that Your browser sends whenever You visit our Service or when You access the Service by or through a mobile device.",
                          style: FlutterFlowTheme.of(context).bodySmall,
                          textAlign: TextAlign.justify,
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          "Information Collected while Using the Application",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.w600),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "While using Our Application, in order to provide features of Our Application, We may collect, with Your prior permission:",
                          style: FlutterFlowTheme.of(context).bodySmall,
                          textAlign: TextAlign.justify,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "      • Information regarding your location",
                          style: FlutterFlowTheme.of(context).bodySmall,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "      • Pictures and other information from your Device's camera and photo librar",
                          style: FlutterFlowTheme.of(context).bodySmall,
                          textAlign: TextAlign.justify,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "We use this information to provide features of Our Service, to improve and customize Our Service. The information may be uploaded to the Company's servers and/or a Service Provider's server or it may be simply stored on Your device.",
                          style: FlutterFlowTheme.of(context).bodySmall,
                          textAlign: TextAlign.justify,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "You can enable or disable access to this information at any time, through Your Device settings.",
                          style: FlutterFlowTheme.of(context).bodySmall,
                          textAlign: TextAlign.justify,
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          "Use of Your Personal Data",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.w600),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "The Company may use Personal Data for the following purposes:",
                          style: FlutterFlowTheme.of(context).bodySmall,
                          textAlign: TextAlign.justify,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        RichText(
                          textAlign: TextAlign.justify,
                          text: TextSpan(
                              text: "•  To provide and maintain our Service, ",
                              style: TextStyle(
                                  fontWeight: FontWeight.w800,
                                  color: Colors.black,
                                  fontSize: 14),
                              children: [
                                TextSpan(
                                  text:
                                      "including to monitor the usage of our Service.",
                                  style: FlutterFlowTheme.of(context).bodySmall,
                                )
                              ]),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        RichText(
                          textAlign: TextAlign.justify,
                          text: TextSpan(
                              text: "•  To manage Your Account: ",
                              style: TextStyle(
                                  fontWeight: FontWeight.w800,
                                  color: Colors.black,
                                  fontSize: 14),
                              children: [
                                TextSpan(
                                  text:
                                      "to manage Your registration as a user of the Service. The Personal Data You provide can give You access to different functionalities of the Service that are available to You as a registered user.",
                                  style: FlutterFlowTheme.of(context).bodySmall,
                                )
                              ]),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        RichText(
                          textAlign: TextAlign.justify,
                          text: TextSpan(
                              text: "•  For the performance of a contract: ",
                              style: TextStyle(
                                  fontWeight: FontWeight.w800,
                                  color: Colors.black,
                                  fontSize: 14),
                              children: [
                                TextSpan(
                                  text:
                                      "the development, compliance and undertaking of the purchase contract for the products, items or services You have purchased or of any other contract with Us through the Service.",
                                  style: FlutterFlowTheme.of(context).bodySmall,
                                )
                              ]),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        RichText(
                          textAlign: TextAlign.justify,
                          text: TextSpan(
                            text: "•  To contact You: ",
                            style: TextStyle(
                                fontWeight: FontWeight.w800,
                                color: Colors.black,
                                fontSize: 14),
                            children: [
                              TextSpan(
                                text:
                                    "To contact You by email, telephone calls, SMS, or other equivalent forms of electronic communication, such as a mobile application's push notifications regarding updates or informative communications related to the functionalities, products or contracted services, including the security updates, when necessary or reasonable for their implementation.",
                                style: FlutterFlowTheme.of(context).bodySmall,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        RichText(
                          textAlign: TextAlign.justify,
                          text: TextSpan(
                              text: "•  To manage Your requests: ",
                              style: TextStyle(
                                  fontWeight: FontWeight.w800,
                                  color: Colors.black,
                                  fontSize: 14),
                              children: [
                                TextSpan(
                                  text:
                                      "To attend and manage Your requests to Us.",
                                  style: FlutterFlowTheme.of(context).bodySmall,
                                )
                              ]),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        RichText(
                          textAlign: TextAlign.justify,
                          text: TextSpan(
                              text: "•  For business transfers: ",
                              style: TextStyle(
                                  fontWeight: FontWeight.w800,
                                  color: Colors.black,
                                  fontSize: 14),
                              children: [
                                TextSpan(
                                  text:
                                      "We may use Your information to evaluate or conduct a merger, divestiture, restructuring, reorganization, dissolution, or other sale or transfer of some or all of Our assets, whether as a going concern or as part of bankruptcy, liquidation, or similar proceeding, in which Personal Data held by Us about our Service users is among the assets transferred.",
                                  style: FlutterFlowTheme.of(context).bodySmall,
                                )
                              ]),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        RichText(
                          textAlign: TextAlign.justify,
                          text: TextSpan(
                              text: "•  For other purposes: ",
                              style: TextStyle(
                                  fontWeight: FontWeight.w800,
                                  color: Colors.black,
                                  fontSize: 14),
                              children: [
                                TextSpan(
                                  text:
                                      "We may use Your information for other purposes, such as data analysis, identifying usage trends, determining the effectiveness of our promotional campaigns and to evaluate and improve our Service, products, services, marketing and your experience.",
                                  style: FlutterFlowTheme.of(context).bodySmall,
                                )
                              ]),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        RichText(
                          textAlign: TextAlign.justify,
                          text: TextSpan(
                              text: "•  With Service Providers: ",
                              style: TextStyle(
                                  fontWeight: FontWeight.w800,
                                  color: Colors.black,
                                  fontSize: 14),
                              children: [
                                TextSpan(
                                  text:
                                      "We may share Your personal information with Service Providers to monitor and analyze the use of our Service, to contact You.",
                                  style: FlutterFlowTheme.of(context).bodySmall,
                                )
                              ]),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        RichText(
                          textAlign: TextAlign.justify,
                          text: TextSpan(
                              text: "•  For business transfers: ",
                              style: TextStyle(
                                  fontWeight: FontWeight.w800,
                                  color: Colors.black,
                                  fontSize: 14),
                              children: [
                                TextSpan(
                                  text:
                                      "We may share or transfer Your personal information in connection with, or during negotiations of, any merger, sale of Company assets, financing, or acquisition of all or a portion of Our business to another company.",
                                  style: FlutterFlowTheme.of(context).bodySmall,
                                )
                              ]),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        RichText(
                          textAlign: TextAlign.justify,
                          text: TextSpan(
                              text: "•  With business partners: ",
                              style: TextStyle(
                                  fontWeight: FontWeight.w800,
                                  color: Colors.black,
                                  fontSize: 14),
                              children: [
                                TextSpan(
                                  text:
                                      "We may share Your information with Our business partners to offer You certain products, services or promotions.",
                                  style: FlutterFlowTheme.of(context).bodySmall,
                                )
                              ]),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        RichText(
                          textAlign: TextAlign.justify,
                          text: TextSpan(
                              text: "•  With other users: ",
                              style: TextStyle(
                                  fontWeight: FontWeight.w800,
                                  color: Colors.black,
                                  fontSize: 14),
                              children: [
                                TextSpan(
                                  text:
                                      "when You share personal information or otherwise interact in the public areas with other users, such information may be viewed by all users and may be publicly distributed outside.",
                                  style: FlutterFlowTheme.of(context).bodySmall,
                                )
                              ]),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        RichText(
                          textAlign: TextAlign.justify,
                          text: TextSpan(
                              text: "•  With Your consent:  ",
                              style: TextStyle(
                                  fontWeight: FontWeight.w800,
                                  color: Colors.black,
                                  fontSize: 14),
                              children: [
                                TextSpan(
                                  text:
                                      "We may disclose Your personal information for any other purpose with Your consent.",
                                  style: FlutterFlowTheme.of(context).bodySmall,
                                )
                              ]),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "Delete Your Personal Data",
                          style: FlutterFlowTheme.of(context).displaySmall,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "You have the right to delete or request that We assist in deleting the Personal Data that We have collected about You.",
                          style: FlutterFlowTheme.of(context).bodySmall,
                          textAlign: TextAlign.justify,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Our Service may give You the ability to delete certain information about You from within the Service.",
                          style: FlutterFlowTheme.of(context).bodySmall,
                          textAlign: TextAlign.justify,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "You may update, amend, or delete Your information at any time by signing in to Your Account, if you have one, and visiting the account settings section that allows you to manage Your personal information. You may also contact Us to request access to, correct, or delete any personal information that You have provided to Us.",
                          style: FlutterFlowTheme.of(context).bodySmall,
                          textAlign: TextAlign.justify,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Please note, however, that We may need to retain certain information when we have a legal obligation or lawful basis to do so.",
                          style: FlutterFlowTheme.of(context).bodySmall,
                          textAlign: TextAlign.justify,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "Disclosure of Your Personal Data",
                          style: FlutterFlowTheme.of(context).displaySmall,
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          "Business Transactions",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.w600),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          "If the Company is involved in a merger, acquisition or asset sale, Your Personal Data may be transferred. We will provide notice before Your Personal Data is transferred and becomes subject to a different Privacy Policy.",
                          style: FlutterFlowTheme.of(context).bodySmall,
                          textAlign: TextAlign.justify,
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          "Other legal requirements",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.w600),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "The Company may disclose Your Personal Data in the good faith belief that such action is necessary to:",
                          style: FlutterFlowTheme.of(context).bodySmall,
                          textAlign: TextAlign.justify,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "      • Comply with a legal obligation",
                          style: FlutterFlowTheme.of(context).bodySmall,
                          textAlign: TextAlign.justify,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "      • Protect and defend the rights or property of the Company",
                          style: FlutterFlowTheme.of(context).bodySmall,
                          textAlign: TextAlign.justify,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "      • Prevent or investigate possible wrongdoing in connection with the Service",
                          style: FlutterFlowTheme.of(context).bodySmall,
                          textAlign: TextAlign.justify,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "      • Protect the personal safety of Users of the Service or the public",
                          style: FlutterFlowTheme.of(context).bodySmall,
                          textAlign: TextAlign.justify,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "      • Protect against legal liability",
                          style: FlutterFlowTheme.of(context).bodySmall,
                          textAlign: TextAlign.justify,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "Security of Your Personal Data",
                          style: FlutterFlowTheme.of(context).displaySmall,
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          "The security of Your Personal Data is important to Us, but remember that no method of transmission over the Internet, or method of electronic storage is 100% secure. While We strive to use commercially acceptable means to protect Your Personal Data, We cannot guarantee its absolute security.",
                          style: FlutterFlowTheme.of(context).bodySmall,
                          textAlign: TextAlign.justify,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "Contact Us",
                          style: FlutterFlowTheme.of(context).displaySmall,
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          "If you have any questions about this Privacy Policy, You can contact us:",
                          style: FlutterFlowTheme.of(context).bodySmall,
                          textAlign: TextAlign.justify,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "      • By email: "+data["email_id"],
                          style: FlutterFlowTheme.of(context).bodySmall,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "      • By phone number: "+data["phone_number"],
                          style: FlutterFlowTheme.of(context).bodySmall,
                        ),
                        SizedBox(
                          height: 40,
                        ),
                      ],
                    ),
                  );
                }

                return Center(child: CircularProgressIndicator());
              }),
        ),
      ),
    );
  }
}
