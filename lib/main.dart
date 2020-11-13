import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
// import 'package:rabin/checkPoint.dart';
// import 'package:rabin/HomePage.dart';
// import 'package:rabin/Login.dart';
// import 'package:rabin/SignUp.dart';
import 'package:rabin/getStarted.dart';

import 'HomePage.dart';

void main() {
  runApp(MaterialApp(
    title: 'Rabin',
    debugShowCheckedModeBanner: false,
    home: HomePage(),
  ));
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Future<FirebaseApp> _initialization = Firebase.initializeApp();

    return FutureBuilder(
        // Initialize FlutterFire:
        future: _initialization,
        // ignore: missing_return
        builder: (context, snapshot) {
          // Check for errors
          if (snapshot.hasError) {
            return Scaffold(
              body: Text("Error : ${snapshot.error}"),
            );
          }
          if (snapshot.connectionState == ConnectionState.done) {
            return StreamBuilder(
                stream: FirebaseAuth.instance.authStateChanges(),
                // ignore: missing_return
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.active) {
                   return GetStarted();
                  }
                  return Center(
                      child: Container(
                          height: 30,
                          width: 30,
                          child: CircularProgressIndicator(
                            backgroundColor: Colors.red,
                          )));
                });
          }
        });
  }
}
