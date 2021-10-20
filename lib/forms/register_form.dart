import 'package:firebase_auth/firebase_auth.dart';

import 'package:firebase_riverpod/provider/auth_provider.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/src/provider.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({Key? key}) : super(key: key);

  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registration'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            child: ListView(
              shrinkWrap: true,
              children: [
                TextField(
                  controller: _emailController,
                  obscureText: false,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Enter your email"),
                ),
                SizedBox(
                  height: 20,
                ),
                TextField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Enter your password"),
                ),
                SizedBox(
                  height: 20,
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: ElevatedButton(
                    onPressed: () async {
                      User? user = await AuthService().registerWithEmail(
                          email: _emailController.text,
                          password: _passwordController.text);
                      if (user != null) {
                        context.read(userProvider).state = user;
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) {
                              return Addpost();
                            },
                          ),
                        );
                      }
                    },
                    child: Text("Register"),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
