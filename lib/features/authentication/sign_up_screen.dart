import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tictok/constants/gaps.dart';
import 'package:tictok/constants/sizes.dart';
import 'package:tictok/features/authentication/login_screen.dart';
import 'package:tictok/features/authentication/username_screen.dart';
import 'package:tictok/features/authentication/widgets/auth_button.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  void _loginTap(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const LoginScreen(),
      ),
    );
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
              'sign up for TikTok',
              style: TextStyle(
                  fontSize: Sizes.size28, fontWeight: FontWeight.w700),
            ),
            Gaps.v20,
            Text(
              'Create a profile, follow other accounts, make your own videos, and more.',
              style: TextStyle(
                fontSize: Sizes.size16,
                color: Colors.black54,
              ),
              textAlign: TextAlign.center,
            ),
            Gaps.v40,
            AuthButton(
                route: UserNameScreen(),
                icon: FaIcon(FontAwesomeIcons.user),
                text: "Use email & password"),
            AuthButton(
                route: UserNameScreen(),
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
            const Text('Already have an account?'),
            Gaps.h4,
            GestureDetector(
              onTap: () => _loginTap(context),
              child: Text(
                'Log in',
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
