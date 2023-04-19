import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tictok/constants/gaps.dart';
import 'package:tictok/constants/sizes.dart';
import 'package:tictok/features/authentication/birthday_screen.dart';
import 'package:tictok/features/authentication/widgets/form_button.dart';

class PassWordScreen extends StatefulWidget {
  const PassWordScreen({super.key});

  @override
  State<PassWordScreen> createState() => _PassWordScreenState();
}

class _PassWordScreenState extends State<PassWordScreen> {
  final TextEditingController _passwordController = TextEditingController();
  String _password = '';
  bool _obscureText = true;

  @override
  void initState() {
    super.initState();
    _passwordController.addListener(() {
      setState(() {
        _password = _passwordController.text;
      });
    });
  }

  @override
  void dispose() {
    _passwordController.dispose();
    super.dispose();
  }

  bool _isPasswordValid() {
    return _password.isNotEmpty &&
        _password.length > 8 &&
        _password.length < 20;
  }

  void _onScaffoldTap() {
    FocusScope.of(context).unfocus();
  }

  void _onSubmit() {
    if (!_isPasswordValid()) return;
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const BirthdayScreen(),
        ));
  }

  void _onClear() {
    _passwordController.clear();
  }

  void _onEyeIconTap() {
    _obscureText = !_obscureText;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onScaffoldTap,
      child: Scaffold(
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
                'Password',
                style: TextStyle(
                  fontSize: Sizes.size24,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Gaps.v12,
              Gaps.v16,
              TextField(
                autocorrect: false,
                obscureText: _obscureText,
                onEditingComplete: _onSubmit,
                controller: _passwordController,
                cursorColor: Theme.of(context).primaryColor,
                decoration: InputDecoration(
                  suffix: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      GestureDetector(
                        onTap: _onClear,
                        child: FaIcon(
                          FontAwesomeIcons.solidCircleXmark,
                          color: Colors.grey.shade500,
                          size: Sizes.size20,
                        ),
                      ),
                      Gaps.h12,
                      GestureDetector(
                        onTap: _onEyeIconTap,
                        child: FaIcon(
                          FontAwesomeIcons.eye,
                          color:
                              _obscureText ? Colors.grey.shade500 : Colors.blue,
                          size: Sizes.size20,
                        ),
                      ),
                    ],
                  ),
                  hintText: "Password",
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
              Gaps.v12,
              const Text(
                'Your password must have: ',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Gaps.v12,
              Row(
                children: [
                  FaIcon(
                    FontAwesomeIcons.circleCheck,
                    size: Sizes.size20,
                    color: _isPasswordValid()
                        ? Colors.green
                        : Colors.grey.shade400,
                  ),
                  Gaps.h6,
                  Text(
                    '8 to 20 characters',
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: _isPasswordValid()
                            ? Colors.black
                            : Colors.grey.shade400),
                  )
                ],
              ),
              Gaps.v32,
              GestureDetector(
                  onTap: _onSubmit,
                  child: FormButton(
                    buttonName: 'Next',
                    disabled: !_isPasswordValid(),
                  ))
            ]),
          ),
        ),
      ),
    );
  }
}
