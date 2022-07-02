import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_example/Login.dart';
import 'package:firebase_example/adminpanal.dart';
import 'package:firebase_example/home.dart';
import 'package:firebase_example/main.dart';
import 'package:flutter/material.dart';

class AuthService {
  final auth = FirebaseAuth.instance;
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController adminEmail = TextEditingController();
  TextEditingController adminPassword = TextEditingController();
  String selectedURL = '';
  final firestore = FirebaseFirestore.instance;

  void loginUser(context) async {
    try {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Center(child: CircularProgressIndicator()),
            );
          });
      await auth
          .signInWithEmailAndPassword(
              email: email.text, password: password.text)
          .then((value) {
        print("user is Logged in");

        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => HomeScreen(),
            ),
            (route) => false);
      });
    } catch (e) {
      Navigator.pop(context);
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text('Error Message'),
              content: Text(e.toString()),
            );
          });
    }
  }

  void adminlogin(context) async {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Center(child: CircularProgressIndicator()),
          );
        });
    await FirebaseFirestore.instance
        .collection('admin')
        .doc('adminLogin')
        .snapshots()
        .forEach((element) {
      if (element.data()?['adminemail'] == adminEmail.text &&
          element.data()?['adminpassword'] == adminPassword.text) {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => AdminPanal(),
            ),
            (route) => false);
      }
    }).catchError((e) {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text('Error Message'),
              content: Text(e.toString()),
            );
          });
    });
  }

  void RegisterUser(context) async {
    try {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Center(child: CircularProgressIndicator()),
            );
          });
      await auth
          .createUserWithEmailAndPassword(
              email: email.text, password: password.text)
          .then((value) {
        print("user is Registerd");
        firestore.collection("user").add({
          "email": email.text,
          "name": name.text,
          "image": selectedURL,
          "password": password.text,
          "uid": auth.currentUser!.uid
        });
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => HomeScreen(),
            ));
      });
    } catch (e) {
      Navigator.pop(context);
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text('Error Message'),
              content: Text(e.toString()),
            );
          });
    }
  }

  void logOutUser(context) async {
    await auth.signOut();
    Navigator.pushAndRemoveUntil(
        context, MaterialPageRoute(builder: (c) => Login()), (route) => false);
  }
}
