import 'package:flutter/material.dart';
import 'package:tictok/constants/gaps.dart';
import 'package:tictok/constants/sizes.dart';
import 'package:tictok/features/authentication/email_screen.dart';
import 'package:tictok/features/authentication/widgets/form_button.dart';

class UserNameScreen extends StatefulWidget {
  const UserNameScreen({super.key});

  @override
  State<UserNameScreen> createState() => _UserNameScreenState();
}

class _UserNameScreenState extends State<UserNameScreen> {
  final TextEditingController _usernameController = TextEditingController();
  String _username = '';

  @override
  void initState() {
    super.initState();
    _usernameController.addListener(() {
      setState(() {
        _username = _usernameController.text;
      });
    });
  }

  onNextTap() {
    if (_username.isEmpty) return;
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => const EmailScreen(),
    ));
  }

  @override
  void dispose() {
    _usernameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Sign up',
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: Sizes.size40,
          ),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Gaps.v36,
            const Text(
              'Create username',
              style: TextStyle(
                fontSize: Sizes.size24,
                fontWeight: FontWeight.w700,
              ),
            ),
            Gaps.v12,
            const Text(
              'You can always change this later',
              style: TextStyle(
                fontSize: Sizes.size16,
                color: Colors.black54,
              ),
            ),
            Gaps.v16,
            TextField(
              controller: _usernameController,
              cursorColor: Theme.of(context).primaryColor,
              decoration: InputDecoration(
                hintText: "Username",
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.grey.shade400,
                  ),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.grey.shade400,
                  ),
                ),
              ),
            ),
            Gaps.v32,
            GestureDetector(
                onTap: onNextTap,
                child: FormButton(
                  buttonName: 'Next',
                  disabled: _username.isEmpty,
                ))
          ]),
        ),
      ),
    );
  }
}
