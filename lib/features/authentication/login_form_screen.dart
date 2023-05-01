import 'package:flutter/material.dart';
import 'package:tictok/constants/gaps.dart';
import 'package:tictok/constants/sizes.dart';
import 'package:tictok/features/authentication/widgets/form_button.dart';
import 'package:tictok/features/onboarding/interests_screen.dart';

class LoginFormScreen extends StatefulWidget {
  const LoginFormScreen({super.key});

  @override
  State<LoginFormScreen> createState() => _LoginFormScreenState();
}

class _LoginFormScreenState extends State<LoginFormScreen> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void _onLoginTap() {
    if (_formKey.currentState != null) {
      if (_formKey.currentState!.validate()) {
        _formKey.currentState!.save();
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(
              builder: (context) => InterestScreen(),
            ), (route) {
          return false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Log in'),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: Sizes.size36,
        ),
        child: Form(
            key: _formKey,
            child: Column(
              children: [
                Gaps.v28,
                TextFormField(
                  decoration: InputDecoration(hintText: 'Email'),
                  validator: (value) {
                    if (value != null && value.isEmpty) return 'no';
                    return null;
                  },
                  onSaved: (newValue) => print(newValue),
                ),
                Gaps.v16,
                TextFormField(
                  decoration: InputDecoration(hintText: 'Password'),
                  validator: (value) {
                    if (value != null && value.isEmpty) return 'no';
                    return null;
                  },
                  onSaved: (newValue) => print(newValue),
                ),
                Gaps.v28,
                GestureDetector(
                  onTap: _onLoginTap,
                  child: FormButton(
                    disabled: false,
                    buttonName: 'log in',
                  ),
                )
              ],
            )),
      ),
    );
  }
}
