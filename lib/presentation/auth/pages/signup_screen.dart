import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spotify_flutter_bloc/common/widgets/appbar/basic_app_bar.dart';
import 'package:spotify_flutter_bloc/common/widgets/button/basic_app_button.dart';
import 'package:spotify_flutter_bloc/core/configs/assets/app_vectors.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: _sigInText(context),
      appBar: BasicAppBar(
        title: SvgPicture.asset(
          AppVectors.logo,
          height: 40,
          width: 40,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _registerText(),
            const SizedBox(
              height: 50,
            ),
            _fullNameField(context),
            const SizedBox(
              height: 20,
            ),
            _emailField(context),
            const SizedBox(
              height: 20,
            ),
            _passwordField(context),
            const SizedBox(
              height: 20,
            ),
            BasicAppButton(
                onPressed: (){},
                title: 'Create Account'
            ),
          ],
        ),
      ),
    );
  }

  Widget _registerText() {
    return const Text(
      'Register',
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 25,
      ),
      textAlign: TextAlign.center,
    );
  }

  Widget _fullNameField(BuildContext context) {
    return TextField(
      decoration: const InputDecoration(
          hintText: 'Full Name'
      )
          .applyDefaults(Theme.of(context).inputDecorationTheme),
    );
  }
  Widget _emailField(BuildContext context) {
    return TextField(
      decoration: const InputDecoration(
          hintText: 'Enter Email'
      )
          .applyDefaults(Theme.of(context).inputDecorationTheme),
    );
  }
  Widget _passwordField(BuildContext context) {
    return TextField(
      decoration: const InputDecoration(
          hintText: 'Enter Email'
      )
          .applyDefaults(Theme.of(context).inputDecorationTheme),
    );
  }
  Widget _sigInText(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 30
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Do you have account ?',
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 14,
            ),
          ),
          TextButton(
              onPressed: (){},
              child: const Text(
                'Sign In',
                ///style: TextStyle(),
              ),
          ),
        ],
      ),
    );
  }
}
