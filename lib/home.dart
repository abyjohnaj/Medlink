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
body: Padding(
  padding: const EdgeInsets.all(8.0),
  child: Column(
    children: [
      Text("Welcome to Medlink", style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25, fontStyle: FontStyle.italic), ),

     Container(
  height: 300,
  width: double.infinity,
  decoration: BoxDecoration(
    color: Color.fromARGB(255, 0, 121, 107),
    borderRadius: BorderRadius.circular(20), 
  ),
  child: Padding(
    padding: const EdgeInsets.all(16.0), 
    child: Center(
      child: Text(
        "Medlink is a platform that helps patients, especially migrants, keep all their medical records safe and easily accessible. Instead of carrying paper files, patients can have their prescriptions, test results, and visit history stored in one place. Doctors and hospitals can quickly access this information, making treatment faster and more accurate. The aim of Medlink is to make healthcare simpler, more connected, and patient-friendly.",
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 15,
          color: Colors.white,
        ),
        textAlign: TextAlign.justify, 
      ),
    ),
  ),
),


    ],
  ),
),
      
    );
  }
}