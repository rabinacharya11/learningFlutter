import 'package:flutter/material.dart';
import 'package:rabin/Login.dart';
import 'package:rabin/SignUp.dart';

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
    return Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [Colors.red, Colors.blue])),
        child: Scaffold(
          backgroundColor: Colors.blue,
          body: SafeArea(
            child: Center(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
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
                                    builder: (context) => LoginPage()));
                          }, //here set the code to make the user navigate to the login in Screen
                          child: Expanded(
                            child: Container(
                              width: 250,
                              child: ListTile(
                                leading: Icon(Icons.person),
                                title: Text(
                                  "Log In",
                                  style: TextStyle(fontSize: 20),
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
                                builder: (context) => SignUpPage()));
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
