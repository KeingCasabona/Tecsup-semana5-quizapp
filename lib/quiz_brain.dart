import 'package:quizapp/question.dart';

class QuizBrain {
  List<Question> _questionsAnswers = [
    Question(questionText: "El hombre llego a la Luna?", questionAnswer: true),
    Question(questionText: 'Has almorzado algo?', questionAnswer: true),
    Question(questionText: 'Sientes frio?', questionAnswer: false),
    Question(questionText: 'Vas a salir mañana?', questionAnswer: true),
  ];

  int _questionNumber = 0;

  String getQuestionText() {
    return _questionsAnswers[_questionNumber].questionText;
  }

  bool getQuestionAnswer() {
    return _questionsAnswers[_questionNumber].questionAnswer;
  }

  int nextQuestion() {
    return _questionNumber++;
  }
}
