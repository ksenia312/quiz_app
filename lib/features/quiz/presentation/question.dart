part of 'screen/quiz_screen.dart';

class _QuestionHomeBody extends StatefulWidget {
  const _QuestionHomeBody({
    Key? key,
    required this.question,
  }) : super(key: key);

  final Question question;

  @override
  State<_QuestionHomeBody> createState() => _QuestionHomeBodyState();
}

class _QuestionHomeBodyState extends State<_QuestionHomeBody>
    with SingleTickerProviderStateMixin {
  List<String> get _variants => widget.question.variants;

  int get _variantsCount => _variants.length;

  late final AnimationController _controller = AnimationController(
    duration: const Duration(milliseconds: 200),
    vsync: this,
  )..forward();

  late final _offsetAnimations = List.generate(
    _variantsCount,
    (index) => Tween<Offset>(
      begin: const Offset(-0.1, 0.0),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(
          (1 / _variantsCount) * index,
          (1 / _variantsCount) * (index + 1),
          curve: Curves.easeInExpo,
        ),
      ),
    ),
  );

  late final _opacityAnimations = List.generate(
    _variantsCount,
    (index) => Tween<double>(
      begin: 0.5,
      end: 1.0,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(
          (1 / _variantsCount) * index,
          (1 / _variantsCount) * (index + 1),
          curve: Curves.easeInExpo,
        ),
      ),
    ),
  );

  @override
  void didUpdateWidget(covariant _QuestionHomeBody oldWidget) {
    if (widget.question.name != oldWidget.question.name) {
      _controller
        ..reset()
        ..forward();
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(
              vertical: 25.0,
              horizontal: 15.0,
            ),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
              borderRadius: BorderRadius.circular(2),
            ),
            child: Center(
              child: Text(
                widget.question.name,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onPrimary,
                  fontSize: 20,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          ...List.generate(
            _variantsCount,
            (index) => Padding(
              padding: const EdgeInsets.only(
                bottom: 15.0,
              ),
              child: GestureDetector(
                onTap: () {
                  context.read<QuizProvider>().fetchNextQuestion(
                        answer: index + 1,
                      );
                },
                child: FadeTransition(
                  opacity: _opacityAnimations[index],
                  child: SlideTransition(
                    position: _offsetAnimations[index],
                    child: Container(
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.secondary,
                        borderRadius: BorderRadius.circular(2),
                      ),
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        _variants[index],
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
