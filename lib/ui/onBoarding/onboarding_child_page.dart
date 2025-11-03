import 'package:flutter/material.dart';
import 'package:food_app/untils/enums/onboarding_page_position.dart';

class OnboardingChildPage extends StatelessWidget {
  final OnboardingPagePosition onboardingPagePosition;
  const OnboardingChildPage({super.key, required this.onboardingPagePosition});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildImageOnboarding(),
            SizedBox(height: 40),
            _buildTitleAndContentOnboarding(),
            _builControlerOnboarding(),
            _buildButonSkipAndNextOnboarding(),
          ],
        ),
      ),
    );
  }

  Widget _buildImageOnboarding() {
    return Image.asset(onboardingPagePosition.onboardingPageImage());
  }

  Widget _buildTitleAndContentOnboarding() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            onboardingPagePosition.onboardingPageTitle(),
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 30),
          Text(
            onboardingPagePosition.onboardingPageContent(),
            style: TextStyle(fontSize: 15),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _builControlerOnboarding() {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 12,
            height: 12,
            decoration: BoxDecoration(
              color:
                  onboardingPagePosition == OnboardingPagePosition.page1
                      ? Color(0xFFD61355)
                      : Colors.grey,
              shape: BoxShape.circle,
            ),
          ),
          SizedBox(width: 4),
          Container(
            width: 12,
            height: 12,
            decoration: BoxDecoration(
              color:
                  onboardingPagePosition == OnboardingPagePosition.page2
                      ? Color(0xFFD61355)
                      : Colors.grey,
              shape: BoxShape.circle,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildButonSkipAndNextOnboarding() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: () {},
            child: Text("Skip", style: TextStyle(fontSize: 20)),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Color(0xFFD61355)),
            onPressed: () {},
            child: Text(
              "Next",
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
