import 'package:flutter/material.dart';
import '../models/post_model.dart';
import '../repositories/post_repository.dart';

class PostProvider extends ChangeNotifier {

  final PostRepository repository = PostRepository();

  List<Post> posts = [];
  int page = 0;
  bool isLoading = false;

  Future loadPosts() async {

    if (isLoading) return;

    isLoading = true;
    notifyListeners();

    final newPosts = await repository.fetchPosts(page);

    posts.addAll(newPosts);
    page++;

    isLoading = false;

    notifyListeners();
  }
}