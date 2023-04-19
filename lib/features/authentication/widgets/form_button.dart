import 'package:flutter/material.dart';
import 'package:tictok/constants/sizes.dart';

class FormButton extends StatelessWidget {
  const FormButton({
    super.key,
    required this.disabled,
    this.buttonName = 'Next',
  });
  final bool disabled;
  final String buttonName;

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 1,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 400),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Sizes.size20),
          color:
              disabled ? Colors.grey.shade300 : Theme.of(context).primaryColor,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: Sizes.size16,
          ),
          child: AnimatedDefaultTextStyle(
            style: TextStyle(
              color: disabled ? Colors.grey.shade600 : Colors.white,
              fontWeight: FontWeight.w500,
            ),
            duration: const Duration(milliseconds: 400),
            child: Text(
              buttonName,
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
