import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:commerceapp/database/signUp.dart';
import 'package:commerceapp/main.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:commerceapp/add_product_page.dart';

import '../reusable_widgets/reusable_widget.dart';


class Profile extends StatelessWidget {
  Profile({Key? key}) : super(key: key);

  void SignOut() {

    FirebaseAuth.instance.signOut();
    //yassine@gmail.com
    //y123456
  }

  final user = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        actions: [
          IconButton(onPressed: () async {
            await FirebaseAuth.instance.signOut();
            Navigator.push(context, MaterialPageRoute(builder:(context)=> MyApp()));
          }, icon: Icon(Icons.logout_rounded))
        ],
        title: Text('Profile'),
        centerTitle: true,
      ),
      body: Center(child: Text("Email :"+ user.email!)),

    );
  }

}
