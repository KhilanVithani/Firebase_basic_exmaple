import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_example/Login.dart';
import 'package:firebase_example/helper.dart';
import 'package:firebase_example/home.dart';
import 'package:firebase_example/register.dart';
import 'package:flutter/material.dart';

final auth = FirebaseAuth.instance;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: auth.currentUser == null ? Login() : HomeScreen(),
  ));
}
