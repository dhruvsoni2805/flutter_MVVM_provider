import 'package:flutter/material.dart';
import 'package:mvvm_provider/utils/routes/routes_name.dart';
import 'package:provider/provider.dart';

import '../viewmodel/user_view_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final userpref = Provider.of<UserViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Screen"),
        actions: [
          IconButton(
              onPressed: () {
                userpref.remove().then((value) {
                  Navigator.pushReplacementNamed(
                      context, RouteName.loginscreen);
                });
              },
              icon: Icon(Icons.logout))
        ],
      ),
      body: Center(
        child: InkWell(
          onTap: () {
            userpref.remove().then((value) {
              Navigator.pushReplacementNamed(context, RouteName.loginscreen);
            });
          },
          child: Text("Log Out"),
        ),
      ),
    );
  }
}
