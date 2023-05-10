import 'package:flutter/material.dart';
import 'package:wecare/utils/config.dart';
import 'package:wecare/components/button.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:wecare/components/sign_upform.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  final _emailCOntroller = TextEditingController();
  final _passCOntroller = TextEditingController();
  bool obsecurePass = true;

  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          TextFormField(
            controller: _emailCOntroller,
            keyboardType: TextInputType.emailAddress,
            cursorColor: Config.primaryColor,
            decoration: const InputDecoration(
              hintText: 'Email Address',
              labelText: 'Email',
              alignLabelWithHint: true,
              prefixIcon: Icon(Icons.email_outlined),
              prefixIconColor: Config.primaryColor,
            ),
          ),
          Config.spaceSmall,
          TextFormField(
            controller: _passCOntroller,
            keyboardType: TextInputType.visiblePassword,
            obscureText: obsecurePass,
            cursorColor: Config.primaryColor,
            decoration: InputDecoration(
              hintText: 'Password',
              labelText: 'Password',
              alignLabelWithHint: true,
              prefixIcon: const Icon(Icons.lock_outline),
              prefixIconColor: Config.primaryColor,
              suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    obsecurePass = !obsecurePass;
                  });
                },
                icon: obsecurePass
                    ? const Icon(
                        Icons.visibility_off_outlined,
                        color: Colors.black,
                      )
                    : const Icon(
                        Icons.visibility_outlined,
                        color: Config.primaryColor,
                      ),
              ),
            ),
          ),
          Config.spaceSmall,
          Button(
            width: double.infinity,
            title: 'Sign In',
            onPressed: () async {
              try {
                // Call Firebase sign-in method with email and password
                final UserCredential userCredential =
                    await _auth.signInWithEmailAndPassword(
                  email: _emailCOntroller.text.trim(),
                  password: _passCOntroller.text,
                );

                // Check if sign-in was successful
                if (userCredential.user != null) {
                  // Navigate to the main screen
                  Navigator.of(context).pushNamed('main');
                }
              } catch (e) {
                // Handle sign-in error (display error message, etc.)
                print('Sign-in error: $e');
              }
            },
            disable: false,
          ),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Config.primaryColor),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SignUpForm(),
                  ),
                );
              },
              child: const Text('Sign Up',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  )))
        ],
      ),
    );
  }
}
