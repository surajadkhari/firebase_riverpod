import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart';

class UserNotifier extends StateNotifier<List<User>> {
  UserNotifier() : super([]);

  loadUsers() async {
    var endPoint = 'https://reqres.in/api/users?page=2';
    var respond = await get(Uri.parse(endPoint));
    var userData = jsonDecode(respond.body);
    print(userData);
  }
}

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
