import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:rabin/HomePage.dart';
import 'package:rabin/Login.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _emailControl = TextEditingController();
  TextEditingController passwordControl = TextEditingController();
  TextEditingController confirmPasswordControl = TextEditingController();
  FirebaseAuth auth = FirebaseAuth.instance;

  Future<void> _createUser() async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: _emailControl.text, password: passwordControl.text);
    } on FirebaseAuthException catch (e) {
      if (e.code == "weak-password") {
        print(
            "the password you have entered is weak!"); //here ifpossible insert the alert dailog box printing the error message
      } else if (e.code == "email-already-in-use") {
        print(
            "The Email you have entered is already in use"); //here if possible insert the alert dialog box printing the error message
      }
    } catch (e) {
      print("$e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text(
          "Sign Up ",
          style: TextStyle(),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.bottomLeft,
                colors: [Colors.purple, Colors.green])),
        child: Center(
          child: Container(
            width: 300,
            height: 400,
            child: Card(
              color: Colors.blue,
              child: Form(
                autovalidateMode: AutovalidateMode.always,
                key: _formKey,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Icon(
                          Icons.people_sharp,
                          size: 80,
                          color: Colors.black,
                        ),
                        TextFormField(
                          cursorColor: Colors.black,
                          cursorHeight: 30,
                          controller: _emailControl,
                          validator: MultiValidator([
                            RequiredValidator(errorText: "Required*"),
                            EmailValidator(errorText: "Enter a valid email!"),
                          ]),
                          decoration: InputDecoration(
                              border: OutlineInputBorder(), labelText: "Email"),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          controller: passwordControl,
                          validator: MultiValidator([
                            RequiredValidator(errorText: "Required*"),
                            MinLengthValidator(6,
                                errorText:
                                    "Password must be 6 characters long!"),
                            MaxLengthValidator(15,
                                errorText:
                                    "Password must not exceed 15 characters")
                          ]),
                          obscureText: true,
                          cursorColor: Colors.black,
                          cursorHeight: 30,
                          decoration: InputDecoration(
                              fillColor: Colors.pink,
                              border: OutlineInputBorder(),
                              labelText: "Password"),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          cursorColor: Colors.black,
                          controller: confirmPasswordControl,
                          cursorHeight: 30,
                          validator: MultiValidator([
                            RequiredValidator(errorText: "Required*"),
                            MinLengthValidator(6,
                                errorText:
                                    "Password must be 6 characters long!"),
                            MaxLengthValidator(15,
                                errorText:
                                    "Password must not exceed 15 characters")
                          ]),
                          obscureText: true,
                          decoration: InputDecoration(
                              fillColor: Colors.pink,
                              border: OutlineInputBorder(),
                              labelText: "Confirm Password"),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        RaisedButton(
                          onPressed: () {
                            if (_formKey.currentState.validate()) {
                              _createUser();
                             Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LoginPage()));
                            }
                          },
                          child: Container(
                            width: 120,
                            child: ListTile(
                              trailing: Icon(Icons.login),
                              title: Text(
                                "Sign Up",
                                style: TextStyle(fontSize: 14),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text("or"),
                        SizedBox(
                          height: 5,
                        ),
                        RaisedButton(
                          onPressed: () {
                            
                            
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LoginPage()));
                          },
                          child: Container(
                            width: 120,
                            child: ListTile(
                              trailing: Icon(
                                Icons.login,
                                size: 20,
                              ),
                              title: Text(
                                "Log In",
                                style: TextStyle(fontSize: 14),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
