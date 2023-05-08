import 'package:my_great_app/features/quiz/data/data.dart';

abstract class QuizRepository {
  QuizRepository(int quizId)
      : data = quizData.firstWhere((element) => element.id == quizId);

  final Data data;

  String get name;

  Question? getQuestion(int id);

  Result? getResult(int count);
}

abstract class Data {
  const Data({
    required this.id,
    required this.name,
    required this.questions,
    required this.results,
  });

  final int id;
  final String name;
  final List<Question> questions;
  final List<Result> results;
}

class Question {
  const Question({
    required this.name,
    required this.variants,
  });

  final String name;
  final List<String> variants;
}

class Result {
  const Result({
    required this.points,
    required this.value,
  });

  final int points;
  final String value;
}
