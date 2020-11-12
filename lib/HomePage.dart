import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:rabin/main.dart';


class Home extends StatelessWidget {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
   return Center(
      child: RaisedButton(
          onPressed: () async {
            await firebaseAuth.signOut();
            print("Signed Out");
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => HomePage()));
          },
          child: Text("Sign Out")),
    );
  }
}

  