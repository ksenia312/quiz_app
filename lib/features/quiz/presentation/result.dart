part of 'screen/quiz_screen.dart';

class _ResultBody extends StatelessWidget {
  const _ResultBody({Key? key, required this.value}) : super(key: key);

  final String value;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          color: Theme.of(context).colorScheme.secondary,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              'Результат: $value',
              style: TextStyle(
                color: Theme.of(context).colorScheme.onPrimary,
                fontSize: 25,
              ),
            ),
          ),
        ),
        const SizedBox(height: 10),
        ElevatedButton(
          onPressed: () {
            context.read<QuizProvider>().restart();
          },
          child: const Text('Заново'),
        )
      ],
    );
  }
}
