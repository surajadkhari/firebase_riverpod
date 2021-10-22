import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_riverpod/models/post_feed_model.dart';

class PostService {
  FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
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

  Future<List<PostFeed>> fetchPost() {
    return 
  }
}
