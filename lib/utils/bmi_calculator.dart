import 'dart:math';

class BMICalculator {
  final int height; // Height in centimeters
  final int weight; // Weight in kilograms
  double _bmi = 0;

  BMICalculator({required this.height, required this.weight});

  // Method to calculate BMI based on height (cm) and weight (kg)
  String calculateBMI() {
    _bmi = weight / pow(height / 100, 2); // height is divided by 100 to convert cm to meters
    return _bmi.toStringAsFixed(1); // Returns BMI rounded to 1 decimal point
  }

  // Method to get the BMI category based on the BMI value
  String getResult() {
    if (_bmi >= 30) {
      return 'Obese';
    } else if (_bmi >= 25) {
      return 'Overweight';
    } else if (_bmi >= 18.5) {
      return 'Normal';
    } else {
      return 'Underweight';
    }
  }

  // Method to return a detailed interpretation based on the BMI category
  String getInterpretation() {
    if (_bmi >= 30) {
      return 'Your BMI is quite high. You are classified as obese. It\'s recommended to consult a healthcare provider for guidance.';
    } else if (_bmi >= 25) {
      return 'You have a higher than normal body weight. Try to exercise more and focus on a balanced diet.';
    } else if (_bmi >= 18.5) {
      return 'You have a normal body weight. Great job! Keep maintaining a healthy lifestyle.';
    } else {
      return 'Your BMI is lower than normal. You might need to eat a bit more or consult a healthcare provider for advice.';
    }
  }
}
