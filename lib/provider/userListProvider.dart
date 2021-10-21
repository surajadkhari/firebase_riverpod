import 'package:firebase_riverpod/import_packages.dart/import.dart';
import 'package:firebase_riverpod/services/userlist_jsonservice.dart';

class UserNotifier extends StateNotifier<List<Users>> {
  UserNotifier() : super([]) {
    loadUsers();
  }

  // loadUsers() async {
  //   List<Users> userdataList = [];
  //   var endPoint = 'https://reqres.in/api/users?page=2';
  //   var respond = await get(Uri.parse(endPoint));
  //   List jsonData = jsonDecode(respond.body)['data'];

  //   //For each--Mapping
  //   for (int index = 0; index < jsonData.length; index++) {
  //     userdataList.add(Users(
  //         id: jsonData[index]['id'],
  //         email: jsonData[index]['email'],
  //         first_name: jsonData[index]['first_name'],
  //         last_name: jsonData[index]['last_name'],
  //         avatar: jsonData[index]['avatar']));
  //   }
  //   state = userdataList;
  // }
  loadUsers() async {
    state = await Apiservice().loadjson();
  }
}

final userListProvider =
    StateNotifierProvider<UserNotifier, List<Users>>((ref) => UserNotifier());
