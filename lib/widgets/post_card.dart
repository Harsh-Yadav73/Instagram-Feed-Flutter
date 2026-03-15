import 'package:flutter/material.dart';
import '../models/post_model.dart';
import 'carousel_widget.dart';

class PostCard extends StatefulWidget {
  final Post post;

  const PostCard({super.key, required this.post});

  @override
  State<PostCard> createState() => _PostCardState();
}

class _PostCardState extends State<PostCard> {

  void showSnackbar() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Feature coming soon"),
        duration: Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    final post = widget.post;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        /// ---------------- POST HEADER ----------------
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          child: Row(
            children: [

              CircleAvatar(
                radius: 18,
                backgroundImage: NetworkImage(post.avatar),
              ),

              const SizedBox(width: 10),

              Expanded(
                child: Text(
                  post.username,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
              ),

              const Icon(Icons.more_vert),
            ],
          ),
        ),

        /// ---------------- POST IMAGE ----------------
        CarouselWidget(images: post.images),

        /// ---------------- ACTION BUTTONS ----------------
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4),
          child: Row(
            children: [

              /// LIKE BUTTON WITH ANIMATION
              IconButton(
                icon: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 300),
                  transitionBuilder: (child, animation) {
                    return ScaleTransition(
                      scale: animation,
                      child: child,
                    );
                  },
                  child: Icon(
                    post.isLiked
                        ? Icons.favorite
                        : Icons.favorite_border,
                    key: ValueKey(post.isLiked),
                    color: post.isLiked ? Colors.red : Colors.black,
                    size: 26,
                  ),
                ),
                onPressed: () {
                  setState(() {
                    post.isLiked = !post.isLiked;
                  });
                },
              ),

              IconButton(
                icon: const Icon(Icons.comment_outlined),
                onPressed: showSnackbar,
              ),

              IconButton(
                icon: const Icon(Icons.send_outlined),
                onPressed: showSnackbar,
              ),

              const Spacer(),

              IconButton(
                icon: Icon(
                  post.isSaved
                      ? Icons.bookmark
                      : Icons.bookmark_border,
                ),
                onPressed: () {
                  setState(() {
                    post.isSaved = !post.isSaved;
                  });
                },
              ),
            ],
          ),
        ),

        /// ---------------- LIKES COUNT ----------------
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 12),
          child: Text(
            "Liked by user123 and others",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 13,
            ),
          ),
        ),

        const SizedBox(height: 4),

        /// ---------------- CAPTION ----------------
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: RichText(
            text: TextSpan(
              children: [

                TextSpan(
                  text: "${post.username} ",
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),

                TextSpan(
                  text: post.caption,
                  style: const TextStyle(color: Colors.black),
                ),

              ],
            ),
          ),
        ),

        const SizedBox(height: 6),

        /// ---------------- TIMESTAMP ----------------
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 12),
          child: Text(
            "2 hours ago",
            style: TextStyle(
              color: Colors.grey,
              fontSize: 11,
            ),
          ),
        ),

        const SizedBox(height: 16),
      ],
    );
  }
}