import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/support/ScoreScreen.dart';
import 'package:quiz_app/support/questions.dart';

class QuestionBank extends StatefulWidget {
  const QuestionBank({Key? key}) : super(key: key);

  @override
  State<QuestionBank> createState() => QuestionBankState();
}

class QuestionBankState extends State<QuestionBank> {
  List<Questions> questionBank = [
    Questions(answer: true, q: "Dart is OOP language"),
    Questions(answer: false, q: "Flutter uses C language"),
    Questions(answer: false, q: "Flutter can only create Apps on Android")
  ];
  int questionNo = 0, score = 0;
  @override
  Widget build(BuildContext context) {
    if (questionNo == 0) {
      score = 0;
    }
    Size screeSize = MediaQuery.of(context).size;
    return Container(
      height: screeSize.height,
      width: screeSize.width,
      child: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              questionBank[questionNo].q,
              style: GoogleFonts.trirong(
                fontSize: 30,
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                  child: Container(
                    alignment: Alignment.center,
                    height: screeSize.height * 0.1,
                    width: screeSize.width,
                    color: Colors.green,
                    child: Text(
                      "True",
                      style: GoogleFonts.trirong(
                          fontSize: 30, color: Colors.white),
                    ),
                  ),
                  onTap: () {
                    setState(
                      () {
                        if (questionBank[questionNo].answer == true) {
                          score += 1;
                        }
                        questionCounter();
                      },
                    );
                  },
                ),
                SizedBox(
                  height: screeSize.height * 0.03,
                ),
                GestureDetector(
                  child: Container(
                    alignment: Alignment.center,
                    height: screeSize.height * 0.1,
                    width: screeSize.width,
                    color: Colors.red[400],
                    child: Text(
                      "False",
                      style: GoogleFonts.trirong(
                          fontSize: 30, color: Colors.white),
                    ),
                  ),
                  onTap: () {
                    setState(
                      () {
                        if (questionBank[questionNo].answer == false) {
                          score += 1;
                        }
                        questionCounter();
                      },
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  questionCounter() {
    setState(() {
      if (questionNo < questionBank.length - 1) {
        questionNo++;
      } else {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => scoreScreen(score: score)));
        questionNo = 0;
      }
    });
  }
}
