import 'package:flutter/material.dart';
import 'package:mvvm_provider/viewmodel/login_provider.dart';
import 'package:mvvm_provider/viewmodel/register_provider.dart';
import 'package:mvvm_provider/viewmodel/user_view_model.dart';
import 'package:provider/provider.dart';

import 'utils/routes/routes.dart';
import 'utils/routes/routes_name.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => LoginScreenProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => RegisterScreenProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => UserViewModel(),
        ),
      ],
      child: Builder(
        builder: (context) {
          return MaterialApp(
            title: 'Flutter Provider on MVVM Architecture Demo',
            debugShowCheckedModeBanner: false,
            theme: ThemeData.light(useMaterial3: true),
            darkTheme: ThemeData.dark(useMaterial3: true),
            themeMode: ThemeMode.system,
            initialRoute: RouteName.splashscreen,
            onGenerateRoute: Routes.generateRoute,
          );
        },
      ),
    );
  }
}
