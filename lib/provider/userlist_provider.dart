import 'package:firebase_riverpod/import_packages.dart/import.dart';

class UserNotifier extends StateNotifier<List<Users>> {
  UserNotifier() : super([]) {
    loadUsers();
  }

  loadUsers() async {
    List<Users> userdataList = [];
    var endPoint = 'https://reqres.in/api/users?page=2';
    var respond = await get(Uri.parse(endPoint));
    List jsonData = jsonDecode(respond.body)['data'];

    //Using loop--Mapping
    // for (int index = 0; index < jsonData.length; index++) {
    //   userdataList.add(Users(
    //       id: jsonData[index]['id'],
    //       email: jsonData[index]['email'],
    //       first_name: jsonData[index]['first_name'],
    //       last_name: jsonData[index]['last_name'],
    //       avatar: jsonData[index]['avatar']));
    // }

    //Foreach method
    jsonData.forEach((element) {
      userdataList.add(Users.fromJson(element));
    });

    state = userdataList;
  }
}

final userListProvider =
    StateNotifierProvider<UserNotifier, List<Users>>((ref) => UserNotifier());
