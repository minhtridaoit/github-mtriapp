import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final CarouselController _controller = CarouselController();
  int _current = 0;

  final List<String> bannerImages = [
    'assets/banner/banner1.png',
    'assets/banner/banner1.png',
    'assets/banner/banner1.png',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        backgroundColor: Colors.white,
        title: SafeArea(
          child: Column(children: [_buildAddress(), _buildSearchBar()]),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _bannerSlide(),
            const SizedBox(height: 8),
            _navigationController(),
          ],
        ),
      ),
    );
  }

  Widget _buildAddress() {
    return Text("Minh tri dep trai hehehe");
  }

  Widget _buildSearchBar() {
    return TextField(
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        hintText: "Search",
        hintStyle: TextStyle(color: Colors.black),
        prefixIcon: const Icon(Icons.search, color: Colors.black),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: const BorderSide(color: Colors.black, width: 1.5),
        ),
        contentPadding: const EdgeInsets.symmetric(vertical: 8),
      ),
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
                fit: BoxFit.cover,
                width: double.infinity,
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

  Widget _navigationController() {
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
