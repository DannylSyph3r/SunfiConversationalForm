import 'package:flutter/material.dart';
import 'package:flutterbotv2/dialog_flow.dart';
import 'package:flutterbotv2/views/get_started.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Flutter Facts',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.green).copyWith(secondary: Colors.green),
      ),
      home: GetStartedView(),
    );
  }
}
