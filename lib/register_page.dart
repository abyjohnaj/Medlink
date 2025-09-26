import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  String _role = "patient"; // default role

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Register")),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _emailController,
              decoration: InputDecoration(labelText: "Email"),
            ),
            SizedBox(height: 10),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(labelText: "Password"),
            ),
            SizedBox(height: 20),

            // Role Selection
            DropdownButton<String>(
              value: _role,
              items: [
                DropdownMenuItem(value: "patient", child: Text("Patient")),
                DropdownMenuItem(value: "hospital", child: Text("Hospital")),
              ],
              onChanged: (value) {
                setState(() {
                  _role = value!;
                });
              },
            ),
            SizedBox(height: 20),

            ElevatedButton(
              onPressed: () {
                              },
              child: Text("Register"),
            ),
          ],
        ),
      ),
    );
  }
}
