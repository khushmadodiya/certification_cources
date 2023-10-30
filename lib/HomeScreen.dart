import 'dart:async';

import 'package:certification_cources/Account/Account.dart';
import 'package:certification_cources/auth/login_screen.dart';
import 'package:certification_cources/cources.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'Firebase_services/splesh.dart';

class HomeScreen extends StatefulWidget{
  HomeScreen({super.key});
  var Arrtitle = ['Cpp','Java','Python','C','HTML','CSS','Java Script','PHP','DBMS','Flutter','React Native'];
  void addtitle(String a)async {
    Arrtitle.add(a);
    for(int i=0; i<Arrtitle.length;i++){
      print(Arrtitle[i]);
    }
  }

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  SpleshServices spleshscreen = SpleshServices();
  void checkLoginStatus(int index) async {
    bool isLoggedIn = await spleshscreen.isLogin(context);

    if (isLoggedIn) {
      // User is logged in, navigate to the home screen.
      Timer(const Duration(seconds: 1),()=>Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Cources(index: index,))));// Change '/home' to your home screen route.
    } else {
      // User is not logged in, you can navigate to the login or sign-up screen.
      Timer(const Duration(seconds:1),()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginScreen()))); // Change '/login' to your login screen route.
    }
  }


  // final int indexx;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
         appBar: AppBar(
           title: Row(
             children: [
               InkWell(
                 child: CircleAvatar(
                   radius: 20,
                   backgroundImage:AssetImage('assets/Images/p.png'),
                 ),
                 onTap: (){
                 Navigator.push(context, MaterialPageRoute(builder: (context)=>Account(index: widget.Arrtitle.length,)));
                 },
               ),
               SizedBox(width: 20,),
               Text('Certification Cources'),

             ],

           ),
           actions: [
             IconButton(onPressed: (){
                setState(() {
                  HomeScreen();
                });
             }, icon: Icon(Icons.refresh_outlined))

           ],
           backgroundColor: Theme.of(context).colorScheme.inversePrimary,
           automaticallyImplyLeading: false,

         ),
         body: Container(
              child: Padding(
                padding: const EdgeInsets.only(left: 8,top: 15,bottom: 15,right: 8),
                child: ListView.separated(
                    itemBuilder: (context, index){
                      return ListTile(
                        leading: CircleAvatar(
                          radius: 30,
                          backgroundImage:AssetImage('assets/Images/logo.png'),
                        ),
                        title:Text(widget.Arrtitle[index]+" Cource" ,style: TextStyle(fontSize: 13,fontWeight: FontWeight.w400),) ,
                        trailing: ElevatedButton(
                          onPressed: ()async{
                            setState(() {
                              checkLoginStatus(index);
                            });
                          },
                              child: Text('Join Cource',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 10),),

                        ),
                      );
                    },
                    separatorBuilder: (context, index){
                      return const Divider(
                        thickness: 2,
                        height: 40,
                      );
                    },
                    itemCount: widget.Arrtitle.length
                ),
              ),
         ),
    );
  }
}