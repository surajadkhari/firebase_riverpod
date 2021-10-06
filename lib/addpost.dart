import 'package:firebase_riverpod/provider/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Addpost extends StatelessWidget {
  const Addpost({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Consumer(builder: (context, watch, child) {
        final String? userEmail = watch(userProvider).state!.email;
        return ListView(
          children: [
            Center(child: Text(userEmail!)),
          ],
        );
      }),
    );
  }
}
