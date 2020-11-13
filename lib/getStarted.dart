import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'Login.dart';
import 'SignUp.dart';
class GetStarted extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    FirebaseAuth.instance
  .authStateChanges()
  .listen((User user) {
    if (user == null) {
      print('User is currently signed out!');
    } else {
      print('User is signed in!');
    }
  });
 
    return Container(
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  colors: [Colors.red, Colors.blue])),
                          child: Scaffold(
                            backgroundColor: Colors.blue,
                            body: SafeArea(
                              child: Center(
                                child: Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Center(
                                        child: Container(
                                          child: Icon(
                                            Icons.people_rounded,
                                            size: 90,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Center(
                                        child: RaisedButton(
                                            onPressed: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          LoginPage()));
                                            }, //here set the code to make the user navigate to the login in Screen
                                            child: Expanded(
                                              child: Container(
                                                width: 250,
                                                child: ListTile(
                                                  leading: Icon(Icons.person),
                                                  title: Text(
                                                    "Log In",
                                                    style:
                                                        TextStyle(fontSize: 20),
                                                  ),
                                                ),
                                              ),
                                            )),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      RaisedButton(
                                        onPressed: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      SignUpPage()));
                                        },
                                        child: Expanded(
                                          child: Container(
                                            width: 250,
                                            child: ListTile(
                                              leading: Icon(Icons.person),
                                              title: Text(
                                                "Sign Up",
                                                style: TextStyle(fontSize: 20),
                                              ),
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ));
  }
}