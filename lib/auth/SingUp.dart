
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../Util/Utils.dart';
import 'login_screen.dart';

class SignUpScreen extends StatefulWidget{
  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  final emailcontroller = TextEditingController();
  final passwordcontroller = TextEditingController();
  final conformpasswordcontroller = TextEditingController();
  bool _passwordvisibale = true;
  FirebaseAuth _auth = FirebaseAuth.instance;
  void SignUp(){

      _auth.createUserWithEmailAndPassword(
          email: emailcontroller.text.toString(),
          password: passwordcontroller.text.toString()).then((value){
        Fluttertoast.showToast(msg: "succcessfully Register");
        Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
      }).catchError((error){
        utils().toastmessage(error.toString());
      });

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:  Theme.of(context).colorScheme.inversePrimary,
        automaticallyImplyLeading: false,
        title: Center(child: Text("SignUp")),
      ),
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
                    hintText: "Email",
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
                      return 'Email can\'t be empty';
                    }

                  },
                  onChanged: (text)=>setState(() {

                    emailcontroller.text =text;
                  }),
                ),
                SizedBox(height: 15,),
                TextFormField(
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(50)
                  ],
                  obscureText: _passwordvisibale,
                  decoration: InputDecoration(
                    hintText: "Password",
                    hintStyle: TextStyle(
                        color: Colors.grey.shade800,
                        fontSize: 20

                    ),
                    filled: true,
                    prefixIcon: const Icon(Icons.password),
                    suffixIcon:  IconButton(
                      icon: Icon(
                        _passwordvisibale ? Icons.visibility : Icons.visibility_off,

                      ), onPressed: () {
                      setState(() {
                        _passwordvisibale =!_passwordvisibale;
                      });
                    },
                    ),
                  ),

                  autovalidateMode: AutovalidateMode.onUserInteraction,

                  validator: (text){
                    if(text==null || text.isEmpty){
                      return 'Password can\'t be empty';
                    }

                  },
                  onChanged: (text)=>setState(() {

                    passwordcontroller.text =text;
                  }),
                ),
                SizedBox(height: 15,),
                TextFormField(
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(50)
                  ],
                  obscureText: _passwordvisibale,
                  decoration: InputDecoration(
                    hintText: "Conform Password",
                    hintStyle: TextStyle(
                        color: Colors.grey.shade800,
                        fontSize: 20

                    ),
                    filled: true,
                    prefixIcon: const Icon(Icons.password),
                    suffixIcon:  IconButton(
                  icon: Icon(
                  _passwordvisibale ? Icons.visibility : Icons.visibility_off,

                  ), onPressed: () {
                  setState(() {
                    _passwordvisibale =!_passwordvisibale;
                  });
                },
                ),
                  ),
                  // autovalidateMode: AutovalidateMode.onUserInteraction,

                  validator: (text){
                    if(text==null || text.isEmpty){
                      return 'Password can\'t be empty';
                    }
                    if(passwordcontroller.text!=conformpasswordcontroller.text){
                      return "Password doesn't match";
                    }

                  },
                  onChanged: (text)=>setState(() {

                    conformpasswordcontroller.text =text;
                  }),
                ),
                SizedBox(height: 25,),
                ElevatedButton(
                    onPressed:(){
                   if(_formKey.currentState!.validate()) {
                     SignUp();
                   }
                    },
                    child: Text("SignUp")),
                SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Already have an account "),
                    TextButton(onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
                    }, child: Text("LogIn")),
                  ],
                )


              ],
            ),
          ),
        ),
      ),
    );
  }
}