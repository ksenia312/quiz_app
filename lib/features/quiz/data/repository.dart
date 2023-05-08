import 'package:my_great_app/features/quiz/domain/quiz_repository.dart';

class QuizRepositoryImpl extends QuizRepository {
  QuizRepositoryImpl(int quizId) : super(quizId);

  @override
  String get name => data.name;

  @override
  Question? getQuestion(int id) {
    try {
      return data.questions[id];
    } catch (e) {
      return null;
    }
  }

  @override
  Result? getResult(int count) {
    try {
      return data.results.firstWhere((element) => element.points == count);
    } catch (e) {
      return null;
    }
  }
}
