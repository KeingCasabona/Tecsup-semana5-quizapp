import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: QuizPage(),
    );
  }
}

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  int questionNumber = 0;
  List<String> questions = [
    "El hombre llego a la Luna?,",
    "Has almorzado algo?",
    "Sientes frio?",
    "Vas a salir mañana?",
  ];

  List<bool> answers = [
    true,
    true,
    false,
    true,
  ];

  List<Icon> scoreKeeper = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 50, 20, 119),
      appBar: AppBar(
        title: const Text(
          'QuizApp',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Color.fromARGB(255, 94, 5, 152),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 8,
              child: Center(
                child: Text(
                  questions[questionNumber],
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Expanded(
              child: MaterialButton(
                onPressed: () {
                  setState(
                    () {
                      bool correctAnswer = answers[questionNumber];
                      if (correctAnswer == true) {
                        scoreKeeper.add(
                          Icon(
                            Icons.check,
                            color: Colors.greenAccent,
                          ),
                        );
                      } else {
                        scoreKeeper.add(
                          Icon(
                            Icons.close,
                            color: Colors.redAccent,
                          ),
                        );
                      }
                      questionNumber++;
                    },
                  );
                },
                child: Text(
                  'Verdadero',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                ),
                color: Colors.green,
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: MaterialButton(
                onPressed: () {
                  setState(
                    () {
                      bool correctAnswer = answers[questionNumber];
                      if (correctAnswer == false) {
                        scoreKeeper.add(
                          Icon(
                            Icons.check,
                            color: Colors.greenAccent,
                          ),
                        );
                      } else {
                        scoreKeeper.add(
                          Icon(
                            Icons.close,
                            color: Colors.redAccent,
                          ),
                        );
                      }
                      questionNumber++;
                    },
                  );
                },
                child: Text(
                  'Falso',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                ),
                color: Colors.red,
              ),
            ),
            SizedBox(height: 20),
            Row(
              children: scoreKeeper,
            ),
            SizedBox(height: 80),
          ],
        ),
      ),
    );
  }
}
