import 'package:flutter/material.dart';
import 'package:quiz_app/quiz_summary_row.dart';

class QuizSummary extends StatelessWidget {
  const QuizSummary({
    super.key,
    required this.summaryData,
  });

  final List<Map<String, Object>> summaryData;
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          children: [
            ...summaryData.map((entry) {
              return QuizSummaryRow(
                id: entry['ques_id'] as int,
                question: entry['ques_question'] as String,
                correctAnswer: entry['ques_correct_answer'] as String,
                choosenAnswer: entry['ques_selected_answer'] as String,
                isCorrect: entry['ques_is_correct'] as bool,
              );
            }),
          ],
        ),
      ),
    );
  }
}
