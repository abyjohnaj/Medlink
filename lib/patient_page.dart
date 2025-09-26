import 'package:flutter/material.dart';

class PatientPage extends StatelessWidget {
  const PatientPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 0, 121, 107),
        title: Center(child: Text("MEDLINK",style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),)),
 
      ),

    );
  }
}