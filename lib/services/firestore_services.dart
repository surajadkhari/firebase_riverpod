import 'package:cloud_firestore/cloud_firestore.dart';

class FireStore {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  CollectionReference info = FirebaseFirestore.instance.collection('user_info');

  Future<void> addUser(
      {required String fullname,
      required String address,
      required String email}) async {
    return info
        .add({'FullName': fullname, 'Address': address, 'Email': email})
        .then((value) => print("User Added"))
        .catchError((error) => print("Failed to add user: $error"));
  }
}
