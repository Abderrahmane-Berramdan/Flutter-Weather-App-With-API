import 'package:flutter/material.dart';

class DetaileCollumn extends StatelessWidget {
  final IconData icon;
  final double value;
  final String unity;
  final String name;
  final Color? color;
  const DetaileCollumn({
    super.key,
    required this.icon,
    required this.value,
    required this.unity,
    required this.name,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 5,
      children: [
        Icon(icon, color: color),
        Text(
          "$value $unity",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        Text(name, style: TextStyle(color: Colors.white)),
      ],
    );
  }
}
