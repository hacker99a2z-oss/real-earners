import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyAIIPvXSR5-iIf4dGzQ3o8oK45LgAytmQ8",
            authDomain: "real-earners-85abf.firebaseapp.com",
            projectId: "real-earners-85abf",
            storageBucket: "real-earners-85abf.firebasestorage.app",
            messagingSenderId: "921199948788",
            appId: "1:921199948788:web:3bc2924ae5396224b37fa1",
            measurementId: "G-ER2C7VSJB0"));
  } else {
    await Firebase.initializeApp();
  }
}
