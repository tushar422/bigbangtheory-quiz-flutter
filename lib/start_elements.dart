import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StartElements extends StatelessWidget {
  const StartElements(this.nextScreen, {super.key});

  final void Function() nextScreen;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'assets/images/quiz-logo-main.png',
            width: 200,
            color: const Color.fromARGB(235, 255, 255, 255),
          ),
          const SizedBox(
            height: 30,
          ),
          Text(
            'The Big Bang Theory Quiz!',
            style: GoogleFonts.poppins(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: const Color.fromARGB(255, 224, 234, 255),
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          OutlinedButton(
            onPressed: nextScreen,
            style: OutlinedButton.styleFrom(
              padding: const EdgeInsets.all(15),
              surfaceTintColor: Colors.white,
            ),
            child: const Text(
              'Let\'s Go! 🖖🏻 ',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          )
        ],
      ),
    );
  }
}
