import 'package:app/counter.dart';
import 'package:flutter/material.dart';

class EndScreen extends StatelessWidget {
  EndScreen({super.key, required this.switchToHome});
  void Function() switchToHome;
  void restartGame() {
    switchToHome();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "correct count : $correctCounter",
                style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 30),
              ),
              TextButton.icon(
                  onPressed: restartGame,
                  icon: const Icon(
                    Icons.restart_alt,
                    size: 30,
                    color: Colors.white,
                  ),
                  label: const Text("restart",
                      style: TextStyle(
                        fontSize: 18, // Increase text size
                        color: Colors.white, // Set text color to white
                      )))
            ],
          ),
        ),
      ),
    );
  }
}
