import 'package:firebase_riverpod/import_packages.dart/import.dart';

class Users {
  final int id;
  final String email;
  final String first_name;
  final String last_name;
  final String avatar;

  Users(
      {required this.id,
      required this.email,
      required this.first_name,
      required this.last_name,
      required this.avatar});

  //userListProvider ma for each use garnalai
  factory Users.fromJson(Map<String, dynamic> json) => Users(
        id: json["id"],
        email: json["email"],
        first_name: json["first_name"],
        last_name: json["last_name"],
        avatar: json["avatar"],
      );
}
