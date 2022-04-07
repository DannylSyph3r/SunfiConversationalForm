import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutterbotv2/views/upload_documents.dart';
import 'package:flutterbotv2/views/welcome_view.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Flutter Facts',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'SFProDisplay',
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blue).copyWith(secondary: Colors.blue),
      ),
      home: const WelcomeView(key: null,),
    );
  }
}
