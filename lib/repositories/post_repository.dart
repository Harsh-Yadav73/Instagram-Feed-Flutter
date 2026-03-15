import 'dart:async';
import '../models/post_model.dart';

class PostRepository {

  Future<List<Post>> fetchPosts(int page) async {

    await Future.delayed(const Duration(milliseconds: 1500));

    return List.generate(10, (index) {
      return Post(
        username: "user_${page}_$index",
        avatar:
        "https://randomuser.me/api/portraits/men/${index + 20}.jpg",
        images: [
          "https://picsum.photos/500/500?random=${index + page * 10}",
          "https://picsum.photos/500/500?random=${index + page * 20}"
        ],
        caption: "Beautiful travel moment captured!",
      );
    });
  }
}