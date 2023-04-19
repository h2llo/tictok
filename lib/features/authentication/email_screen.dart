import 'package:flutter/material.dart';
import 'package:tictok/constants/gaps.dart';
import 'package:tictok/constants/sizes.dart';
import 'package:tictok/features/authentication/password_screen.dart';
import 'package:tictok/features/authentication/username_screen.dart';
import 'package:tictok/features/authentication/widgets/form_button.dart';

class EmailScreen extends StatefulWidget {
  const EmailScreen({super.key});

  @override
  State<EmailScreen> createState() => _EmailScreenState();
}

class _EmailScreenState extends State<EmailScreen> {
  final TextEditingController _emailaddressController = TextEditingController();
  String _emailaddress = '';

  @override
  void initState() {
    super.initState();
    _emailaddressController.addListener(() {
      setState(() {
        _emailaddress = _emailaddressController.text;
      });
    });
  }

  void _onNextTap() {
    if (_emailaddress.isEmpty) return;
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => const UserNameScreen(),
    ));
  }

  @override
  void dispose() {
    _emailaddressController.dispose();
    super.dispose();
  }

  String? _isEmailvalid() {
    if (_emailaddress.isEmpty) return null;
    final regExp = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    if (!regExp.hasMatch(_emailaddress)) return "email not valid";
    return null;
  }

  void _onScaffoldTap() {
    FocusScope.of(context).unfocus();
  }

  void _onSubmit() {
    if (_emailaddress.isEmpty || _isEmailvalid() != null) return;
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const PassWordScreen(),
        ));
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
                'What is your email',
                style: TextStyle(
                  fontSize: Sizes.size24,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Gaps.v12,
              Gaps.v16,
              TextField(
                keyboardType: TextInputType.emailAddress,
                autocorrect: false,
                onEditingComplete: _onSubmit,
                controller: _emailaddressController,
                cursorColor: Theme.of(context).primaryColor,
                decoration: InputDecoration(
                  hintText: "Email",
                  errorText: _isEmailvalid(),
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
                  onTap: _onSubmit,
                  child: FormButton(
                    buttonName: 'Next',
                    disabled: _emailaddress.isEmpty || _isEmailvalid() != null,
                  ))
            ]),
          ),
        ),
      ),
    );
  }
}
