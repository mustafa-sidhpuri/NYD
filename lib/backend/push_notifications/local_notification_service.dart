import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import '../backend.dart';


class LocalNotificationService {
  static final FlutterLocalNotificationsPlugin _notificationsPlugin =
      FlutterLocalNotificationsPlugin();

  static void initialize() {
    // initializationSettings  for Android and ios
    InitializationSettings initializationSettings = InitializationSettings(
        android: AndroidInitializationSettings("@drawable/ic_notification"),
        iOS: DarwinInitializationSettings(
            requestAlertPermission: true,
            requestBadgePermission: true,
            requestSoundPermission: true,
            onDidReceiveLocalNotification: (int id, String? title, String? body,
                String? payload) async {}));

    _notificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: (id) async {
        print("onSelectNotification");
      },
    );
  }

  static void createanddisplaynotification(RemoteMessage message) async {
    // Notification Dialog for Android and ios
    try {
      final id = DateTime.now().millisecondsSinceEpoch ~/ 1000;
      const NotificationDetails notificationDetails = NotificationDetails(
          android: AndroidNotificationDetails(
            "freefoodapp",
            "freefoodappchannel",
            importance: Importance.max,
            color: Colors.white,
            icon:"@drawable/ic_notification",
            priority: Priority.high,
          ),
          iOS: DarwinNotificationDetails());

      await _notificationsPlugin.show(
        id,
        message.notification!.title,
        message.notification!.body,
        notificationDetails,
        payload: message.data['_id'],
      );
    } on Exception catch (e) {
      print(e);
    }
  }
}
