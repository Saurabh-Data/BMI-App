import 'package:flutter/material.dart';
import '../components/bmi_button.dart';
import '../utils/bmi_calculator.dart';
import 'result_page.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  double height = 180.0; // Height in cm
  int weight = 70;
  int age = 25;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: _buildCard(
                    label: 'Height',
                    content: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          '${height.toStringAsFixed(1)} cm', // Rounds to 1 decimal place
                          style: TextStyle(
                            fontSize: 50.0,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        Slider(
                          value: height,
                          min: 100.0,
                          max: 220.0,
                          divisions: 120,  // Adds precision with steps of 1 cm
                          label: '${height.round()} cm', // Shows rounded height in label
                          activeColor: Colors.pink,
                          inactiveColor: Colors.grey,
                          onChanged: (double newValue) {
                            setState(() {
                              height = newValue;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: _buildCard(
                    label: 'Weight',
                    content: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          '$weight kg',
                          style: TextStyle(
                            fontSize: 50.0,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            _buildRoundIconButton(
                              icon: Icons.remove,
                              onPressed: () {
                                setState(() {
                                  if (weight > 1) weight--; // Prevents weight from going below 1
                                });
                              },
                            ),
                            SizedBox(width: 10.0),
                            _buildRoundIconButton(
                              icon: Icons.add,
                              onPressed: () {
                                setState(() {
                                  weight++;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: _buildCard(
                    label: 'Age',
                    content: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          '$age',
                          style: TextStyle(
                            fontSize: 50.0,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            _buildRoundIconButton(
                              icon: Icons.remove,
                              onPressed: () {
                                setState(() {
                                  if (age > 1) age--; // Prevents age from going below 1
                                });
                              },
                            ),
                            SizedBox(width: 10.0),
                            _buildRoundIconButton(
                              icon: Icons.add,
                              onPressed: () {
                                setState(() {
                                  age++;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          BMIButton(
            label: 'Calculate BMI',
            onTap: () {
              // Use BMI Calculator to get the result
              BMICalculator calc = BMICalculator(height: height.round(), weight: weight);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultPage(
                    bmiResult: double.parse(calc.calculateBMI()),
                    resultText: calc.getResult(),
                    interpretation: calc.getInterpretation(),
                  ),
                ),
              );
            },
            color: Colors.pink,
            width: double.infinity,
            height: 60.0,
            borderRadius: 25.0,
            icon: Icons.calculate,
          ),
        ],
      ),
    );
  }

  /// Helper function to create a reusable card with a label and content
  Widget _buildCard({required String label, required Widget content}) {
    return Container(
      margin: EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        color: Color(0xFF1D1E33),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            label,
            style: TextStyle(
              fontSize: 20.0,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 15.0),
          content,
        ],
      ),
    );
  }

  /// Helper function to create a round icon button for weight/age adjustment
  Widget _buildRoundIconButton({required IconData icon, required VoidCallback onPressed}) {
    return RawMaterialButton(
      child: Icon(icon, color: Colors.white),
      onPressed: onPressed,
      elevation: 6.0,
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),
    );
  }
}

