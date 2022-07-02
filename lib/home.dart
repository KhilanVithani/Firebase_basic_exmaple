import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_example/helper.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);


  Widget build(BuildContext context) {
    AuthService authservice = AuthService();
    final currentUser = FirebaseAuth.instance;
    return Scaffold(
      drawer: Drawer(
        child: Column(
          children: [
            StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection('user')
                  .where("uid", isEqualTo: currentUser.currentUser!.uid)
                  .snapshots(),
              builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                      itemCount: snapshot.data!.docs.length,
                      shrinkWrap: true,
                      itemBuilder: (context, i) {
                        var data = snapshot.data!.docs[i];
                        return UserAccountsDrawerHeader(
                            accountName: Text(data['name']),
                            accountEmail: Text(data['email']));
                      });
                } else {
                  return CircularProgressIndicator();
                }
              },
            )
          ],
        ),
      ),
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              authservice.logOutUser(context);
            },
            icon: Icon(Icons.logout_rounded),
          ),
        ],
      ),
      body: Center(
        child: Text('Home Page'),
      ),
    );
  }
}
