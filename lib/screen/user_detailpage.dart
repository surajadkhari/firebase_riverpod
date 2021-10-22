import 'package:firebase_riverpod/import_packages.dart/import.dart';
import 'package:flutter/cupertino.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("UserName"),
      ),
      body: ListView(children: [
        Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.center,
          children: [
            Container(
              // constraints: BoxConstraints.expand(height: 200),
              height: 200,
              decoration: BoxDecoration(color: Colors.greenAccent[700]),
            ),
            Positioned(
              bottom: -50,
              child: CircleAvatar(
                radius: 80,
                backgroundColor: Colors.white,
                child: CircleAvatar(
                  radius: 75,
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 60,
        ),
        Text(
          "First name and Last Name",
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 20, fontFamily: 'Poppins', fontWeight: FontWeight.w600),
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          "Email",
          textAlign: TextAlign.center,
        ),
      ]),
    );
  }
}
