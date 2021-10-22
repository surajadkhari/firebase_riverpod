import 'package:firebase_riverpod/models/post_feed_model.dart';
import 'package:firebase_riverpod/screen/addpost.dart';
import 'package:firebase_riverpod/services/post_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddFeedNotifier extends ChangeNotifier {
  bool isLoading = false;
  String? error;

  Future<void> addFeed(PostFeed feed) async {
    try {
      this.isLoading = true;
      notifyListeners();
      await PostService().addPost(feed);
    } catch (error) {
      this.error = error.toString();
    } finally {
      this.isLoading = false;
      notifyListeners();
    }
  }
}

final addFeedProvider =
    ChangeNotifierProvider<AddFeedNotifier>((ref) => AddFeedNotifier());


//fetchFeed Provider
final fetchFeedProvider = FutureProvider((ref) => PostService().fetchPost());
