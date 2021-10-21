import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart';

class UserNotifier extends StateNotifier<List<User>> {
  UserNotifier() : super([]);

  loadUsers() async {
    List<User> userdataList = [];
    var endPoint = 'https://reqres.in/api/users?page=2';
    var respond = await get(Uri.parse(endPoint));
    var jsonData = jsonDecode(respond.body)['data'];

    //For each--Mapping
    for (int index = 0; index < jsonData.lenght; index++) {
      userdataList.add(User(
          id: jsonData[index]['id'],
          email: jsonData[index]['email'],
          first_name: jsonData[index]['first_name'],
          last_name: jsonData[index]['last_name'],
          avatar: jsonData[index]['avatar']));
    }
  }
}

//Model

class User {
  final int id;
  final String email;
  final String first_name;
  final String last_name;
  final String avatar;
  User(
      {required this.id,
      required this.email,
      required this.first_name,
      required this.last_name,
      required this.avatar});
}
