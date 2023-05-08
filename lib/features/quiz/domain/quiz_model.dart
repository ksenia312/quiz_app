import 'package:flutter/material.dart';
import 'package:my_great_app/features/quiz/domain/quiz_provider.dart';
import 'package:my_great_app/features/quiz/domain/quiz_repository.dart';
import 'package:provider/provider.dart' hide Provider;

abstract class ProviderState {
  ProviderState({
    this.id = -1,
    this.points = 0,
  });

  final int id;
  final int points;
}

class InitialProviderState extends ProviderState {
  InitialProviderState({super.id, super.points});
}

class QuestionProviderState extends ProviderState {
  QuestionProviderState(this.question, {super.id, super.points});

  final Question question;
}

class ResultsProviderState extends ProviderState {
  ResultsProviderState(this.result, {super.id, super.points});

  final String result;
}

class ProviderStateBuilder extends StatefulWidget {
  const ProviderStateBuilder({
    Key? key,
    required this.initialBuilder,
    required this.questionBuilder,
    required this.resultBuilder,
  }) : super(key: key);

  final Widget Function(BuildContext) initialBuilder;
  final Widget Function(BuildContext, QuestionProviderState) questionBuilder;
  final Widget Function(BuildContext, ResultsProviderState) resultBuilder;

  @override
  State<ProviderStateBuilder> createState() => _ProviderStateBuilderState();
}

class _ProviderStateBuilderState extends State<ProviderStateBuilder>
    with SingleTickerProviderStateMixin {
  late final controller = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 300),
  );
  late final animation = CurvedAnimation(parent: controller, curve: Curves.linear);

  @override
  void initState() {
    controller.forward();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: animation,
      child: Consumer<QuizProvider>(
        builder: (BuildContext context, value, Widget? child) {
          final state = value.model;
          if (state is InitialProviderState) {
            return widget.initialBuilder(context);
          } else if (state is QuestionProviderState) {
            return widget.questionBuilder(context, state);
          } else if (state is ResultsProviderState) {
            return widget.resultBuilder(context, state);
          }
          return widget.initialBuilder(context);
        },
      ),
    );
  }
}
