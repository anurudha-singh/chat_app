import 'package:chat_app/widgets/widgets.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: const Text('SignIn'),
            backgroundColor: Colors.blue,
          ),
          body: Container(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(decoration: textInputDecorationWidget('email')),
                TextField(decoration: textInputDecorationWidget('password')),
                const SizedBox(height: 5),
                Container(
                  alignment: Alignment.centerRight,
                  child: const Text(
                    'Forgot Password?',
                    style: TextStyle(
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ),
                const SizedBox(height: 5),
                Container(
                  padding: const EdgeInsets.all(5),
                  alignment: Alignment.center,
                  decoration: buttonStyling(),
                  width: MediaQuery.of(context).size.width,
                  child: const Text(
                    'Sign In',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                  padding: const EdgeInsets.all(5),
                  alignment: Alignment.center,
                  decoration: buttonStyling(),
                  width: MediaQuery.of(context).size.width,
                  child: const Text(
                    'Sign In with Google',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                const SizedBox(height: 5),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Don\'t have an account? ',
                      style: TextStyle(fontSize: 17),
                    ),
                    Text(
                      'Register now',
                      style: TextStyle(
                          decoration: TextDecoration.underline, fontSize: 17),
                    )
                  ],
                )
              ],
            ),
          )),
    );
  }
}
