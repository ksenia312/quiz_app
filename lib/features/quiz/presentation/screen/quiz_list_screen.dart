import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:my_great_app/features/quiz/data/data.dart';
import 'package:my_great_app/features/router/router.dart';

@RoutePage()
class QuizListScreen extends StatelessWidget {
  const QuizListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 500),
          child: ListView(
            padding: const EdgeInsets.all(15.0),
            children: [
              ...quizData.map(
                (e) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: InkWell(
                      onTap: () {
                        context.router.push(
                          QuizRoute(id: e.id),
                        );
                      },
                      child: Ink(
                        color: Theme.of(context).colorScheme.secondaryContainer,
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          '${e.id}. ${e.name}',
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.onPrimary,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
