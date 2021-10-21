import 'package:firebase_riverpod/provider/userListProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Userlistpage extends StatelessWidget {
  const Userlistpage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          child: Container(
            child: Text('User list using StateNotifier'),
          ),
          preferredSize: Size.fromHeight(50.0)),
      body: Consumer(builder: (context, watch, child) {
        var _userList = context.read(userListProvider);
        
        
      }),
    );
  }
}
