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
      // ignore: deprecated_member_use
      backgroundColor: Colors.grey.withOpacity(0.2),
      appBar: AppBar(
        toolbarHeight: 100,
        // ignore: deprecated_member_use
        backgroundColor: Colors.grey.withOpacity(0.2),
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
            const SizedBox(height: 25),
            _buildDirectory(),
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

  Widget _buildDirectory() {
    final categories = [
      {"icon": "assets/iconDirectory/burger_icon.png", "label": "Burger"},
      {"icon": "assets/iconDirectory/pizza_icon.png", "label": "Pizza"},
      {"icon": "assets/iconDirectory/sandwich_icon.png", "label": "sandwich"},
      {"icon": "assets/iconDirectory/burger_icon.png", "label": "Burger"},
      {"icon": "assets/iconDirectory/burger_icon.png", "label": "Burger"},
    ];
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal, //cuon ngang
      child: Row(
        children:
            categories.asMap().entries.map((entry) {
              int index = entry.key;
              var item = entry.value;
              return _categoryItem(
                image: item["icon"]!,
                label: item["label"]!,
                isActive: index == 0,
              );
            }).toList(),
      ),
    );
  }

  Widget _categoryItem({
    required String image,
    required String label,
    required bool isActive,
  }) {
    return Container(
      margin: const EdgeInsets.only(right: 10),
      width: 126,
      height: 43,
      decoration: BoxDecoration(
        color: Colors.pink,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Image.asset(image, height: 24, width: 24, fit: BoxFit.contain),
          Text(
            label,
            style: TextStyle(
              fontSize: 18,
              color: isActive ? Colors.white : Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
