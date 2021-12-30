import 'package:flutter/material.dart';

void main() => runApp(const App());

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: CustomExpansionTileImplicitAnimationChallenge(),
    );
  }
}

class CustomExpansionTileImplicitAnimationChallenge extends StatelessWidget {
  const CustomExpansionTileImplicitAnimationChallenge({Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Material(
      child: TheBody(),
    );
  }
}

class TheBody extends StatelessWidget {
  const TheBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 50,
      itemBuilder: (context, index) {
        return CustomExpansionTile(
          title: "Title $index",
          description:
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
        );
      },
    );
  }
}

class CustomExpansionTile extends StatefulWidget {
  final String title;
  final String description;

  const CustomExpansionTile({
    Key? key,
    required this.title,
    required this.description,
  }) : super(key: key);

  @override
  _CustomExpansionTileState createState() => _CustomExpansionTileState();
}

class _CustomExpansionTileState extends State<CustomExpansionTile> {
  bool isExpanded = false;

  final Duration duration = const Duration(seconds: 1);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          setState(() {
            isExpanded = !isExpanded;
          });
        },
        child: AnimatedContainer(
          duration: duration,
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(widget.title),
                  ),
                  AnimatedRotation(
                    duration: duration,
                    turns: isExpanded ? 0.5 : 0,
                    child: const Icon(Icons.keyboard_arrow_down_rounded),
                  ),
                ],
              ),
              ClipRect(
                child: AnimatedAlign(
                  duration: duration,
                  alignment: Alignment.center,
                  heightFactor: isExpanded ? 1 : 0,
                  child: Column(
                    children: [
                      const FlutterLogo(),
                      Text(widget.description),
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
