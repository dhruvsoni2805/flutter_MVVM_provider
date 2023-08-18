import 'package:flutter/material.dart';

import '../utils/routes/utlis.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton.icon(
            onPressed: () {
              // Utils.FlushBarErrorMessage('hey', context);
              Utils.snackBarMessage("message is mine", context);
              // Utils.toastMessage("message", context);
            },
            icon: Icon(Icons.output),
            label: Text("Home Screen")),
      ),
    );
  }
}
