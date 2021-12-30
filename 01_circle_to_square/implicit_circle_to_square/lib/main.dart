import 'package:flutter/material.dart';

void main() => runApp(const App());

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: CircleToSquareImplicitAnimationChallenge(),
    );
  }
}

class CircleToSquareImplicitAnimationChallenge extends StatefulWidget {
  const CircleToSquareImplicitAnimationChallenge({Key? key}) : super(key: key);

  @override
  State<CircleToSquareImplicitAnimationChallenge> createState() =>
      _CircleToSquareImplicitAnimationChallengeState();
}

class _CircleToSquareImplicitAnimationChallengeState
    extends State<CircleToSquareImplicitAnimationChallenge> {
  double widthBox = 40.0;
  final duration = const Duration(seconds: 1);
  bool animated = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          setState(() {
            widthBox = 250.0;
            animated = !animated;
          });
        },
        child: AnimatedAlign(
          duration: duration,
          alignment:
              animated == false ? Alignment.bottomRight : Alignment.topCenter,
          child: AnimatedContainer(
            duration: duration,
            margin: animated == false
                ? const EdgeInsets.only(bottom: 30, right: 30)
                : const EdgeInsets.only(top: 30),
            decoration: BoxDecoration(
              // shape: animated == false ? BoxShape.circle : BoxShape.rectangle,
              borderRadius: BorderRadius.circular(animated == false ? 50 : 0),
              color: Colors.redAccent,
            ),
            height: 40,
            width: animated == false ? 40.0 : 150.0,
          ),
        ),
      ),
    );
  }
}
