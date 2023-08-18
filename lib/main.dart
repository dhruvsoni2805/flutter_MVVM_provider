import 'package:flutter/material.dart';
import 'package:mvvm_provider/utils/routes/routes/routes.dart';
import 'package:mvvm_provider/utils/routes/routes/routes_name.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Provider on MVVM Architecture Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(useMaterial3: true),
      darkTheme: ThemeData.dark(useMaterial3: true),
      themeMode: ThemeMode.system,
      initialRoute: RouteName.loginscreen,
      onGenerateRoute: Routes.generateRoute,
    );
  }
}
