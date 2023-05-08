part of 'screen/quiz_screen.dart';

class _InitialHomeBody extends StatelessWidget {
  const _InitialHomeBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        context.read<QuizProvider>().start();
      },
      child: const Text('Начать'),
    );
  }
}