import 'package:flutter/material.dart';
import 'package:flutterbotv2/views/welcome_view.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Flutter Facts',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'SFProDisplay',
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blue).copyWith(secondary: Colors.blue),
      ),
      home: const WelcomeView(),
    );
  }
}
