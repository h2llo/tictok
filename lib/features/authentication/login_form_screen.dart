import 'package:flutter/material.dart';
import 'package:tictok/constants/gaps.dart';
import 'package:tictok/constants/sizes.dart';
import 'package:tictok/features/authentication/widgets/form_button.dart';

class LoginFormScreen extends StatefulWidget {
  const LoginFormScreen({super.key});

  @override
  State<LoginFormScreen> createState() => _LoginFormScreenState();
}

class _LoginFormScreenState extends State<LoginFormScreen> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void _onLoginTap() {
    if (_formKey.currentState != null) {
      _formKey.currentState!.validate();
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
                    return 'no';
                  },
                ),
                Gaps.v16,
                TextFormField(
                  decoration: InputDecoration(hintText: 'Password'),
                  validator: (value) {
                    return 'no';
                  },
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
