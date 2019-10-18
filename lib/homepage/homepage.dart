import 'package:flutter/material.dart';
//import 'dart:math';
//import 'package:mycalculator/buttons/buttons.dart';


//My State class
class MyHomePage extends StatefulWidget{
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

//My base class of stateful widget
class _MyHomePageState extends State<MyHomePage>{

  //All variables used through out the code
  String outPut = '0';
  String _outPut = '0';
  double num1 = 0.0;
  double num2 = 0.0;
  String operand = '';


  //The button pressed function--gives functionality to all the buttons present in my application
  buttonPressed(String buttonText){
    if (buttonText == "CLEAR"){
      _outPut = '0';
      num1 = 0.0;
      num2 = 0.0;
      operand = '';
    }
    else if(buttonText == '+' || buttonText == '-' || buttonText == 'X' || buttonText == '/'){
      num1 = double.parse(outPut);
      operand = buttonText;
      _outPut = '0';
    }

    else if(buttonText == '.'){
      if(_outPut.contains('.')){
        print('Already contains it');
        return;
      }
      else{
        _outPut = _outPut + buttonText;
      }

    }
    else if (buttonText == '=') {
      num2 = double.parse(outPut);
      if (operand == '+') {
        _outPut = (num1 + num2).toString();
      }
      if (operand == '-') {
        _outPut = (num1 - num2).toString();
      }
      if (operand == 'X') {
        _outPut = (num1 * num2).toString();
      }
      if (operand == '/') {
        _outPut = (num1 / num2).toString();
      }
      num1 = 0.0;
      num2 = 0.0;
      operand = '';
    }
    else {
      _outPut = _outPut + buttonText;
    }
    print(_outPut);

    setState((){
      outPut = double.parse(_outPut).toStringAsFixed(2);
    });
  }


  Widget buildButton(String buttonText){
    return new Expanded(
        child: new OutlineButton(
          padding: EdgeInsets.all(20.0),
          child: new Text(buttonText,
            style: TextStyle(fontSize:20.0, fontWeight: FontWeight.bold),
          ),
          onPressed: () {
            buttonPressed(buttonText);
          },
          color: Colors.blueGrey,
          textColor: Colors.blueGrey,
        ),
    );
  }

  @override
  Widget build(BuildContext context){
    return new Scaffold(
        appBar: new AppBar(
          title: new Text(widget.title),
        ),
        body: new Container(
          child: new Column(
            children: <Widget>[
            new Container(
              //alignment: Alignment.centreRight,
              padding: new EdgeInsets.symmetric(
                vertical: 24.0,
                horizontal: 12.0,
              ),
              child: new Text(outPut,
                style: new TextStyle(
                fontSize: 50.0,
                fontWeight: FontWeight.bold,
              ),),
            ),


            new Expanded(
                child: new Divider()
            ),

            new Column(children: <Widget>[
              new Row(children: <Widget>[
                buildButton('7'),
                buildButton('8'),
                buildButton('9'),
                buildButton('/')
              ]),

              new Row(children: <Widget>[
                buildButton('4'),
                buildButton('5'),
                buildButton('6'),
                buildButton('X')
              ]),

              new Row(children: <Widget>[
                buildButton('1'),
                buildButton('2'),
                buildButton('3'),
                buildButton('+')
              ]),

              new Row(children : <Widget>[
                buildButton('.'),
                buildButton('0'),
                buildButton('00'),
                buildButton('-')
              ]),

              new Row(children: <Widget>[
                buildButton('CLEAR'),
                buildButton('='),
              ]),
            ],)
          ],),
        )
    );
  }
}