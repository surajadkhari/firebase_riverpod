import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'screen/Feedpage.dart';
import 'screen/userlist_page.dart';
import 'screen/welcome_screen.dart';

void main() async {
  //ensure binding
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();

  runApp(ProviderScope(child: (MyApp())));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Homepage(),
    );
  }
}
