import 'package:firebase_example/Login.dart';
import 'package:firebase_example/helper.dart';
import 'package:flutter/material.dart';

class AdminLogin extends StatelessWidget {
  AuthService authservice = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 18, horizontal: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Login Admin Account",
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 15,
            ),
            TextField(
              controller: authservice.adminEmail,
              decoration: InputDecoration(
                  labelText: "E-mail",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(18))),
            ),
            SizedBox(
              height: 15,
            ),
            TextField(
              controller: authservice.adminPassword,
              decoration: InputDecoration(
                  labelText: "Password",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(18))),
            ),
            SizedBox(
              height: 15,
            ),
            ElevatedButton(
              style: TextButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 78)),
              onPressed: () {
                if (authservice.email != "" && authservice.password != "") {
                  authservice.adminlogin(context);
                }
              },
              child: Text("Login"),
            ),
            TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Login(),
                      ));
                },
                child: Text("Not Admin?")),
          ],
        ),
      ),
    );
  }
}
