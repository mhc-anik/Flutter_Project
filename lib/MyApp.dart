import 'package:flutter/material.dart';
import 'package:task_manager/ui/screen/splash_screen.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorSchemeSeed: Colors.green,
        textTheme: TextTheme(
          titleLarge: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold
          )
        ),
        inputDecorationTheme: InputDecorationTheme(

          fillColor: Colors.grey[400],
          filled: true,
          contentPadding: EdgeInsets.symmetric(horizontal: 10,),


          border: OutlineInputBorder(
              borderSide: BorderSide.none
          ),

          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide.none
          ),

          errorBorder: OutlineInputBorder(
              borderSide: BorderSide.none
          ),


        ),
        filledButtonTheme: FilledButtonThemeData(
          style: FilledButton.styleFrom(
            backgroundColor: Colors.green,
            fixedSize: Size.fromWidth(double.maxFinite),
            padding: EdgeInsets.symmetric(vertical: 12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      ),
      home: spash_screen(),
    );
  }
}
