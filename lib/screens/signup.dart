import 'package:chat_app/services/api_calls.dart';
import 'package:chat_app/widgets/widgets.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignUP extends StatefulWidget {
  const SignUP({super.key});

  @override
  State<SignUP> createState() => _SignUPState();
}

class _SignUPState extends State<SignUP> {
  bool isLoading = false;
  final _authMethod = ApiCalls();
  final formKey = GlobalKey<FormState>();
  final TextEditingController _userName = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  signMeUp() {
    if (formKey.currentState!.validate()) {
      setState(() {
        isLoading = true;
      });
    }
    _authMethod
        .signInWithEmailandPassword(
            _email.text.toString(), _password.text.toString())
        .then((value) => print(value));
  }

  @override
  void dispose() {
    super.dispose();
    _email.dispose();
    _password.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: const Text('SignUp'),
            backgroundColor: Colors.blue,
          ),
          body: isLoading
              ? Center(
                  child: Container(child: CircularProgressIndicator.adaptive()))
              : Container(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Form(
                        key: formKey,
                        child: Column(
                          children: [
                            TextFormField(
                                validator: (value) {
                                  return value!.isEmpty || value!.length < 4
                                      ? 'Username is not acceptable'
                                      : null;
                                },
                                controller: _userName,
                                decoration:
                                    textInputDecorationWidget('username')),
                            TextFormField(
                                validator: (value) {
                                  return RegExp(
                                              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                          .hasMatch(value!)
                                      ? null
                                      : "Email is not acceptable";
                                },
                                controller: _email,
                                decoration: textInputDecorationWidget('email')),
                            TextFormField(
                                validator: (value) {
                                  return value!.length > 6
                                      ? null
                                      : 'Password should contains 7 characters or more';
                                },
                                obscureText: true,
                                controller: _password,
                                decoration:
                                    textInputDecorationWidget('password')),
                          ],
                        ),
                      ),
                      const SizedBox(height: 15),
                      const SizedBox(height: 5),
                      GestureDetector(
                        onTap: () {
                          signMeUp();
                        },
                        child: Container(
                          padding: const EdgeInsets.all(5),
                          alignment: Alignment.center,
                          decoration: buttonStyling(),
                          width: MediaQuery.of(context).size.width,
                          child: const Text(
                            'Register',
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                      ),
                      const SizedBox(height: 5),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Already have an account? ',
                            style: TextStyle(fontSize: 17),
                          ),
                          Text(
                            'SignIn now',
                            style: TextStyle(
                                decoration: TextDecoration.underline,
                                fontSize: 17),
                          )
                        ],
                      )
                    ],
                  ),
                )),
    );
  }
}
