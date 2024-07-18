import 'package:flutter/material.dart';
import 'package:quizapp/quiz_brain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

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
  List<Icon> scoreKeeper = [];

  QuizBrain quizBrain = QuizBrain();

  checkAnswer(bool userAnswer) {
    bool correctAnswer = quizBrain.getQuestionAnswer();

    // Actualiza el scoreKeeper aquí antes de verificar si el quiz ha terminado
    setState(() {
      if (scoreKeeper.length < quizBrain.getTotalQuestions()) {
        if (correctAnswer == userAnswer) {
          scoreKeeper.add(Icon(Icons.check, color: Colors.green));
        } else {
          scoreKeeper.add(Icon(Icons.close, color: Colors.red));
        }
      }
    });

    if (quizBrain.isFinished() == true) {
      // Mostrar el cuadro de alerta después de actualizar el scoreKeeper
      Alert(
        context: context,
        type: AlertType.success,
        title: "Quiz",
        desc: "El preguntas han terminado",
        buttons: [
          DialogButton(
            child: Text(
              "Reiniciar",
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
            onPressed: () {
              Navigator.pop(context);
              quizBrain.restart();
              setState(() {
                scoreKeeper.clear();
              });
            },
            width: 120,
          )
        ],
      ).show();
    } else {
      // Si el quiz no ha terminado, simplemente continúa
      quizBrain.nextQuestion();
    }
  }

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
                  quizBrain.getQuestionText(),
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
                  checkAnswer(true);
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
                  checkAnswer(false);
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
