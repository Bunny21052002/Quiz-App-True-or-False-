import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class scoreScreen extends StatelessWidget {
  late int score;
  scoreScreen({Key? key, required this.score}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.green,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Your Score is $score',
            style: GoogleFonts.trirong(fontSize: 30, color: Colors.white),
          ),
          FloatingActionButton(
            onPressed: () {
              Navigator.pop(context);
            },
            backgroundColor: Color.fromARGB(255, 50, 53, 50),
            child: const Icon(Icons.arrow_circle_left_outlined),
            
            
          ),
        ],
      ),
    );
  }
}
