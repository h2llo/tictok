import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tictok/constants/sizes.dart';

class AuthButton extends StatelessWidget {
  final String text;
  final FaIcon icon;
  final Widget route;

  const AuthButton(
      {super.key, required this.text, required this.icon, required this.route});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => route,
      )),
      child: FractionallySizedBox(
        widthFactor: 1,
        child: Container(
          margin: const EdgeInsets.only(bottom: Sizes.size14),
          decoration: BoxDecoration(
              border: Border.all(
            color: Colors.grey.shade400,
            width: Sizes.size1,
          )),
          child: Padding(
            padding: const EdgeInsets.all(Sizes.size14),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: icon,
                ),
                Text(
                  text,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
