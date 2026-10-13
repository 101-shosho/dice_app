import 'package:flutter/material.dart';

class Dice extends StatelessWidget {
  final int value;

  Dice({required this.value});

  @override
  Widget build(BuildContext context) {
    return Icon(
      [
        Icons.looks_one,
        Icons.looks_two,
        Icons.looks_3,
        Icons.looks_4,
        Icons.looks_5,
        Icons.looks_6,
      ][value - 1],
      size: 80,
      color: Colors.deepPurpleAccent,
    );
  }
}