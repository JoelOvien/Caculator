import 'package:flutter/material.dart';
import 'package:mycalculator/homepage/homepage.dart';


class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calculator',
      theme: ThemeData(),
      home: new MyHomePage(title: 'My Calculator'),
    );
  }
}