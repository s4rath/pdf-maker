import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pdf_maker/home.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, });
  

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
   SplashScreen({super.key, });
 

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (builder) {
        return HomePage();
      }));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        child: Container(
          child: Text(
            'hiiiiiiii',
            style: TextStyle(color: Colors.blue),
          ),
          color: Colors.amberAccent,
        ),
      ),
    );
  }
}
