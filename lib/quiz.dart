import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions_data.dart';
import 'package:quiz_app/question_elements.dart';
import 'package:quiz_app/result_screen.dart';
import 'package:quiz_app/start_elements.dart';

class QuizWidget extends StatefulWidget {
  const QuizWidget({super.key});
  @override
  State<QuizWidget> createState() {
    return QuizState();
  }
}

class QuizState extends State<QuizWidget> {
  String currentScreen = 'start';
  final List<String> selectedAnswers = [];

  @override
  void initState() {
    currentScreen = 'start';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Widget? activeScreenWidget;

    switch (currentScreen) {
      case 'start':
        activeScreenWidget = StartElements(nextScreen);
        break;
      case 'quiz':
        activeScreenWidget = QuestionElementsWidget(onSelectAnswer: addAnswer);
        break;
      case 'results':
        activeScreenWidget = ResultScreen(
          onReset: nextScreen,
          selectedAnswers: selectedAnswers,
        );
        break;
    }

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.black,
                Color.fromARGB(255, 21, 38, 78),
              ],
            ),
          ),
          child: activeScreenWidget,
        ),
      ),
    );
  }

  void addAnswer(String answer) {
    selectedAnswers.add(answer);
    if (selectedAnswers.length == questions.length) {
      print(selectedAnswers);
      setState(() {
        currentScreen = 'results';
      });
      //selectedAnswers.clear();
    }
  }

  void nextScreen() {
    setState(() {
      if (currentScreen == 'start') {
        currentScreen = 'quiz';
      }
      if (currentScreen == 'results') {
        currentScreen = 'start';
      }
      selectedAnswers.clear();
    });
  }
}
