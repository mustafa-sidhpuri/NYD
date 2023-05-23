import 'package:n_y_d_app/components/cached_network_image.dart';

import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/upload_data.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'edit_profile_model.dart';
export 'edit_profile_model.dart';

class EditProfileWidget extends StatefulWidget {
  const EditProfileWidget({
    Key? key,
    this.userProfile,
  }) : super(key: key);

  final UsersRecord? userProfile;

  @override
  _EditProfileWidgetState createState() => _EditProfileWidgetState();
}

class _EditProfileWidgetState extends State<EditProfileWidget> {
  // late EditProfileModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';
  TextEditingController nameController = TextEditingController();
  TextEditingController emailAddressController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  final _unfocusNode = FocusNode();
  String? Function(BuildContext, String?)? nameControllerValidator;

  String? Function(BuildContext, String?)? emailAddressControllerValidator;

  String? Function(BuildContext, String?)? phoneControllerValidator;
  @override
  void initState() {
    super.initState();
    // _model = createModel(context, () => EditProfileModel());

    nameController = TextEditingController(text: currentUserDisplayName);
    emailAddressController = TextEditingController(text: currentUserEmail);
    phoneController = TextEditingController(text: currentPhoneNumber);
  }

  @override
  void dispose() {
    //_model.dispose();
    _unfocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return StreamBuilder<UsersRecord>(
      stream: UsersRecord.getDocument(currentUserReference!),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Center(
            child: SizedBox(
              width: 50.0,
              height: 50.0,
              child: CircularProgressIndicator(
                color: FlutterFlowTheme.of(context).primary,
              ),
            ),
          );
        }
        final editProfileUsersRecord = snapshot.data!;
        return GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
            body: SafeArea(
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(22.0, 0.0, 22.0, 0.0),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 30.0, 0.0, 0.0),
                        child: Row(
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
                                size: 27.0,
                              ),
                            ),
                            Text(
                              'Edit Profile',
                              style: FlutterFlowTheme.of(context).headlineSmall,
                            ),
                            InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                final usersUpdateData = createUsersRecordData(
                                  displayName: nameController.text,
                                  email: emailAddressController.text,
                                  phoneNumber: phoneController.text,
                                  userAddress: FFAppState().setLocation,
                                  photoUrl: uploadedFileUrl,
                                );
                                await editProfileUsersRecord.reference
                                    .update(usersUpdateData);
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      'Update Profile SuccessFully',
                                      style: FlutterFlowTheme.of(context)
                                          .labelLarge
                                          .override(
                                            fontFamily: 'Roboto',
                                            color: FlutterFlowTheme.of(context)
                                                .darkText,
                                          ),
                                    ),
                                    duration: Duration(milliseconds: 4000),
                                    backgroundColor:
                                        FlutterFlowTheme.of(context).primary,
                                  ),
                                );
                                Navigator.pop(context);
                              },
                              child: Text(
                                'Save',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Roboto',
                                      color: FlutterFlowTheme.of(context).primary,
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          uploadedFileUrl = currentUserPhoto;
                          final selectedMedia =
                              await selectMediaWithSourceBottomSheet(
                            context: context,
                            imageQuality: 100,
                            allowPhoto: true,
                            backgroundColor:
                                FlutterFlowTheme.of(context).tertiary,
                            textColor: Colors.black,
                            pickerFontFamily: 'Roboto',
                          );
                          if (selectedMedia != null &&
                              selectedMedia.every((m) =>
                                  validateFileFormat(m.storagePath, context))) {
                            setState(() => isDataUploading = true);
                            var selectedUploadedFiles = <FFUploadedFile>[];
                            var downloadUrls = <String>[];
                            try {
                              showUploadMessage(
                                context,
                                'Uploading file...',
                                showLoading: true,
                              );
                              selectedUploadedFiles = selectedMedia
                                  .map((m) => FFUploadedFile(
                                        name: m.storagePath.split('/').last,
                                        bytes: m.bytes,
                                        height: m.dimensions?.height,
                                        width: m.dimensions?.width,
                                        blurHash: m.blurHash,
                                      ))
                                  .toList();

                              downloadUrls = (await Future.wait(
                                selectedMedia.map(
                                  (m) async =>
                                      await uploadData(m.storagePath, m.bytes),
                                ),
                              ))
                                  .where((u) => u != null)
                                  .map((u) => u!)
                                  .toList();
                            } finally {
                              ScaffoldMessenger.of(context).hideCurrentSnackBar();
                              isDataUploading = false;
                            }
                            if (selectedUploadedFiles.length ==
                                    selectedMedia.length &&
                                downloadUrls.length == selectedMedia.length) {
                              setState(() {
                                uploadedLocalFile = selectedUploadedFiles.first;
                                uploadedFileUrl = downloadUrls.first;
                              });
                              showUploadMessage(context, 'Success!');
                            } else {
                              setState(() {});
                              showUploadMessage(context, 'Failed to upload data');
                              return;
                            }
                            final usersUpdateData = createUsersRecordData(
                              photoUrl: uploadedFileUrl,
                            );
                            await editProfileUsersRecord.reference
                                .update(usersUpdateData);
                          }
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color:
                                FlutterFlowTheme.of(context).secondaryBackground,
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 20.0, 0.0, 0.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    AuthUserStreamWidget(
                                      builder: (context) => Container(
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(22.0),
                                            border:
                                                Border.all(color: Colors.grey)),
                                        child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(22.0),
                                            child: CachedNetworkImageWidget(
                                              image: currentUserPhoto,
                                              height: 100,
                                              width: 100,
                                            )),
                                      ),

                                      // Image.network(
                                      //   valueOrDefault<String>(
                                      //
                                      //     'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/wedding-app-anuwld/assets/udoiek8lgxbr/userUpload@2x.png',
                                      //   ),
                                      //
                                      //   fit: BoxFit.cover,
                                      // ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 8.0, 0.0, 28.0),
                                child: Text(
                                  'Edit profile picture',
                                  style: FlutterFlowTheme.of(context)
                                      .labelLarge
                                      .override(
                                        fontFamily: 'Roboto',
                                        color:
                                            FlutterFlowTheme.of(context).primary,
                                      ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 16.0),
                        child: AuthUserStreamWidget(
                          builder: (context) => TextFormField(
                            cursorColor: Colors.grey,
                            textInputAction: TextInputAction.done,
                            controller: nameController,
                            textCapitalization: TextCapitalization.words,
                            obscureText: false,
                            decoration: InputDecoration(
                              labelText: 'Name',
                              labelStyle: FlutterFlowTheme.of(context).bodyMedium,
                              hintText: 'Your full name...',
                              hintStyle: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 14
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).lineGray,
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).lineGray,
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).error,
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).error,
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              filled: true,
                              fillColor: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              contentPadding: EdgeInsetsDirectional.fromSTEB(
                                  20.0, 24.0, 0.0, 24.0),
                            ),
                            style: FlutterFlowTheme.of(context).titleSmall,
                            validator:
                                nameControllerValidator.asValidator(context),
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 2.0, 12.0),
                        child: TextFormField(
                          cursorColor: Colors.grey,
                          textInputAction: TextInputAction.done,
                          controller: emailAddressController,
                          obscureText: false,
                          decoration: InputDecoration(
                            labelText: 'Email Address',
                            labelStyle: FlutterFlowTheme.of(context).bodyMedium,
                            hintText: 'Your email..',
                            hintStyle: TextStyle(
                                color: Colors.grey,
                                fontSize: 14
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).lineGray,
                                width: 2.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).lineGray,
                                width: 2.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).error,
                                width: 2.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).error,
                                width: 2.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            filled: true,
                            fillColor:
                                FlutterFlowTheme.of(context).secondaryBackground,
                            contentPadding: EdgeInsetsDirectional.fromSTEB(
                                20.0, 24.0, 0.0, 24.0),
                          ),
                          style: FlutterFlowTheme.of(context).titleSmall,
                          validator: emailAddressControllerValidator
                              .asValidator(context),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 12.0),
                        child: AuthUserStreamWidget(

                          builder: (context) => TextFormField(
                            cursorColor: Colors.grey,
                            textInputAction: TextInputAction.done,
                            controller: phoneController,
                            obscureText: false,
                            decoration: InputDecoration(
                              labelText: 'Phone Number',
                              labelStyle: FlutterFlowTheme.of(context).bodyMedium,
                              hintText: 'Enter Your Phone Number ...',
                              hintStyle: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 14
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0xFFE1EDF9),
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).lineGray,
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).error,
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).error,
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              filled: true,
                              fillColor: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              contentPadding: EdgeInsetsDirectional.fromSTEB(
                                  20.0, 24.0, 0.0, 24.0),
                            ),
                            style: FlutterFlowTheme.of(context).titleSmall,
                            keyboardType: TextInputType.number,
                            validator:
                                phoneControllerValidator.asValidator(context),
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(6.0, 0.0, 0.0, 6.0),
                        child: Text(
                          'Address',
                          style:
                              FlutterFlowTheme.of(context).labelMedium.override(
                                    fontFamily: 'Roboto',
                                    color: Color(0xFF7D8180),
                                  ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(12),
                        //height: 60.0,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).secondaryBackground,
                          borderRadius: BorderRadius.circular(12.0),
                          border: Border.all(
                            color: Color(0xFFE1EDF9),
                          ),
                        ),
                        child: Padding(
                          padding:
                              EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Flexible(
                                child: Text(
                                  FFAppState().setLocation,
                                  maxLines: 10,
                                  overflow: TextOverflow.ellipsis,
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Roboto',
                                        fontSize: 16.0,
                                      ),
                                ),
                              ),
                              Icon(
                                Icons.location_on_outlined,
                                color: Colors.black,
                                size: 24.0,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
