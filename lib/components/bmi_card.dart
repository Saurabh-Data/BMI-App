import 'package:flutter/material.dart';

class BMICard extends StatelessWidget {
  final String label;
  final Widget content;
  final Color color;

  const BMICard({
    required this.label,
    required this.content,
    this.color = const Color(0xFF1D1E33), // Default card color
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        color: color,
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
          content, // Dynamic content provided by the parent widget
        ],
      ),
    );
  }
}
