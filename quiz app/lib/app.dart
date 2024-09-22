import 'package:app/Screens/end_screen.dart';
import 'package:app/Screens/questions_screen.dart';
import 'package:app/Screens/start_screen.dart';
import 'package:app/counter.dart';
import 'package:flutter/material.dart';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  late Widget currentScreen;

  @override
  void initState() {
    super.initState();
    // Initialize the current screen
    currentScreen = StartScreen(onButtonPressed: switchScreen);
  }

  void swithcToEndScreen() {
    setState(() {
      currentScreen = EndScreen(
        switchToHome: restartGame,
      );
    });
  }

  // Function to switch screens
  void switchScreen() {
    setState(() {
      currentScreen = QuestionScreen(
        swithcScreen: swithcToEndScreen,
      );
    });
  }

  void restartGame() {
    correctCounter = 0;
    switchScreen();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Tutorial',
      home: Scaffold(
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color.fromARGB(255, 149, 0, 255), // Start color
                Color.fromARGB(255, 34, 66, 107), // End color
              ],
            ),
          ),
          // Use the current screen (StartScreen initially)
          child: currentScreen,
        ),
      ),
    );
  }
}
