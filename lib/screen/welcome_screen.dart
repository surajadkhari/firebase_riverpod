import 'package:firebase_riverpod/forms/loginForm.dart';
import 'package:firebase_riverpod/forms/register_form.dart';
import 'package:firebase_riverpod/provider/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Visit nepal"),
        centerTitle: true,
      ),
      body: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 180,
              width: 300,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                          "https://myrepublica.nagariknetwork.com/uploads/media/VNYRealLogo_20200103115449.jpg"))),
            ),
            SizedBox(
              height: 10,
            ),
            Consumer(builder: (context, watch, child) {
              bool _isRegister = watch(isRegisterinLoadingProvider).state;
              return SizedBox(
                height: 50,
                width: 300,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: Colors.purple,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                  onPressed: () async {
                    context.read(isRegisterinLoadingProvider).state = true;
                    Future.delayed(Duration(seconds: 2), () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) {
                            return RegisterForm();
                          },
                        ),
                      );
                      context.read(isRegisterinLoadingProvider).state = false;
                    });
                  },
                  child: _isRegister
                      ? CircularProgressIndicator()
                      : Text("Register"),
                ),
              );
            }),
            Consumer(builder: (context, watch, child) {
              bool _isLogin = watch(isLoginLoadingProvider).state;
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  height: 50,
                  width: 300,
                  child: ElevatedButton(
                    onPressed: () {
                      context.read(isLoginLoadingProvider).state = true;

                      Future.delayed(Duration(seconds: 1), () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) {
                              return LoginForm();
                            },
                          ),
                        );
                        context.read(isLoginLoadingProvider).state = false;
                      });
                    },
                    child: _isLogin
                        ? CircularProgressIndicator(
                            color: Colors.white,
                          )
                        : Text("Login"),
                  ),
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}
