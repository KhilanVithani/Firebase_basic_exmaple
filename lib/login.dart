import 'package:firebase_example/adminlogin.dart';
import 'package:firebase_example/helper.dart';
import 'package:firebase_example/register.dart';
import 'package:flutter/material.dart';

class Login extends StatelessWidget {
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
              "Login Your Account",
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 15,
            ),
            TextField(
              controller: authservice.email,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                  labelText: "E-mail",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(18))),
            ),
            SizedBox(
              height: 15,
            ),
            TextField(
              controller: authservice.password,
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
                  authservice.loginUser(context);
                }
              },
              child: Text("Login"),
            ),
            TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Register(),
                      ));
                },
                child: Text("Don't Have An Account?Register")),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AdminLogin(),
                        ));
                  },
                  child: Text("GoTo Admin Acount")),
            )
          ],
        ),
      ),
    );
  }
}
