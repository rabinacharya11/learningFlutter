import 'package:flutter/material.dart';
import 'package:rabin/HomePage.dart';
import 'package:form_field_validator/form_field_validator.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  String _email;
  String _password;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text(
          "Login",
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
                        ),
                        TextFormField(
                          controller: _emailController,
                          onSaved: (value)=>_email,
                          validator: MultiValidator([
                            RequiredValidator(errorText: "Required*"),
                            EmailValidator(errorText: "Enter a valid email!")
                          ]),
                          decoration: InputDecoration(
                              border: OutlineInputBorder(), labelText: "Email"),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          controller: _passwordController,
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
                          onSaved: (value)=>_password,
                          decoration: InputDecoration(
                              fillColor: Colors.pink,
                              border: OutlineInputBorder(),
                              labelText: "Password"),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        RaisedButton(
                          onPressed: () {
                            if (_formKey.currentState.validate()) {
                             
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Home()));
                            }
                          },
                          child: Container(
                            width: 120,
                            child: ListTile(
                              trailing: Icon(Icons.login),
                              title: Text(
                                "Log In",
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
                            print(_emailController);
                          },
                          child: Container(
                            width: 120,
                            child: ListTile(
                              trailing: Icon(
                                Icons.login,
                                size: 20,
                              ),
                              title: Text(
                                "Sign Up",
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
