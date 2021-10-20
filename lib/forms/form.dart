import 'package:firebase_riverpod/provider/formprovider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FormFieldSample extends StatefulWidget {
  const FormFieldSample({Key? key}) : super(key: key);

  @override
  _FormFieldSampleState createState() => _FormFieldSampleState();
}

class _FormFieldSampleState extends State<FormFieldSample> {
  final _formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("TextForm Field"),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Consumer(builder: (context, watch, child) {
                bool isobsCure = watch(passwordObscureProvider);
                print(isobsCure);
                return TextFormField(
                  obscureText: isobsCure,
                  keyboardType: TextInputType.visiblePassword,
                  decoration: InputDecoration(
                    hintText: "Enter Password",
                    prefixIcon: Icon(Icons.lock),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)),
                    suffixIcon: IconButton(
                      icon: isobsCure
                          ? Icon(Icons.visibility_off)
                          : Icon(Icons.visibility),
                      onPressed: () {
                        context
                            .read(passwordObscureProvider.notifier)
                            .toggleObscured();
                      },
                    ),
                  ),
                );
              }),
            )
          ],
        ),
      ),
    );
  }
}
