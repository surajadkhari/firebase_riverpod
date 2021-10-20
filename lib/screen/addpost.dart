import 'package:firebase_riverpod/models/post_feed_model.dart';
import 'package:firebase_riverpod/provider/auth_provider.dart';
import 'package:firebase_riverpod/provider/feed_provider.dart';
import 'package:firebase_riverpod/services/firestore_services.dart';
import 'package:firebase_riverpod/services/post_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'Feedpage.dart';

class Addpost extends StatefulWidget {
  @override
  State<Addpost> createState() => _AddpostState();
}

class _AddpostState extends State<Addpost> {
  @override
  void initState() {
    var feed = PostFeed();
    super.initState();
  }

  PostFeed feed = PostFeed();
  @override
  Widget build(BuildContext context) {
    TextEditingController _titlecontroller = TextEditingController();
    TextEditingController _descriptioncontroller = TextEditingController();
    TextEditingController _imagecontroller = TextEditingController();
    // CollectionReference info =
    //     FirebaseFirestore.instance.collection('user_info');

    // Future<void> addUser(
    //     {required String fullname,
    //     required String address,
    //     required String email}) async {
    //   return info
    //       .add({'FullName': fullname, 'Address': address, 'Email': email})
    //       .then((value) => print("User Added"))
    //       .catchError((error) => print("Failed to add user: $error"));
    // }

    return Scaffold(
      appBar: AppBar(
        title: Text('Add Post'),
      ),
      body: Consumer(builder: (context, watch, child) {
        final String? userEmail = watch(userProvider).state!.email;
        return Center(
          child: ListView(
            shrinkWrap: true,
            children: [
              // Center(child: Text(userEmail!)),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: _titlecontroller,
                  obscureText: false,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), hintText: "Enter Title"),
                  onChanged: (value) {
                    feed.title = value;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: _descriptioncontroller,
                  obscureText: false,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Enter Description"),
                  onChanged: (value) {
                    feed.description = value;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: _imagecontroller,
                  obscureText: false,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), hintText: "Image link"),
                  onChanged: (value) {
                    feed.image = value;
                  },
                ),
              ),
              Consumer(builder: (context, watch, child) {
                var indicator = watch(addFeedProvider).isLoading;
                if (indicator) {
                  return CircularProgressIndicator();
                } else {
                  return Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: ElevatedButton(
                        onPressed: () async {
                          // var adDUser = FireStore().addUser(
                          //     fullname: _fullnamecontroller.text,
                          //     address: _addresscontroller.text,
                          //     email: '')
                          // Direclty from Services below using Provider
                          //await PostService().addPost(feed);
                          //Using Provider
                          await context.read(addFeedProvider).addFeed(feed);
                          _titlecontroller.clear();
                          _descriptioncontroller.clear();
                          _imagecontroller.clear();
                          ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text("Sucessfully Submitted")));
                          // Navigator.of(context).push(
                          //     MaterialPageRoute(builder: (context) => FeedPage()));
                        },
                        child: Text('Submit')),
                  );
                }
              })
            ],
          ),
        );
      }),
    );
  }
}
