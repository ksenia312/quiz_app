import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class QuizRootScreen extends StatelessWidget {
  const QuizRootScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'QUIZ',
          style: TextStyle(fontFamily: 'PressStart'),
        ),
      ),
      body: const AutoRouter(),
    );
  }
}
