import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() {

  WidgetsFlutterBinding.ensureInitialized();

  if(kIsWeb){
    Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyBN6iaIfzhu63gQi6pAPVAYRYTcjy0O5sw",
            authDomain: "crudapp-13822.firebaseapp.com",
            projectId: "crudapp-13822",
            storageBucket: "crudapp-13822.appspot.com",
            messagingSenderId: "104054234032",
            appId: "1:104054234032:web:9d10c90d2ec5a0e1929475",
            measurementId: "G-43LGKTYEZD"));
  } else {
    Firebase.initializeApp();
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
