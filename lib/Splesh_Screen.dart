import 'dart:async';

import 'package:certification_cources/HomeScreen.dart';
import 'package:certification_cources/auth/login_screen.dart';

import 'Firebase_services/splesh.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Splesh extends StatefulWidget{
  @override
  State<Splesh> createState() => _SpleshState();
}

class _SpleshState extends State<Splesh> {
  SpleshServices spleshscreen = SpleshServices();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
   checkLoginStatus();
  }
  void checkLoginStatus() async {
    bool isLoggedIn = await spleshscreen.isLogin(context);

    if (isLoggedIn) {
      // User is logged in, navigate to the home screen.
      Timer(const Duration(seconds: 2),()=>Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>HomeScreen())));// Change '/home' to your home screen route.
    } else {
      // User is not logged in, you can navigate to the login or sign-up screen.
      Timer(const Duration(seconds: 2),()=>Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>LoginScreen()))); // Change '/login' to your login screen route.
    }
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        // child: Text("Certification Cources",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
        child: Image.asset('assets/Images/logo.png'),
      ),
    );
  }
}
