import 'package:flutter/material.dart';
import 'package:quiz_app/answer_button.dart';
import 'package:quiz_app/data/questions_data.dart';
import 'package:quiz_app/model/question.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/quiz.dart';

class QuestionElementsWidget extends StatefulWidget {
  const QuestionElementsWidget({
    super.key,
    required this.onSelectAnswer,
  });
  final void Function(String answer) onSelectAnswer;

  @override
  State<QuestionElementsWidget> createState() {
    return _QuestionElementsState();
  }
}

class _QuestionElementsState extends State<QuestionElementsWidget> {
  var currentQuestionIndex = 0;
  void answerQuestion(String answer) {
    setState(() {
      currentQuestionIndex++;
    });
    widget.onSelectAnswer(answer);
  }

  @override
  Widget build(context) {
    Question currentQuestion = questions[currentQuestionIndex];
    return SizedBox(
      width: double.infinity,
      child: Container(
        padding: const EdgeInsets.all(45),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              currentQuestion.question,
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: const Color.fromARGB(226, 253, 254, 255),
              ),
            ),
            const SizedBox(height: 45),
            ...currentQuestion.getShuffledAnswers().map((answer) {
              return AnswerButton(
                text: answer,
                onPressed: () {
                  answerQuestion(answer);
                },
              );
            }),
          ],
        ),
      ),
    );
  }
}
