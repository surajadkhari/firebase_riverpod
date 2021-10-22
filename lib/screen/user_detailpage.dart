import 'package:firebase_riverpod/import_packages.dart/import.dart';
import 'package:firebase_riverpod/services/userlist_jsonservice.dart';
import 'package:flutter/cupertino.dart';

class DetailPage extends StatefulWidget {
  final Users currentUser;
  const DetailPage({Key? key, required this.currentUser}) : super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    Users _currentUser = widget.currentUser;
    return Consumer(builder: (context, watch, child) {
      return Scaffold(
        appBar: AppBar(
          title: Text(_currentUser.first_name),
        ),
        body: ListView(children: [
          Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.center,
            children: [
              Container(
                height: 200,
                decoration: BoxDecoration(color: Colors.grey),
              ),
              Positioned(
                bottom: -50,
                child: CircleAvatar(
                  radius: 90,
                  backgroundColor: Colors.white,
                  child: CircleAvatar(
                    radius: 85,
                    backgroundImage: NetworkImage(_currentUser.avatar),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 60,
          ),
          Text(
            _currentUser.first_name + " " + _currentUser.last_name,
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 20,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w600),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            _currentUser.email,
            textAlign: TextAlign.center,
          ),
        ]),
      );
    });
  }
}
