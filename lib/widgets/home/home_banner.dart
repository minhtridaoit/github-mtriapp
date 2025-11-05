import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class HomeBanner extends StatefulWidget {
  const HomeBanner({super.key});

  @override
  State<HomeBanner> createState() => _HomeBannerState();
}

class _HomeBannerState extends State<HomeBanner> {
  final CarouselController _controller = CarouselController();
  int _current = 0;

  final List<String> bannerImages = [
    'assets/banner/banner1.png',
    'assets/banner/banner1.png',
    'assets/banner/banner1.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _bannerSlide(),
        const SizedBox(height: 8),
        _bannerController(),
      ],
    );
  }

  Widget _bannerSlide() {
    return CarouselSlider(
      items:
          bannerImages.map((img) {
            return ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                img,
                height: 150,
                fit: BoxFit.cover,
                width: 325,
              ),
            );
          }).toList(),
      options: CarouselOptions(
        height: 100,
        autoPlay: true,
        enlargeCenterPage: true,
        viewportFraction: 0.9,
        autoPlayInterval: const Duration(seconds: 3),
        autoPlayAnimationDuration: const Duration(milliseconds: 800),
        onPageChanged: (index, reason) {
          setState(() {
            _current = index;
          });
        },
      ),
    );
  }

  Widget _bannerController() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children:
          bannerImages.asMap().entries.map((entry) {
            return GestureDetector(
              onTap:
                  () => _controller.animateTo(
                    entry.key.toDouble(),
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  ),

              child: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                margin: const EdgeInsets.symmetric(horizontal: 4),
                width: _current == entry.key ? 12 : 8,
                height: 8,
                decoration: BoxDecoration(
                  color:
                      _current == entry.key
                          ? Colors.black
                          : Colors.grey.shade400,
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
            );
          }).toList(),
    );
  }
}
