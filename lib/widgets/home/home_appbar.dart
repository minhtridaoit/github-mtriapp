import 'package:flutter/material.dart';

class HomeAppbar extends StatelessWidget {
  const HomeAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [_buildAddress(), _buildSearchBar()]);
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
}
