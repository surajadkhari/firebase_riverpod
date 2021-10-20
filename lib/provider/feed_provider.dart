import 'package:firebase_riverpod/models/post_feed_model.dart';
import 'package:firebase_riverpod/screen/addpost.dart';
import 'package:firebase_riverpod/services/post_service.dart';
import 'package:flutter/cupertino.dart';

class AddFeedNotifier extends ChangeNotifier {
  bool isLoading = false;
  String? error;

  addFeed(PostFeed feed) async {
    try {
      this.isLoading = true;
      await PostService().addPost(feed);
    } catch (error) {
      this.error = error.toString();
    } finally {
      this.isLoading = false;
    }
  }
}
