import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: CircleToSquareControlledAnimationChallenge(),
    );
  }
}

class CircleToSquareControlledAnimationChallenge extends StatefulWidget {
  const CircleToSquareControlledAnimationChallenge({Key? key})
      : super(key: key);

  @override
  State<CircleToSquareControlledAnimationChallenge> createState() =>
      _CircleToSquareControlledAnimationChallengeState();
}

class _CircleToSquareControlledAnimationChallengeState
    extends State<CircleToSquareControlledAnimationChallenge>
    with TickerProviderStateMixin {
  double widthBox = 40.0;
  final duration = const Duration(seconds: 1);
  bool animated = false;

  late AnimationController _animationController;
  late Animation<Alignment> alignAnimation;
  late Animation<Size?> sizeAnimation;
  late Animation<BorderRadius?> borderAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat(reverse: true);

    sizeAnimation =
        SizeTween(begin: const Size(50, 50), end: const Size(150, 50))
            .animate(_animationController);

    alignAnimation =
        AlignmentTween(begin: Alignment.bottomRight, end: Alignment.topCenter)
            .animate(_animationController);

    borderAnimation = BorderRadiusTween(
      begin: BorderRadius.circular(50),
      end: BorderRadius.zero,
    ).animate(_animationController);
  }

  @override
  void dispose() {
    _animationController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: AnimatedBuilder(
          animation: _animationController,
          builder: (context, child) {
            return Align(
              alignment: alignAnimation.value,
              child: Container(
                margin: const EdgeInsets.only(bottom: 30, right: 30),
                decoration: BoxDecoration(
                  borderRadius: borderAnimation.value,
                  color: Colors.redAccent,
                ),
                height: sizeAnimation.value?.height,
                width: sizeAnimation.value?.width,
              ),
            );
          },
        ),
      ),
    );
  }
}
