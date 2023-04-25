import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/data/questions_data.dart';
import 'package:quiz_app/quiz_summary.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({
    super.key,
    required this.selectedAnswers,
    required this.onReset,
  });
  final List<String> selectedAnswers;
  final Function() onReset;

  List<Map<String, Object>> getQuizSummary() {
    final List<Map<String, Object>> summary = [];
    for (var i = 0; i < questions.length; i++) {
      summary.add({
        'ques_id': i,
        'ques_question': questions[i].question,
        'ques_correct_answer': questions[i].answers[0],
        'ques_selected_answer': selectedAnswers[i],
        'ques_is_correct': (questions[i].answers[0] == selectedAnswers[i]),
      });
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summaryData = getQuizSummary();
    final totalQues = questions.length;
    final correctQues = summaryData.where((data) {
      return (data['ques_is_correct']) == true;
    }).length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        padding: const EdgeInsets.all(45),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'You answered $correctQues questions out $totalQues correctly',
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: const Color.fromARGB(226, 253, 254, 255),
              ),
            ),
            const SizedBox(height: 45),
            QuizSummary(
              summaryData: summaryData,
            ),
            const SizedBox(height: 45),
            OutlinedButton.icon(
              icon: const Icon(Icons.settings_backup_restore_rounded),
              onPressed: onReset,
              label: const Text(
                'Reset',
              ),
            )
          ],
        ),
      ),
    );
  }
}
