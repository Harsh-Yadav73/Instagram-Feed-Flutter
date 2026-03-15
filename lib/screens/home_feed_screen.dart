import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/post_provider.dart';
import '../widgets/instagram_appbar.dart';
import '../widgets/post_card.dart';
import '../widgets/stories_section.dart';
import '../widgets/shimmer_loader.dart';

class HomeFeedScreen extends StatefulWidget {
  const HomeFeedScreen({super.key});

  @override
  State<HomeFeedScreen> createState() => _HomeFeedScreenState();
}

class _HomeFeedScreenState extends State<HomeFeedScreen> {

  final ScrollController controller = ScrollController();

  @override
  void initState() {
    super.initState();

    final provider =
    Provider.of<PostProvider>(context, listen: false);

    provider.loadPosts();

    controller.addListener(() {

      /// Infinite Scroll Trigger
      if (controller.position.pixels >
          controller.position.maxScrollExtent - 300) {

        provider.loadPosts();

      }

    });
  }

  @override
  Widget build(BuildContext context) {

    final provider = Provider.of<PostProvider>(context);

    return Scaffold(

      appBar: const InstagramAppBar(),

      body: ListView(

        /// STEP 8 — Smooth Instagram-style scrolling
        physics: const BouncingScrollPhysics(),

        controller: controller,

        children: [

          const StoriesSection(),

          /// Loading state
          if (provider.posts.isEmpty)
            ...List.generate(
              3,
                  (index) => const ShimmerLoader(),
            ),

          /// Feed posts
          ...provider.posts.map(
                (post) => PostCard(post: post),
          ),

          const SizedBox(height: 20),
        ],
      ),
    );
  }
}