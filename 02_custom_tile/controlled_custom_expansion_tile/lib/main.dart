import 'package:flutter/material.dart';

void main() => runApp(const App());

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: CustomExpansionTileControlledAnimationChallenge(),
    );
  }
}

class CustomExpansionTileControlledAnimationChallenge extends StatefulWidget {
  const CustomExpansionTileControlledAnimationChallenge({Key? key})
      : super(key: key);

  @override
  _CustomExpansionTileControlledAnimationChallengeState createState() =>
      _CustomExpansionTileControlledAnimationChallengeState();
}

class _CustomExpansionTileControlledAnimationChallengeState
    extends State<CustomExpansionTileControlledAnimationChallenge> {
  @override
  Widget build(BuildContext context) {
    return const Material(
      child: HomePageBody(),
    );
  }
}

class HomePageBody extends StatelessWidget {
  const HomePageBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: ListView.builder(
        itemCount: 100,
        itemBuilder: (context, index) => CustomExpansionTile(
          title: "Title $index",
          subTitle:
              "Ut quis nisi eu dolore quis non dolore exercitation veniam culpa adipisicing. Id mollit minim labore consequat id id eiusmod labore sit et occaecat ad est. Laboris eiusmod nulla enim commodo irure aute adipisicing labore.",
        ),
      ),
    );
  }
}

class CustomExpansionTile extends StatefulWidget {
  final String title;
  final String subTitle;

  const CustomExpansionTile({
    Key? key,
    required this.title,
    required this.subTitle,
  }) : super(key: key);

  @override
  State<CustomExpansionTile> createState() => _CustomExpansionTileState();
}

class _CustomExpansionTileState extends State<CustomExpansionTile>
    with TickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: AnimatedBuilder(
        animation: _animationController,
        builder: (BuildContext context, Widget? child) => GestureDetector(
          onTap: () => _animationController.value == 0
              ? _animationController.forward()
              : _animationController.reverse(),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(child: Text(widget.title)),
                  RotationTransition(
                    turns: Tween(
                      begin: 0.5,
                      end: 0.0,
                    ).animate(_animationController),
                    child: const Icon(Icons.keyboard_arrow_down),
                  ),
                ],
              ),
              ClipRect(
                child: Align(
                  heightFactor: _animationController.value,
                  child: Column(
                    children: [
                      const FlutterLogo(size: 36),
                      Text(widget.subTitle),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
