import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:photo_view/photo_view.dart';

class CarouselWidget extends StatefulWidget {
  final List<String> images;

  const CarouselWidget({super.key, required this.images});

  @override
  State<CarouselWidget> createState() => _CarouselWidgetState();
}

class _CarouselWidgetState extends State<CarouselWidget> {

  final PageController _controller = PageController();
  int currentIndex = 0;

  /// Heart animation state
  bool _showHeart = false;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _handleDoubleTap() {
    setState(() {
      _showHeart = true;
    });

    Future.delayed(const Duration(milliseconds: 800), () {
      if (mounted) {
        setState(() {
          _showHeart = false;
        });
      }
    });
  }

  void _openZoomImage(String image) {
    showDialog(
      context: context,
      builder: (_) {
        return Dialog(
          backgroundColor: Colors.black,
          child: PhotoView(
            imageProvider: NetworkImage(image),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {

    return Stack(
      alignment: Alignment.bottomCenter,
      children: [

        SizedBox(
          height: 350,
          child: PageView.builder(
            controller: _controller,
            itemCount: widget.images.length,
            onPageChanged: (index) {
              setState(() {
                currentIndex = index;
              });
            },
            itemBuilder: (context, index) {

              final image = widget.images[index];

              return GestureDetector(

                /// DOUBLE TAP → HEART ANIMATION
                onDoubleTap: _handleDoubleTap,

                /// SINGLE TAP → OPEN ZOOM
                onTap: () => _openZoomImage(image),

                child: Stack(
                  alignment: Alignment.center,
                  children: [

                    /// IMAGE
                    CachedNetworkImage(
                      imageUrl: image,
                      fit: BoxFit.cover,
                      width: double.infinity,

                      fadeInDuration:
                      const Duration(milliseconds: 300),

                      /// Loading placeholder
                      placeholder: (context, url) =>
                          Container(color: Colors.grey[300]),

                      /// Error fallback
                      errorWidget: (context, url, error) {
                        return Container(
                          color: Colors.grey[300],
                          alignment: Alignment.center,
                          child: const Icon(
                            Icons.broken_image,
                            size: 40,
                            color: Colors.grey,
                          ),
                        );
                      },
                    ),

                    /// BIG HEART ANIMATION
                    AnimatedOpacity(
                      opacity: _showHeart ? 1 : 0,
                      duration: const Duration(milliseconds: 200),
                      child: const Icon(
                        Icons.favorite,
                        color: Colors.white,
                        size: 110,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),

        /// PAGE INDICATOR
        Positioned(
          bottom: 12,
          child: SmoothPageIndicator(
            controller: _controller,
            count: widget.images.length,
            effect: const WormEffect(
              dotHeight: 6,
              dotWidth: 6,
              activeDotColor: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}