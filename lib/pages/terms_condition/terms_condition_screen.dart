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
          child: SingleChildScrollView(
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
                          style: FlutterFlowTheme.of(context).headlineSmall,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  "Terms and Conditions for Food Sharing App",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Welcome to Food Share, a food sharing app connecting users who wish to share and exchange homemade meals or raw grocery items for free or in exchange with an item of their need. These terms and conditions ('Terms') govern your use of the Food Share mobile application and related services provided by Food Share Team. By accessing or using the app, you agree to be bound by these Terms. If you do not agree with these Terms, please do not use the app.",
                  style: FlutterFlowTheme.of(context).bodySmall,
                  textAlign: TextAlign.justify,
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  "Eligibility and User Accounts",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  "1.1. To use the app, you must be at least 18 years old or have the legal capacity to enter into a binding agreement.",
                  style: FlutterFlowTheme.of(context).bodySmall,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "1.2. You agree to provide accurate and complete information when creating your user account and to keep your account information updated.",
                  style: FlutterFlowTheme.of(context).bodySmall,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "1.3. You are responsible for maintaining the confidentiality of your account login credentials and for any activity that occurs under your account.",
                  style: FlutterFlowTheme.of(context).bodySmall,
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  "Food Sharing Listings",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  "2.1. Food Share allows users to create listings to share homemade meals or raw grocery items with other users.",
                  style: FlutterFlowTheme.of(context).bodySmall,
                  textAlign: TextAlign.justify,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "2.2. You represent and warrant that any food you offer for sharing complies with all applicable laws and regulations, including health and safety standards.",
                  style: FlutterFlowTheme.of(context).bodySmall,
                  textAlign: TextAlign.justify,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "2.3. You are solely responsible for the accuracy, quality, and safety of the food you offer and for complying with any dietary restrictions, allergies, or preferences disclosed by the recipients.",
                  style: FlutterFlowTheme.of(context).bodySmall,
                  textAlign: TextAlign.justify,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "2.4. Food Share does not assume any responsibility for the quality, safety, or suitability of the food shared through the app. Users engage in food sharing at their own risk.",
                  style: FlutterFlowTheme.of(context).bodySmall,
                  textAlign: TextAlign.justify,
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  "User Conduct",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "3.1. You agree to use the app in compliance with all applicable laws and regulations.",
                  style: FlutterFlowTheme.of(context).bodySmall,
                  textAlign: TextAlign.justify,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "3.2. You agree not to engage in any unlawful, abusive, harmful, or fraudulent activities, including misrepresenting the quality or nature of the food you offer.",
                  style: FlutterFlowTheme.of(context).bodySmall,
                  textAlign: TextAlign.justify,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "3.3. You acknowledge that Food Share has the right, but not the obligation, to monitor user activity and content, and may take appropriate action if violations of these Terms or applicable laws are detected.",
                  style: FlutterFlowTheme.of(context).bodySmall,
                  textAlign: TextAlign.justify,
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  "Intellectual Property Rights",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "4.1. All intellectual property rights in the app, including trademarks, logos, and content, are owned by Food Share or its licensors.",
                  style: FlutterFlowTheme.of(context).bodySmall,
                  textAlign: TextAlign.justify,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "4.2. You are granted a limited, non-exclusive, non-transferable license to use the app for its intended purposes.",
                  style: FlutterFlowTheme.of(context).bodySmall,
                  textAlign: TextAlign.justify,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "4.3. You agree not to reproduce, modify, distribute, or create derivative works based on the app's content without obtaining our prior written permission.",
                  style: FlutterFlowTheme.of(context).bodySmall,
                  textAlign: TextAlign.justify,
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  "Privacy",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "5.1. We respect your privacy and handle your personal information in accordance with our Privacy Policy. By using the app, you consent to the collection, use, and disclosure of your information as described in the Privacy Policy.",
                  style: FlutterFlowTheme.of(context).bodySmall,
                  textAlign: TextAlign.justify,
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  "Limitation of Liability",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "6.1. To the fullest extent permitted by law, Food Share disclaims all warranties and liability related to your use of the app.",
                  style: FlutterFlowTheme.of(context).bodySmall,
                  textAlign: TextAlign.justify,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "6.2. Food Share shall not be liable for any direct, indirect, incidental, consequential, or punitive damages arising out of or in connection with the app, including but not limited to damages for loss of profits, goodwill, or data.",
                  style: FlutterFlowTheme.of(context).bodySmall,
                  textAlign: TextAlign.justify,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "6.3. You agree to indemnify and hold Food Share harmless from any claims, liabilities, damages, losses, or expenses arising out of or in connection with your use of the app.",
                  style: FlutterFlowTheme.of(context).bodySmall,
                  textAlign: TextAlign.justify,
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  "Modifications and Termination",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "7.1. We reserve the right",
                  style: FlutterFlowTheme.of(context).bodySmall,
                  textAlign: TextAlign.justify,
                ),
                SizedBox(
                  height: 40,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
