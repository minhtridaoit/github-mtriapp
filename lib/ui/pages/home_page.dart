import 'package:flutter/material.dart';
import 'package:food_app/widgets/home/home_appbar.dart';
import 'package:food_app/widgets/home/home_banner.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0; // luu vị trí được chọn của danh mục

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // ignore: deprecated_member_use
      backgroundColor: Colors.grey.withOpacity(0.2),
      appBar: AppBar(
        toolbarHeight: 100,
        // ignore: deprecated_member_use
        backgroundColor: Colors.grey.withOpacity(0.2),
        title: SafeArea(child: HomeAppbar()),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            HomeBanner(),
            const SizedBox(height: 25),
            _buildDirectory(),
          ],
        ),
      ),
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
              return GestureDetector(
                onTap: () {
                  setState(() {
                    selectedIndex = index;
                  });
                },
                child: _categoryItem(
                  image: item["icon"]!,
                  label: item["label"]!,
                  isActive: selectedIndex == index,
                ),
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
        color: isActive ? Colors.pink : Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.pink, width: 1.5),
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
