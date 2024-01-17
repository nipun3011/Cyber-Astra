import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyCHmlZu_J9leEXpZBfntt7Be2vqpjASxW8",
            authDomain: "trial-rwwf79.firebaseapp.com",
            projectId: "trial-rwwf79",
            storageBucket: "trial-rwwf79.appspot.com",
            messagingSenderId: "43042652460",
            appId: "1:43042652460:web:de5044477dcdf542996c89"));
  } else {
    await Firebase.initializeApp();
  }
}
