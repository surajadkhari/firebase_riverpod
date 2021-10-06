import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_riverpod/provider/auth_provider.dart';
import 'package:firebase_riverpod/services/firestore_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Addpost extends StatelessWidget {
  // Addpost({required this.email});

  // final String email;

  @override
  Widget build(BuildContext context) {
    TextEditingController _fullnamecontroller = TextEditingController();
    TextEditingController _addresscontroller = TextEditingController();
    // CollectionReference info =
    //     FirebaseFirestore.instance.collection('user_info');

    // Future<void> addUser(
    //     {required String fullname,
    //     required String address,
    //     required String email}) async {
    //   return info
    //       .add({'FullName': fullname, 'Address': address, 'Email': email})
    //       .then((value) => print("User Added"))
    //       .catchError((error) => print("Failed to add user: $error"));
    // }

    return Scaffold(
      appBar: AppBar(),
      body: Consumer(builder: (context, watch, child) {
        final String? userEmail = watch(userProvider).state!.email;
        return Center(
          child: ListView(
            shrinkWrap: true,
            children: [
              Center(child: Text(userEmail!)),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: _fullnamecontroller,
                  obscureText: false,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Enter Full Name"),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: _addresscontroller,
                  obscureText: false,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), hintText: "Address"),
                ),
              ),
              ElevatedButton(
                  onPressed: () async {
                    var adDUser = FireStore().addUser(
                        fullname: _fullnamecontroller.text,
                        address: _addresscontroller.text,
                        email: userEmail);
                  },
                  child: Text('Submit'))
            ],
          ),
        );
      }),
    );
  }
}
