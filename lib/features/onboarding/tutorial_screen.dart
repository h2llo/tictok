import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tictok/constants/gaps.dart';
import 'package:tictok/constants/sizes.dart';

enum Direction { right, left }

enum Page { first, second }

class TutorialScreen extends StatefulWidget {
  const TutorialScreen({super.key});

  @override
  State<TutorialScreen> createState() => _TutorialScreenState();
}

class _TutorialScreenState extends State<TutorialScreen> {
  Direction _direction = Direction.right;
  Page _page = Page.first;

  void _onPanUpdate(DragUpdateDetails details) {
    if (details.delta.dx > 0) {
      // to the right
      setState(() {
        _direction = Direction.right;
      });
    } else {
      // to the left
      setState(() {
        _direction = Direction.left;
      });
    }
  }

  void _onPanEnd(DragEndDetails end) {
    if (_direction == Direction.left) {
      setState(() {
        _page = Page.second;
      });
    } else {
      setState(() {
        _page = Page.first;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanUpdate: _onPanUpdate,
      onPanEnd: _onPanEnd,
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: Sizes.size20,
            ),
            child: AnimatedCrossFade(
              firstChild: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Gaps.v40,
                  Text(
                    'Watch cool videos!',
                    style: TextStyle(
                      fontSize: Sizes.size40,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Gaps.v16,
                  Text(
                    'Videos are personalized for you based on what you watch, like, and share.',
                    style: TextStyle(
                      fontSize: Sizes.size20,
                      color: Colors.grey.shade600,
                    ),
                  )
                ],
              ),
              secondChild: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Gaps.v40,
                    Text(
                      'rule',
                      style: TextStyle(
                        fontSize: Sizes.size40,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Gaps.v16,
                    Text(
                      'Videos are personalized for you based on what you watch, like, and share.',
                      style: TextStyle(
                        fontSize: Sizes.size20,
                        color: Colors.grey.shade600,
                      ),
                    )
                  ]),
              crossFadeState: _page == Page.first
                  ? CrossFadeState.showFirst
                  : CrossFadeState.showSecond,
              duration: Duration(
                milliseconds: 300,
              ),
            ),
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          elevation: _page == Page.second ? 3 : 0,
          child: AnimatedOpacity(
            duration: Duration(milliseconds: 3),
            opacity: _page == Page.second ? 1 : 0,
            child: Padding(
              padding: EdgeInsets.symmetric(
                vertical: Sizes.size48,
                horizontal: Sizes.size24,
              ),
              child: CupertinoButton(
                onPressed: () {},
                color: Theme.of(context).primaryColor,
                child: Text('Enter the app!'),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
