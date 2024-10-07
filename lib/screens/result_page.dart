import 'package:flutter/material.dart';
import '../components/bmi_button.dart';

class ResultPage extends StatelessWidget {
  final double bmiResult;
  final String resultText;
  final String interpretation;

  const ResultPage({
    required this.bmiResult,
    required this.resultText,
    required this.interpretation,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your BMI Result'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Container(
              padding: EdgeInsets.all(15.0),
              alignment: Alignment.center,
              child: Text(
                'Your Result',
                style: TextStyle(
                  fontSize: 50.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: Container(
              margin: EdgeInsets.all(15.0),
              decoration: BoxDecoration(
                color: Color(0xFF1D1E33),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    resultText.toUpperCase(), // e.g., "NORMAL", "OVERWEIGHT"
                    style: TextStyle(
                      color: _getResultColor(), // Color based on result
                      fontSize: 22.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    bmiResult.toStringAsFixed(1), // e.g., "23.4"
                    style: TextStyle(
                      fontSize: 100.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'BMI Range for Normal Weight:',
                    style: TextStyle(
                      fontSize: 22.0,
                      color: Colors.white54,
                    ),
                  ),
                  Text(
                    '18.5 - 24.9 kg/m²',
                    style: TextStyle(
                      fontSize: 22.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text(
                      interpretation,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 22.0,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          BMIButton(
            label: 'RE-CALCULATE',
            onTap: () {
              Navigator.pop(context);
            },
            color: Colors.pink,
            width: double.infinity,
            height: 60.0,
            borderRadius: 25.0,
            icon: Icons.refresh,
          ),
        ],
      ),
    );
  }

  // A helper function to determine color based on the result
  Color _getResultColor() {
    if (resultText == 'Normal') {
      return Colors.green;
    } else if (resultText == 'Overweight') {
      return Colors.orange;
    } else if (resultText == 'Obese') {
      return Colors.red;
    } else {
      return Colors.yellow;
    }
  }
}
