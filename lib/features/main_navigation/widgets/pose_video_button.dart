import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tictok/constants/sizes.dart';

class PostVideoButton extends StatelessWidget {
  const PostVideoButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Positioned(
          left: Sizes.size14,
          child: Container(
            height: Sizes.size24,
            width: Sizes.size32,
            padding: EdgeInsets.symmetric(
              horizontal: Sizes.size8,
            ),
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(
                Sizes.size6,
              ),
            ),
          ),
        ),
        Positioned(
          right: Sizes.size12,
          child: Container(
            height: Sizes.size24,
            width: Sizes.size32,
            padding: EdgeInsets.symmetric(
              horizontal: Sizes.size8,
            ),
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(
                Sizes.size6,
              ),
            ),
          ),
        ),
        Container(
          height: Sizes.size24,
          padding: EdgeInsets.symmetric(
            horizontal: Sizes.size12,
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(
              Sizes.size6,
            ),
          ),
          child: Center(
              child: FaIcon(
            FontAwesomeIcons.plus,
            size: Sizes.size16 + Sizes.size2,
          )),
        ),
      ],
    );
  }
}
