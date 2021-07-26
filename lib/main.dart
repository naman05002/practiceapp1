import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:practiceapp/screens/wrapper.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // Set default `_initialized` and `_error` state to false
  bool _initialized = false;
  bool _error = false;

  // Define an async function to initialize FlutterFire
  void initializeFlutterFire() async {
    try {
      // Wait for Firebase to initialize and set `_initialized` state to true
      await Firebase.initializeApp();
      setState(() {
        _initialized = true;
      });
    } catch (e) {
      // Set `_error` state to true if Firebase initialization fails
      setState(() {
        _error = true;
      });
    }
  }

  @override
  void initState() {
    initializeFlutterFire();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // Show error message if initialization failed
    if (_error) {
      return MaterialApp(
        home: Scaffold(
          body: Text('it is an error'),
        ),
      );
    }

    // Show a loader until FlutterFire is initialized
    if (!_initialized) {
      return MaterialApp(
        home: Center(
          child: SpinKitCircle(
            color: Colors.blue.shade800,
            size: 50.0,
          ),
        ),
      );
    }

    return MaterialApp(
      home: Wrapper(),
    );
  }
}
