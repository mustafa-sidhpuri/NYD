import 'dart:async';
import 'dart:convert';

import 'serialization_util.dart';
import '../backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

import '../../index.dart';
import '../../main.dart';

final _handledMessageIds = <String?>{};

class PushNotificationsHandler extends StatefulWidget {
  const PushNotificationsHandler({Key? key, required this.child})
      : super(key: key);

  final Widget child;

  @override
  _PushNotificationsHandlerState createState() =>
      _PushNotificationsHandlerState();
}

class _PushNotificationsHandlerState extends State<PushNotificationsHandler> {
  bool _loading = false;

  Future handleOpenedPushNotification() async {
    if (isWeb) {
      return;
    }

    final notification = await FirebaseMessaging.instance.getInitialMessage();
    if (notification != null) {
      await _handlePushNotification(notification);
    }
    FirebaseMessaging.onMessageOpenedApp.listen(_handlePushNotification);
  }

  Future _handlePushNotification(RemoteMessage message) async {
    if (_handledMessageIds.contains(message.messageId)) {
      return;
    }
    _handledMessageIds.add(message.messageId);

    if (mounted) {
      setState(() => _loading = true);
    }
    try {
      final initialPageName = message.data['initialPageName'] as String;
      final initialParameterData = getInitialParameterData(message.data);
      final pageBuilder = pageBuilderMap[initialPageName];
      if (pageBuilder != null) {
        final page = await pageBuilder(initialParameterData);
        await Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => page),
        );
      }
    } catch (e) {
      print('Error: $e');
    } finally {
      if (mounted) {
        setState(() => _loading = false);
      }
    }
  }

  @override
  void initState() {
    super.initState();
    handleOpenedPushNotification();
  }

  @override
  Widget build(BuildContext context) => _loading
      ? Container(
          color: Colors.transparent,
          child: Image.asset(
            'assets/images/splashScreen@2x.png',
            fit: BoxFit.cover,
          ),
        )
      : widget.child;
}

final pageBuilderMap = <String, Future<Widget> Function(Map<String, dynamic>)>{
  'login': (data) async => LoginWidget(),
  'createAccount': (data) async => CreateAccountWidget(),
  'sellingPage': (data) async => NavBarPage(initialPage: 'sellingPage'),
  'chatMain': (data) async => NavBarPage(initialPage: 'chatMain'),
  'profilePage': (data) async => NavBarPage(initialPage: 'profilePage'),
  'editProfile': (data) async => EditProfileWidget(
        userProfile: await getDocumentParameter(
            data, 'userProfile', UsersRecord.serializer),
      ),
  'forgotPassword': (data) async => ForgotPasswordWidget(),
  'AddProduct': (data) async => NavBarPage(initialPage: 'AddProduct'),
  'ProductDetails': (data) async => ProductDetailsWidget(
        productData: await getDocumentParameter(
            data, 'productData', PostsRecord.serializer),
        productId: getParameter(data, 'productId'),
      ),
  'AddProductDetail': (data) async => AddProductDetailWidget(
        productName: getParameter(data, 'productName'),
        productDescription: getParameter(data, 'productDescription'),
        images: [],
      ),
  'PublicProfile': (data) async => PublicProfileWidget(),
  'chatDetails': (data) async => ChatDetailsWidget(
        username: getParameter(data, 'username'),
        productname: getParameter(data, 'productname'),
        profileimage: getParameter(data, 'profileimage'),
        productimage: getParameter(data, 'productimage'),
        productlocation: getParameter(data, 'productlocation'),
        userRef: getParameter(data, 'userRef'),
      ),
  'productEdit': (data) async => ProductEditWidget(
        productData: await getDocumentParameter(
            data, 'productData', PostsRecord.serializer),
      ),
  'pickUpProduct': (data) async => PickUpProductWidget(
        pickupProductDoc: await getDocumentParameter(
            data, 'pickupProductDoc', PostsRecord.serializer),
      ),
  'HomeWithFilter': (data) async => HomeWithFilterWidget(),
};

bool hasMatchingParameters(Map<String, dynamic> data, Set<String> params) =>
    params.any((param) => getParameter(data, param) != null);

Map<String, dynamic> getInitialParameterData(Map<String, dynamic> data) {
  try {
    final parameterDataStr = data['parameterData'];
    if (parameterDataStr == null ||
        parameterDataStr is! String ||
        parameterDataStr.isEmpty) {
      return {};
    }
    return jsonDecode(parameterDataStr) as Map<String, dynamic>;
  } catch (e) {
    print('Error parsing parameter data: $e');
    return {};
  }
}
