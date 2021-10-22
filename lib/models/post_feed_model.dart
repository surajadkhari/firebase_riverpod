import 'package:cloud_firestore/cloud_firestore.dart';

class PostFeed {
  String? title;
  String? description;
  String? image;

  PostFeed({this.title, this.description, this.image});

  PostFeed.fromJson(QueryDocumentSnapshot data) {
    this.title = data['title'] ?? " There is no title";
    this.description = data['decription'] == null
        ? "There is no description"
        : data['decription'];
    this.image = data['image'] ??
        "https://www.name.edu.np/wp-content/uploads/2020/06/placeholder.png";
  }
}
