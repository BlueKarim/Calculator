import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
} 
class MyApp extends StatefulWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}
class _MyAppState extends State<MyApp> {
  String output = "0";
  String _output = "0";
  double num1 = 0.0;
  double num2 = 0.0;
  String operand = "";
  String history = "";
  void lichsu(String buttonText){
    setState(() {
      if(buttonText == "AC")
      {
        history = "";
      }
      else if(history == "" && buttonText == "0")
      {
        history = "";
      }
      else
      {
        if(buttonText == "+/-")
        {
          _output = (-num1).toString();
        }
        else if(history.contains("=")){
          history = "";
          history = history + _output;
        }
        else
        {
        history = history + buttonText;
        }
      }  
    });
  }
  void buttonPress(String buttonText){
    if (buttonText == "AC") {
      _output = "0";
      num1 = 0.0;
      num2 = 0.0;
      operand = "";
    } else if (buttonText == "+" ||
        buttonText == "-" ||
        buttonText == "/" ||
        buttonText == "x") {
      num1 = double.parse(output);
      operand = buttonText;
      _output = "";
    } else if (buttonText == ".") {
      if (_output.contains(".")) {
        print("Already conatains a decimals");
        return;
      }
      else 
      {
        if(buttonText == "+/-")
        {
          _output = (-num1).toString();
        }
        else{
        _output = _output + buttonText;
        }
      }
    } else if (buttonText == "%"){
      num1 = double.parse(output)/100;
    }
    else if (buttonText == "=") {
      num2 = double.parse(output);

      if (operand == "+") {
        _output = (num1 + num2).toString();
      }
      if (operand == "-") {
        _output = (num1 - num2).toString();
      }
      if (operand == "x") {
        _output = (num1 * num2).toString();
      }
      if (operand == "/") {
        _output = (num1 / num2).toString();
      }
      if(operand == "%")
      {
        _output = (num1 + num2/100).toString();
      }
      num1 = 0.0;
      num2 = 0.0;
      operand = "";
    } else {
      _output = _output + buttonText;
    }
    setState(() {
      lichsu(buttonText);
      output = double.parse(_output).toStringAsFixed(2);
    });
  }
  Widget buildButton0(String buttonText,int _flex,Color? buttonColor) {
    return 
      Expanded(
        flex: _flex,
        child: Container(
          margin: const EdgeInsets.fromLTRB(24, 10, 24, 10),
          child:
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
              padding: const EdgeInsets.all(24.0),
              textStyle: const TextStyle(
                color: Colors.white70,
                ),
            ),
            child: Text(
              buttonText,
              style: const TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            onPressed: (){
              buttonPress(buttonText);
            }
          ),
        ),
      );
  }
  Widget buildButton(String buttonText,int _flex,Color? buttonColor ){
    return Expanded(
      flex: _flex,
      child: Container(
        margin: const EdgeInsets.fromLTRB(24, 10, 24, 10),
        child: 
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: const CircleBorder(),
            padding: const EdgeInsets.all(24.0),
            textStyle: const TextStyle(
              color: Colors.white70,
            ),
            primary: buttonColor,
          ),
          child: Text(buttonText,
          style: const TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        
        ),
        onPressed: (){
          buttonPress(buttonText);
        },)
      ),
    );
  }
  @override
  void initState(){
    super.initState();
  }
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Calculator'),
          backgroundColor: Colors.lightBlueAccent[400],
        ),
        body: Container(
          child: Column(
            children: <Widget>[
              Container(
                alignment: Alignment.centerRight,
                padding: const EdgeInsets.symmetric(vertical: 24.0,horizontal:12.0),
                child: 
                  Text(history,
                    style: const TextStyle(
                      fontSize: 48.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
              ),
              Container(
                alignment: Alignment.centerRight,
                padding: const EdgeInsets.symmetric(vertical: 24.0,horizontal:12.0),
                child: 
                  Text(output,
                    style: const TextStyle(
                      fontSize: 48.0,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
              ),
              Expanded(
                child: Divider(
                  height: 10,
                  thickness: 5,
                )),
              Column(
                children: [
                  Row(
                    children: [
                      buildButton("AC",1,Colors.blue[300]),
                      buildButton("+/-",1,Colors.blue[300]),
                      buildButton("%",1,Colors.blue[300]),
                      buildButton("/",1,Colors.orange[300]),
                    ],),
                  Row(
                    children: [
                      buildButton("7",1,Colors.purple[200]),
                      buildButton("8",1,Colors.purple[200]),
                      buildButton("9",1,Colors.purple[200]),
                      buildButton("x",1,Colors.orange[300]),
                    ],
                  ),
                  Row(
                    children: [
                      buildButton("4",1,Colors.purple[200]),
                      buildButton("5",1,Colors.purple[200]),
                      buildButton("6",1,Colors.purple[200]),
                      buildButton("-",1,Colors.orange[300]),
                    ],
                  ),
                  Row(
                    children: [
                      buildButton("3",1,Colors.purple[200]),
                      buildButton("2",1,Colors.purple[200]),
                      buildButton("1",1,Colors.purple[200]),
                      buildButton("+",1,Colors.orange[300]),
                    ],
                  ),
                  Row(
                    children: [
                      buildButton0("0",2,Colors.purple[200]),                      
                      buildButton(".",1,Colors.purple[200]),
                      buildButton("=",1,Colors.orange[300]),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}