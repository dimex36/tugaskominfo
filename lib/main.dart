import 'package:flutter/material.dart';
import 'package:tugaskominfo/pages/home_page.dart';
import 'package:tugaskominfo/pages/info/reactive_info_page.dart';
import 'package:tugaskominfo/pages/login_page.dart';
import 'package:tugaskominfo/pages/splash_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Training',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blueGrey),
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashPage(),
        '/home': (context) => HomePage(),
        '/login': (context) => LoginPage(),
        '/info': (context) => ReactiveInfoPage(),
      },
    );
  }
}
