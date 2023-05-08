import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:my_great_app/features/quiz/domain/quiz_model.dart';
import 'package:my_great_app/features/quiz/domain/quiz_provider.dart';
import 'package:my_great_app/features/quiz/domain/quiz_repository.dart';
import 'package:my_great_app/features/router/router.dart';
import 'package:provider/provider.dart' hide Provider;

part '../initial.dart';

part '../question.dart';

part '../result.dart';

@RoutePage()
class QuizScreen extends StatelessWidget {
  const QuizScreen({
    Key? key,
    @PathParam() required this.id,
  }) : super(key: key);

  final int id;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => QuizProvider(id),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_outlined),
            splashRadius: 20,
            onPressed: () {
              context.router.navigate(const QuizListRoute());
            },
          ),
          foregroundColor: Theme.of(context).colorScheme.onBackground,
        ),
        body: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 500),
            child: ListView(
              shrinkWrap: true,
              padding: const EdgeInsets.symmetric(horizontal: 15),
              children: [
                // const SizedBox(height: 50),
                Builder(builder: (context) {
                  final provider = context.watch<QuizProvider>();
                  return AnimatedDefaultTextStyle(
                    curve: Curves.ease,
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onBackground,
                      fontSize:
                          provider.model is InitialProviderState ? 24 : 12,
                    ),
                    textAlign: TextAlign.center,
                    duration: const Duration(milliseconds: 300),
                    child: Text(provider.name),
                  );
                }),
                const SizedBox(height: 20),
                ProviderStateBuilder(
                  initialBuilder: (context) => const _InitialHomeBody(),
                  questionBuilder: (context, questionState) {
                    return _QuestionHomeBody(
                      question: questionState.question,
                    );
                  },
                  resultBuilder: (context, resultState) {
                    return _ResultBody(
                      value: resultState.result,
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
