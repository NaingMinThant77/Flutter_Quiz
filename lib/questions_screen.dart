import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz/answer_button.dart';
import 'package:quiz/data/questions.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key, required this.onSelectAnswer});

  final void Function(String answer) onSelectAnswer;

  @override
  State<QuestionsScreen> createState() {
    return _QuestionsScreenState();
  }
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  var currentQuestionIndex = 0;

  void answerQuestion(String selectedAnswer) {
    widget.onSelectAnswer(selectedAnswer);
    setState(() {
      // currentQuestionIndex = currentQuestionIndex + 1;
      // currentQuestionIndex += 1;
      currentQuestionIndex++;
    });
  }

  @override
  Widget build(context) {
    final currentQuestion = questions[currentQuestionIndex];

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, //Center vertically
          crossAxisAlignment: CrossAxisAlignment.stretch, // Center horizontally
          children: [
            Text(
              currentQuestion.text,
              style: GoogleFonts.quicksand(
                color: const Color.fromARGB(255, 201, 153, 251),
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
              // style: const TextStyle(
              //   color: Colors.white, 
              //   fontSize: 24, 
              // ),
            ),
            const SizedBox(
              height: 30,
            ),
             // AnswerButton(
            //   answerText: currentQuestion.answers[0],
            //    onTap: () {},
            // ),
            // AnswerButton(
            //   answerText: currentQuestion.answers[1],
            //    onTap: () {},
            // ),
            // AnswerButton(
            //   answerText: currentQuestion.answers[2],
            //    onTap: () {},
            // ),
            // AnswerButton(
            //   answerText: currentQuestion.text[3],
            //    onTap: () {},
            // ),
            
            //Spread Operator
            ...currentQuestion.getShuffledAnswers().map((answer) {
              return AnswerButton(
                  answerText: answer,
                  onTap: () {
                    answerQuestion(answer);
              });
            })
          ],
        ),
      ),
    );
  }
}
