import 'package:flutter/material.dart';
import 'package:tictok/constants/sizes.dart';

class InterestButton extends StatefulWidget {
  const InterestButton({
    super.key,
    required this.interest,
  });

  final String interest;

  @override
  State<InterestButton> createState() => _InterestButtonState();
}

class _InterestButtonState extends State<InterestButton> {
  bool _isSelected = false;

  void _onTap() {
    setState(() {
      _isSelected = !_isSelected;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onTap,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: Sizes.size16 + Sizes.size2,
          vertical: Sizes.size14,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.black.withOpacity(0.1)),
          borderRadius: BorderRadius.circular(Sizes.size28),
          boxShadow: [
            BoxShadow(
              color: _isSelected
                  ? Theme.of(context).primaryColor
                  : Colors.black.withOpacity(0.05),
              blurRadius: _isSelected ? 2 : 5,
              spreadRadius: _isSelected ? 2 : 5,
            )
          ],
        ),
        child: Text(
          widget.interest,
          style: TextStyle(
            color: _isSelected
                ? Theme.of(context).primaryColor.withOpacity(0.7)
                : Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
