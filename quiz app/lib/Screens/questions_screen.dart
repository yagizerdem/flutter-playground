import 'package:app/data.dart';
import 'package:app/models/quiz_question.dart';
import 'package:app/widgets/card.dart';
import 'package:flutter/material.dart';

class QuestionScreen extends StatefulWidget {
  QuestionScreen({super.key, required this.swithcScreen});
  void Function() swithcScreen;

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  int currentQuestionIndex = 0;

  @override
  void deactivate() {
    super.deactivate();
    print("de acitvated");
  }

  @override
  void initState() {
    super.initState();
    print("inti state");
  }

  @override
  void activate() {
    super.activate();
    print("activate");
  }

  @override
  Widget build(BuildContext context) {
    QuizQuestion currentQuestion = questions[currentQuestionIndex];
    void next(String answer) {
      setState(() {
        currentQuestionIndex++;
        if (currentQuestionIndex == questions.length) {
          currentQuestionIndex = questions.length - 1;
          return widget.swithcScreen();
        }
      });
    }

    return SafeArea(
      child: Container(
          child: Center(
        child: QuizCard(
          question: currentQuestion,
          next: next,
        ),
      )),
    );
  }
}
