

import 'package:flutter/foundation.dart';

import '../data/repository.dart';
import 'quiz_model.dart';

class QuizProvider extends ChangeNotifier {
  QuizProvider(int quizId) : repository = QuizRepositoryImpl(quizId);

  ProviderState model = InitialProviderState();
  final QuizRepositoryImpl repository;

  String get name => repository.name;

  void start() {
    fetchNextQuestion();
  }

  void restart() {
    model = InitialProviderState();
    notifyListeners();
  }

  void fetchNextQuestion({int answer = 0}) {
    final updatedId = model.id + 1;
    final newQuestion = repository.getQuestion(updatedId);
    final updatedPoints = model.points + answer;
    if (newQuestion == null) {
      model = ResultsProviderState(
        repository.getResult(updatedPoints)?.value ?? '',
        id: updatedId,
        points: updatedPoints,
      );
    } else {
      model = QuestionProviderState(
        newQuestion,
        id: updatedId,
        points: updatedPoints,
      );
    }
    notifyListeners();
  }
}
