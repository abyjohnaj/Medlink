import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:medlink/login.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  String _role = "patient"; // default role
  bool _isLoading = false;

  Future<void> _registerUser() async {
    setState(() => _isLoading = true);

    try {
      UserCredential userCred = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );

      await FirebaseFirestore.instance
          .collection("users")
          .doc(userCred.user!.uid)
          .set({
        "email": _emailController.text.trim(),
        "role": _role,
        "createdAt": DateTime.now(),
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Registered as $_role successfully!")),
      );

      // Redirect to Login
      Navigator.pushReplacementNamed(context, '/');
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error: $e")),
      );
    }

    setState(() => _isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Register")),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Create an Account", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                SizedBox(height: 20),

                TextField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    labelText: "Email",
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 10),

                TextField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: "Password",
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 20),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Register as: "),
                    SizedBox(width: 10),
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
                  ],
                ),
                SizedBox(height: 20),

                _isLoading
                    ? CircularProgressIndicator()
                    : ElevatedButton(
                        onPressed: _registerUser,
                        child: Text("Register"),
                      ),

                SizedBox(height: 10),
                TextButton(
                  onPressed: () {
                    Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context) => LoginPage(),
  ),
);

                  },
                  child: Text("Already have an account? Login"),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
