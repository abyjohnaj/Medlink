import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart'; // 👈 Add this
import 'package:medlink/home.dart';
import 'firebase_options.dart'; // 👈 Add this after running flutterfire configure

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized(); // 👈 Required before Firebase init
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform, // 👈 Loads config
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}
