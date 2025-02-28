import 'package:flutter/material.dart';

void main() => runApp(CalculatorApp());

class CalculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CalculatorApp',
      home: CalculatorHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class CalculatorHomePage extends StatefulWidget {
  @override
  _CalculatorHomePageState createState() => _CalculatorHomePageState();
}

class _CalculatorHomePageState extends State<CalculatorHomePage> {
  String displayText = '';
  void buttonPressed(String value) {
    setState(() {
      if (value == 'C') {
        displayText = '';
      }
      else if (value != '+' && value != '-' && value != '*' && value != '/' && value != '=') {
        displayText += value;
      }
    });
  }

  Widget buildButton(String text, Color color) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.all(5),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: color,
            padding: EdgeInsets.all(24),
          ),
          onPressed: () => buttonPressed(text),
          child: Text(
            text,
            style: TextStyle(fontSize: 24),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CalculatorApp'),
      ),
      body: Column(
        children: [
          // Display area
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 24),
            alignment: Alignment.centerRight,
            child: Text(
              displayText,
              style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
            ),
          ),
          // Buttons layout
          Expanded(
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    buildButton('7', Colors.blueGrey),
                    buildButton('8', Colors.blueGrey),
                    buildButton('9', Colors.blueGrey),
                    buildButton('/', Colors.orange),
                  ],
                ),
                Row(
                  children: <Widget>[
                    buildButton('4', Colors.blueGrey),
                    buildButton('5', Colors.blueGrey),
                    buildButton('6', Colors.blueGrey),
                    buildButton('*', Colors.orange),
                  ],
                ),
                Row(
                  children: <Widget>[
                    buildButton('1', Colors.blueGrey),
                    buildButton('2', Colors.blueGrey),
                    buildButton('3', Colors.blueGrey),
                    buildButton('-', Colors.orange),
                  ],
                ),
                Row(
                  children: <Widget>[
                    buildButton('C', Colors.redAccent),
                    buildButton('0', Colors.blueGrey),
                    buildButton('=', Colors.green),
                    buildButton('+', Colors.orange),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}




