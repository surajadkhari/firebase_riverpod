import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_riverpod/screen/addpost.dart';
import 'package:firebase_riverpod/provider/auth_provider.dart';
import 'package:firebase_riverpod/services/auth_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/src/provider.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
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
                ElevatedButton(
                  onPressed: () async {
                    User? user = await AuthService().signInWithEmail(
                        email: _emailController.text,
                        password: _passwordController.text);
                    if (user != null) {
                      // showDialog(
                      //     context: context,
                      //     builder: (context) {
                      //       return Container(
                      //         child: Text("Login sucessful"),
                      //       );
                      //     });

                      context.read(userProvider).state = user;
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) {
                            return Addpost();

                            // Addpost(email:user.eamil!)
                          },
                        ),
                      );
                    }
                  },
                  child: Text("Login"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
