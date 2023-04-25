import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuizSummaryRow extends StatelessWidget {
  const QuizSummaryRow({
    super.key,
    required this.id,
    required this.question,
    required this.choosenAnswer,
    required this.correctAnswer,
    required this.isCorrect,
  });
  final int id;
  final String question;
  final String choosenAnswer;
  final String correctAnswer;
  final bool isCorrect;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                fixedSize: const Size.fromRadius(18),
                shape: const CircleBorder(),
                backgroundColor: isCorrect
                    ? const Color.fromARGB(199, 17, 205, 80)
                    : const Color.fromARGB(231, 241, 45, 45),
              ),
              child: Text((id + 1).toString()),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    question,
                    style: GoogleFonts.poppins(
                        fontSize: 11,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Your choice: $choosenAnswer",
                    style: GoogleFonts.poppins(
                        fontSize: 10,
                        color: Color.fromARGB(231, 255, 255, 255)),
                  ),
                  if (!isCorrect) ...[
                    Text(
                      "Correct Answer: $correctAnswer",
                      style: GoogleFonts.poppins(
                          fontSize: 10,
                          color: Color.fromARGB(231, 255, 255, 255)),
                    )
                  ],
                ],
              ),
            )
          ],
        ),
        const SizedBox(
          height: 20,
        )
      ],
    );
  }
}
