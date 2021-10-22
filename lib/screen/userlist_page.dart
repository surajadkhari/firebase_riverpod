import 'package:firebase_riverpod/import_packages.dart/import.dart';

import 'user_detailpage.dart';

class Userlistpage extends StatelessWidget {
  const Userlistpage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('User list using StateNotifier')),
      body: Consumer(builder: (context, watch, child) {
        var _userList = watch(userListProvider);
        if (_userList.isEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircularProgressIndicator(),
                SizedBox(
                  height: 20,
                ),
                Text('Please Wait 	⌛'),
              ],
            ),
          );
        } else {
          return ListView.builder(
              itemCount: _userList.length,
              itemBuilder: (context, index) {
                return InkWell(
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(_userList[index].avatar),
                    ),
                    title: Text(_userList[index].first_name +
                        " " +
                        _userList[index].last_name),
                    subtitle: Text(_userList[index].email),
                    trailing: Text(_userList[index].id.toString()),
                  ),
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => DetailPage(
                              currentUser: _userList[index],
                            )));
                  },
                );
              });
        }
      }),
    );
  }
}
