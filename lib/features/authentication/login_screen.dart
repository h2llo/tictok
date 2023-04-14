import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tictok/constants/gaps.dart';
import 'package:tictok/constants/sizes.dart';
import 'widgets/auth_button.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  void _signUpTap(BuildContext context) {
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: Sizes.size40,
          ),
          child: Column(children: const [
            Gaps.v80,
            Text(
              'Log in to TikTok',
              style: TextStyle(
                  fontSize: Sizes.size28, fontWeight: FontWeight.w700),
            ),
            Gaps.v20,
            Text(
              'Manage your account, check notifications, comment on videos, and more',
              style: TextStyle(
                fontSize: Sizes.size16,
                color: Colors.black54,
              ),
              textAlign: TextAlign.center,
            ),
            Gaps.v40,
            AuthButton(
                route: Text('null'),
                icon: FaIcon(FontAwesomeIcons.user),
                text: "Use phone / email / username"),
            AuthButton(
                route: Text('null'),
                icon: FaIcon(FontAwesomeIcons.apple),
                text: "Continue with Apple"),
          ]),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.grey.shade200,
        elevation: 1.4,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: Sizes.size32),
          child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            const Text('Don\'t have an account?'),
            Gaps.h4,
            GestureDetector(
              onTap: () {
                _signUpTap(context);
              },
              child: Text(
                'Sign up',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
