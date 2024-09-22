import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  final VoidCallback onButtonPressed;

  const StartScreen({super.key, required this.onButtonPressed});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Container(
          width: double.infinity, // Allow the container to expand
          height: double.infinity, // Allow the container to expand vertically
          child: Column(
            mainAxisAlignment:
                MainAxisAlignment.center, // Center items vertically
            children: [
              const Text(
                "Quiz!",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 50),
              Opacity(
                opacity: 0.7,
                child: Image.asset(
                  "assets/quiz-logo.png",
                  width: 200,
                ),
              ),
              const SizedBox(height: 20),
              TextButton(
                onPressed: onButtonPressed, // Use the passed function directly
                style: TextButton.styleFrom(
                  padding: const EdgeInsets.all(5), // 5px padding
                  backgroundColor: Colors.white, // Background color
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4), // 4px border radius
                  ),
                ),
                child: const Text("Start Quiz"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
