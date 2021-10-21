import 'package:firebase_riverpod/import_packages.dart/import.dart';

class Apiservice {
  loadjson() async {
    List<Users> userdataList = [];
    var endPoint = 'https://reqres.in/api/users?page=2';
    var respond = await get(Uri.parse(endPoint));
    List jsonData = jsonDecode(respond.body)['data'];

    //For each--Mapping
    for (int index = 0; index < jsonData.length; index++) {
      userdataList.add(Users(
          id: jsonData[index]['id'],
          email: jsonData[index]['email'],
          first_name: jsonData[index]['first_name'],
          last_name: jsonData[index]['last_name'],
          avatar: jsonData[index]['avatar']));
    }
    return userdataList;
  }
}
