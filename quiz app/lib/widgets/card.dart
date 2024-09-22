import 'dart:math';

import 'package:app/counter.dart';
import 'package:app/data.dart';
import 'package:app/models/quiz_question.dart';
import 'package:flutter/material.dart';

class QuizCard extends StatefulWidget {
  QuizCard({super.key, required this.question, required this.next});
  final QuizQuestion question;
  final void Function(String) next;
  @override
  State<QuizCard> createState() => _CardState();
}

class _CardState extends State<QuizCard> {
  void onPress(String answer) {
    if (answer == widget.question.answers[0]) {
      correctCounter++;
    }

    widget.next(answer);
  }

  @override
  Widget build(BuildContext context) {
    late List<String> shuffledAnswers;
    shuffledAnswers = [...widget.question.answers]; // Create a copy of answers
    shuffledAnswers.shuffle(Random()); // Shuffle answers
    return Container(
      width: 300,
      padding: const EdgeInsets.all(8.0),
      color: const Color.fromARGB(255, 199, 194, 155),
      child: Column(
        mainAxisSize:
            MainAxisSize.min, // Makes the column fit its content height
        children: [
          Text(
            widget.question.text,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          ...shuffledAnswers.map((answer) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 4.0),
              child: ElevatedButton(
                style: TextButton.styleFrom(
                  padding:
                      const EdgeInsets.all(8.0), // You can adjust the padding
                  backgroundColor: Colors.white, // Flat button background
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4), // 4px border radius
                  ),
                ),
                onPressed: () {
                  onPress(answer);
                },
                child: Text(answer),
              ),
            );
          }).toList(),
        ],
      ),
    );
  }
}
