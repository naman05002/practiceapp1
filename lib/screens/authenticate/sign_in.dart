import 'package:flutter/material.dart';
import 'package:practiceapp/services/auth.dart';
// import 'package:firebase_core/firebase_core.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _authorization = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade100,
      appBar: AppBar(
        backgroundColor: Colors.blue.shade700,
        elevation: 0.0,
        title: Text('Sign in to the App'),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 50),
        child: ElevatedButton(
            onPressed: () async {
              dynamic result = await _authorization.signinAnon();
              if (result == null) {
                print('Error Signing in');
              } else {
                print('Signed in');
                print(result);
              }
            },
            child: Text('Sign in Anonymously')),
      ),
    );
  }
}
