import 'package:flutter/material.dart';

class NoInternetException extends StatelessWidget {
  const NoInternetException({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "No Internet",
              style: TextStyle(fontSize: 30),
            ),
          ],
        ),
      ),
    );
  }
}
