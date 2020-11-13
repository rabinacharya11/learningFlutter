import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
// import 'package:rabin/main.dart';
// import 'package:toast/toast.dart';

class Home extends StatelessWidget {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    backgroundColor: Colors.red,
    appBar: AppBar(
      automaticallyImplyLeading: false,
      title: ListTile(leading: Icon(Icons.home), title: Text("Be Home", style: TextStyle(
        fontSize: 20
      ),),),
      
      actions: [
        IconButton(icon: Icon(Icons.login_sharp), onPressed: (){


        })
      ],
    ),
    bottomNavigationBar: BottomNavigationBar(
      type:BottomNavigationBarType.shifting ,
      
      
      items: [
        
      BottomNavigationBarItem(icon: Icon(Icons.home), label:"Home" ,
      backgroundColor: Colors.black
      ),
       BottomNavigationBarItem(icon: Icon(Icons.person), label: "Account"
      ),
        BottomNavigationBarItem(icon: Icon(Icons.message), label: "Chats"
      ),

  BottomNavigationBarItem(icon: Icon(Icons.more_horiz), label: "Earn"
      ),


  

    ]),
       );
    
  }
}
