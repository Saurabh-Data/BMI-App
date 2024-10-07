import 'package:flutter/material.dart';

class BMIButton extends StatelessWidget {
  final String label;
  final VoidCallback onTap;
  final Color color;
  final double width;
  final double height;
  final double borderRadius;
  final IconData? icon;

  BMIButton({
    required this.label,
    required this.onTap,
    this.color = Colors.blueAccent,
    this.width = double.infinity,
    this.height = 60.0,
    this.borderRadius = 30.0,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: Duration(milliseconds: 200),
        curve: Curves.easeInOut,
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(borderRadius),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              offset: Offset(0, 4),
              blurRadius: 10.0,
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (icon != null) Icon(icon, color: Colors.white),
            if (icon != null) SizedBox(width: 8),
            Text(
              label,
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
