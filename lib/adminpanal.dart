import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_example/helper.dart';
import 'package:flutter/material.dart';

class AdminPanal extends StatelessWidget {
  const AdminPanal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AuthService authservice = AuthService();

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              authservice.logOutUser(context);
            },
            icon: Icon(Icons.logout_rounded),
          ),
        ],
        centerTitle: true,
        title: Text('Admin Panal'),
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('user').snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, i) {
                return Container(
                  width: 200,
                  height: 100,
                  margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  color: Colors.green.shade200,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text('Name: ' + snapshot.data!.docs[i]['name']),
                      SizedBox(
                        height: 10,
                      ),
                      Text('Email: ' + snapshot.data!.docs[i]['email']),
                    ],
                  ),
                );
              },
            );
          } else {
            return CircularProgressIndicator();
          }
        },
      ),
    );
  }
}
