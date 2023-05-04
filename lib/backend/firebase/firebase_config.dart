import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyB5JNWYWelKla6ZwUNtDgl6IP4Lk62TH7Y",
            authDomain: "nyd-app.firebaseapp.com",
            projectId: "nyd-app",
            storageBucket: "nyd-app.appspot.com",
            messagingSenderId: "672578937697",
            appId: "1:672578937697:web:968285ad41266cbf735b20",
            measurementId: "G-24MR6PHZRD"));
  } else {
    await Firebase.initializeApp();
  }
}
