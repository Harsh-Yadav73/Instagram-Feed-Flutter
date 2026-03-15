import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerLoader extends StatelessWidget {
  const ShimmerLoader({super.key});

  @override
  Widget build(BuildContext context) {

    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          /// POST HEADER
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            child: Row(
              children: [

                Container(
                  height: 36,
                  width: 36,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                ),

                const SizedBox(width: 10),

                Container(
                  height: 12,
                  width: 120,
                  color: Colors.white,
                ),

                const Spacer(),

                Container(
                  height: 12,
                  width: 20,
                  color: Colors.white,
                ),
              ],
            ),
          ),

          /// IMAGE PLACEHOLDER
          Container(
            height: 350,
            color: Colors.white,
          ),

          const SizedBox(height: 12),

          /// ACTION BUTTONS
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Row(
              children: [

                Container(height: 20, width: 20, color: Colors.white),
                const SizedBox(width: 12),

                Container(height: 20, width: 20, color: Colors.white),
                const SizedBox(width: 12),

                Container(height: 20, width: 20, color: Colors.white),

                const Spacer(),

                Container(height: 20, width: 20, color: Colors.white),
              ],
            ),
          ),

          const SizedBox(height: 10),

          /// CAPTION LINE
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Container(
              height: 12,
              width: 200,
              color: Colors.white,
            ),
          ),

          const SizedBox(height: 6),

          /// SECOND CAPTION LINE
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Container(
              height: 12,
              width: 150,
              color: Colors.white,
            ),
          ),

          const SizedBox(height: 20),
        ],
      ),
    );
  }
}