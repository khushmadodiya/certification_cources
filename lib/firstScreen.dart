
import 'package:certification_cources/pdf.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UserName extends StatelessWidget{
  final namecontroller = TextEditingController();
  final courcecontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(
       title: Text("Certificate"),
       backgroundColor: Theme.of(context).colorScheme.inversePrimary,
     ),
     body: Center(
       child: Container(
         // color: Colors.blue,
         height: 400,
         width: 300,

         child: Center(
           child: Column(
             children: [
               SizedBox(height: 100,),
               TextField(
                 controller: namecontroller,
                 decoration: InputDecoration(
                   hintText: "Name",
                   hintStyle: TextStyle(
                       color: Colors.grey.shade800,
                       fontSize: 20
                   ),
                   filled: true,

                   prefixIcon: Icon(Icons.person),
                 ),
               ),
                SizedBox(height: 10,),
               TextField(
                 controller: courcecontroller,
                 decoration: InputDecoration(
                   hintText: "Cource",
                   hintStyle: TextStyle(
                       color: Colors.grey.shade800,
                       fontSize: 20
                   ),
                   filled: true,

                   prefixIcon: Icon(Icons.rotate_90_degrees_ccw_sharp),
                 ),
               ),
               SizedBox(height: 10,),
               ElevatedButton(onPressed: (){
                 Navigator.push(context, MaterialPageRoute(builder: (context)=>PDFView(name: namecontroller.text.toString(), cources: courcecontroller.text.toString(),)));
               }, child: Text("Go for Certification")),
             ],
           ),
         ),
       ),
     ),
   );
  }

}