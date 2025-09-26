import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:medlink/login.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const Home());
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 0, 121, 107),
        title: Center(child: Text("MEDLINK",style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),)),
  actions: [
    TextButton(onPressed: (){
     Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context) => LoginPage(),
  ),
);

    }, child: Text("Login",style: TextStyle(color: Colors.white),))
  ],
      ),

    );
  }
}