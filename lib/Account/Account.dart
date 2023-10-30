import 'dart:async';

import 'package:certification_cources/HomeScreen.dart';
import 'package:certification_cources/auth/SingUp.dart';
import 'package:certification_cources/host.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../Firebase_services/splesh.dart';
import '../auth/login_screen.dart';
import '../cources.dart';

class Account extends StatefulWidget{
  final int index;
  @override
  Account({required this.index});
  @override
  State<Account> createState() => _AccountState();
}

class _AccountState extends State<Account> {
  SpleshServices spleshscreen = SpleshServices();
  void checkLoginStatus() async {
    bool isLoggedIn = await spleshscreen.isLogin(context);

    if (isLoggedIn) {
      // User is logged in, navigate to the home screen.
      Timer(const Duration(seconds: 1),()=>Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>HomeScreen())));
      Fluttertoast.showToast(msg: "Already LogIn");
      // Change '/home' to your home screen route.
    } else {
      // User is not logged in, you can navigate to the login or sign-up screen.
      Timer(const Duration(seconds:1),()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginScreen())));
      Fluttertoast.showToast(msg: "Switching to Login Screen");
      // Change '/login' to your login screen route.
    }
  }
  Future<void> signOut() async {
    try {
      await FirebaseAuth.instance.signOut();
      Fluttertoast.showToast(msg: "Successfully signed out");
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>HomeScreen()));
      // Successfully signed out
    } catch (e) {
      // Handle errors, if any
      print('Error signing out: $e');
      Fluttertoast.showToast(msg: 'Error signing out: $e');
    }
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
   return Scaffold(
     appBar: AppBar(
       title: Text('Profile'),
       backgroundColor: Theme.of(context).colorScheme.inversePrimary,
     ),
     body: Padding(
       padding: const EdgeInsets.all(8.0),
       child: Container(
         child:Center(
           child: Column(
             mainAxisAlignment: MainAxisAlignment.center,
             children: [
               ElevatedButton(
                 onPressed: (){
                   checkLoginStatus();
                 },
                 child: Padding(
                   padding: const EdgeInsets.all(8.0),
                   child: Text(
                     "LogIn"
                   ),
                 ),
               ),
               ElevatedButton(
                 onPressed: (){

                   Navigator.push(context, MaterialPageRoute(builder: (context)=>SignUpScreen()));
                 },
                 child: Padding(
                   padding: const EdgeInsets.all(8.0),
                   child: Text(
                       "SignUp"
                   ),
                 ),
               ),
               ElevatedButton(
                 onPressed: ()async{
                   await signOut();
                   Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeScreen()));
                 },
                 child: Padding(
                   padding: const EdgeInsets.all(8.0),
                   child: Text(
                       "LogOut"
                   ),
                 ),
               ),
               ElevatedButton(
                 onPressed: ()async{
                   await Navigator.push(context, MaterialPageRoute(builder: (context)=>Host(homeScreen: HomeScreen(), cource: Cources(index:widget.index ,))));
                 },
                 child: Padding(
                   padding: const EdgeInsets.all(8.0),
                   child: Text(
                       "Be a Host"
                   ),
                 ),
               ),
             ],
           ),
         ),
       ),
     ),
   );
  }
}