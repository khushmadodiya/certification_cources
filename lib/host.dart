import 'package:certification_cources/HomeScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'cources.dart';



class Host extends StatefulWidget{
  final HomeScreen homeScreen;
  final Cources cource;

  Host({
    required this.homeScreen,
    required this.cource,
  });
  @override
  State<Host> createState() => _HostState();
}

class _HostState extends State<Host> {
  final _formKey = GlobalKey<FormState>();
  final courcecontroller = TextEditingController();
  final youtubecontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(title: Text('Add Cource'),),
     body: Center(
       child: Container(
         width: 350,
         height: 600,

         decoration: BoxDecoration(

             borderRadius: BorderRadius.circular(20)
         ),
         child: Form(
           key: _formKey,
           child:  Column(
             children: [
               TextFormField(
                 inputFormatters: [
                   LengthLimitingTextInputFormatter(50)
                 ],
                 decoration: InputDecoration(
                   hintText: "Enter Cource Name",
                   hintStyle: TextStyle(
                       color: Colors.grey.shade800,
                       fontSize: 20
                   ),
                   filled: true,

                   prefixIcon: Icon(Icons.person),
                 ),
                 autovalidateMode: AutovalidateMode.onUserInteraction,
                 validator: (text){
                   if(text==null || text.isEmpty){
                     return 'Cource name can\'t be empty';
                   }

                 },
                 onChanged: (text)=>setState(() {

                   courcecontroller.text =text;
                 }),
               ),
               SizedBox(height: 15,),
               TextFormField(
                 inputFormatters: [
                   LengthLimitingTextInputFormatter(50)
                 ],
                 decoration: InputDecoration(
                   hintText: "Youtube video url (make sure accept only youtube url)",

                   hintStyle: TextStyle(
                       color: Colors.grey.shade800,
                       fontSize: 20

                   ),
                   filled: true,
                   prefixIcon: const Icon(Icons.password),
                 ),
                 autovalidateMode: AutovalidateMode.onUserInteraction,
                 validator: (text){
                   if(text==null || text.isEmpty){
                     return 'url can\'t be empty';
                   }

                 },
                 onChanged: (text)=>setState(() {

                   youtubecontroller.text =text;
                 }),
               ),
               SizedBox(height: 25,),
               ElevatedButton(
                   onPressed:(){
                     if(_formKey.currentState!.validate()){
                       widget.homeScreen.addtitle(courcecontroller.text.toString());
                       widget.cource.addcource(youtubecontroller.text.toString());
                       Navigator.pop(context);
                     }
                   },
                   child: Text("Submit")),


             ],
           ),
         ),
       ),
     ),
   );
  }
}

