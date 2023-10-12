import 'package:certification_cources/HomeScreen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'Splesh_Screen.dart';
import 'firebase_options.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

   runApp(const MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        // colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,

       appBarTheme: const AppBarTheme(
         systemOverlayStyle: SystemUiOverlayStyle(
           statusBarColor: Colors.black87,
           statusBarIconBrightness: Brightness.light,
           statusBarBrightness: Brightness.dark,
         ),
       )
      ),

      home:Splesh(),
    );
  }
}



