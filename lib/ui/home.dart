import 'package:flutter/material.dart';

import 'package:bmi_app/main.dart';

class Bmi extends StatefulWidget {
  @override
  _BmiState createState() => _BmiState();
}

class _BmiState extends State<Bmi> {

  final TextEditingController _ageController = new TextEditingController();
  final TextEditingController _heightController = new TextEditingController();
  final TextEditingController _weightController = new TextEditingController();
  double inches = 0.0;
  double result = 0.0;
    double res = 0.0;

  String _resultReading = "";
  String _finalResult = "";

  void _checkBmi() {

    // BMI WEIGHT STATUS
    // Below 18.5 : UnderWeight
    // 18.5 - 24.9 Normal
    // 25.0 - 29.9 Overweight
    // 30.0 and Above Obese


    setState(() {
          int age = int.parse(_ageController.text);
          double height = double.parse(_heightController.text);
          double weight = double.parse(_weightController.text);

          inches = height*12;

          if((_ageController.text.isNotEmpty || age > 0) && (_heightController.text.isNotEmpty || inches > 0) && (_weightController.text.isNotEmpty || weight > 0) )
          {
            result = weight / (inches * inches) * 703;
            res = double.parse(result.toStringAsFixed(1));
          }

          if(double.parse(result.toStringAsFixed(1))  < 18.5) {
            _resultReading = "UnderWeight";
          }
          if(double.parse(result.toStringAsFixed(1)) >= 18.5 && result < 25 )
          {
            _resultReading = "Great! Normal";
          }

          else if(double.parse(result.toStringAsFixed(1)) >= 25.0 && result < 30 )
          {
            _resultReading = "OverWeight";
          }
          else if(double.parse(result.toStringAsFixed(1)) >= 300 )
          {
              _resultReading = "Obese";
          }

          else {
            result = 0.0;
          }
        
        });

        _finalResult = "Your BMI : $res";                

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("BMI"),
        centerTitle: true,
        backgroundColor: Colors.purpleAccent,
      ),
      body: new Container(
        alignment: Alignment.topCenter,
        child: new ListView(
          padding: const EdgeInsets.all(2.0),
          children: <Widget>[
            new Image.asset('images/bmilogo.png',
            height: 70.0,
            width: 75.0,
            ),
            new Container(
              margin: const EdgeInsets.all(3.0),
              height: 245.0,
              width: 290.0,
              color: Colors.grey.shade200,
              child: new Column(
                children: <Widget>[
                  new TextField(
                    controller: _ageController,
                    keyboardType: TextInputType.number,
                    decoration: new InputDecoration(
                      labelText: 'Age',
                      hintText: '20',
                      icon: new Icon(Icons.person_outline)
                    ),
                  ),
                  new TextField(
                    controller: _heightController,
                    keyboardType: TextInputType.number,
                    decoration: new InputDecoration(
                      labelText: 'Height ( feet )',
                      hintText: '5.9',
                      icon: new Icon(Icons.insert_chart)
                    ),
                  ),
                  new TextField(
                    controller: _weightController,
                    keyboardType: TextInputType.number,
                    decoration: new InputDecoration(
                      labelText: 'Weight (lbs)',
                      hintText: '150',
                      icon: new Icon(Icons.line_weight)
                    ),
                  ),
                  new Padding(padding: new EdgeInsets.all(10.0),),

                  // button
                  new Container(
                    alignment: Alignment.center,
                    child: new RaisedButton(
                      onPressed: _checkBmi,
                      color: Colors.purple,
                      child: new Text("Calculate"),
                      textColor: Colors.white,
                    ),
                  )
                ],
              ),
            ),
            new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Text("$_finalResult",
                style: new TextStyle(
                  color: Colors.blueAccent,
                  fontWeight: FontWeight.w500,
                  fontStyle: FontStyle.italic,
                  fontSize: 19.9
                )
                ),
                new Padding(padding: const EdgeInsets.all(5.0),),
                new Text("$_resultReading",
                style: new TextStyle(
                  color: Colors.pinkAccent,
                  fontWeight: FontWeight.w500,
                  fontStyle: FontStyle.italic,
                  fontSize: 19.9
                ),
                )
              ],
            )
          ],
        ),
      )
    );
  }
}