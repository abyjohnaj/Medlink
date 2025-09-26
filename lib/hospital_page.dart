import 'package:flutter/material.dart';

class HospitalPage extends StatelessWidget {
  const HospitalPage({super.key});

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
