import 'package:flutter/material.dart';
import 'dart:math';
import 'dice.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: DiceScreen(),
    );
  }
}

class DiceScreen extends StatefulWidget {
  @override
  State<DiceScreen> createState() {
    return DiceScreenState();
  }
}

class DiceScreenState extends State<DiceScreen> {
  int dice1 = 1;
  int dice2 = 1;
  int total = 2;

  String imagePath = 'assets/sad.webp';

  void rollDice() {
    setState(() {
      dice1 = Random().nextInt(6) + 1;
      dice2 = Random().nextInt(6) + 1;

      total = dice1 + dice2;

      if (total >= 10) {
        imagePath = 'assets/happy.webp';
      } else {
        imagePath = 'assets/sad.webp';
      }
    });
  }

  void resetDice() {
    setState(() {
      dice1 = 1;
      dice2 = 1;
      total = 2;
      imagePath = 'assets/sad.webp';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Play Dice'),
        centerTitle: true,
        leading: Icon(Icons.casino),
        backgroundColor: Colors.deepPurple,
      ),

      body: Padding(
        padding: EdgeInsets.all(20),

        child: Column(
          children: [
            Text(
              'Total is $total',
              style: TextStyle(fontSize: 20),
            ),

            SizedBox(height: 20),

            Expanded(
              child: Center(
                child: Image.asset(
                  imagePath,
                  height: 180,
                  errorBuilder: (context, error, stackTrace) {
                    return Icon(
                      total >= 10
                          ? Icons.sentiment_very_satisfied
                          : Icons.sentiment_very_dissatisfied,
                      size: 130,
                    );
                  },
                ),
              ),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Dice(value: dice1),
                Dice(value: dice2),
              ],
            ),

            Spacer(),

            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: rollDice,
                    child: Text('roll'),
                  ),
                ),

                SizedBox(width: 10),

                Expanded(
                  child: ElevatedButton(
                    onPressed: resetDice,
                    child: Text('reset'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}