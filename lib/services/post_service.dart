import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_riverpod/models/post_feed_model.dart';

class PostService {
  FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  //Method to Pass data to collection post
  Future addPost(PostFeed feed) {
    CollectionReference _feedReference =
        FirebaseFirestore.instance.collection('post');
    var PostData = {
      'title': feed.title,
      'image': feed.image,
      'decription': feed.description
    };
    return _feedReference.add(PostData);
  }

  //Method to Fetch data

  Future fetchPost() async {
    //create refrence
    CollectionReference _fetchReference = _firebaseFirestore.collection('post');
    var _querySnaphot = await _fetchReference.get();
    return _querySnaphot.docs.map((e) => PostFeed.fromJson(e));
  }
}
