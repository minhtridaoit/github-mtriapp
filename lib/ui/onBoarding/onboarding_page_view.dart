import 'package:flutter/material.dart';
import 'package:food_app/ui/onBoarding/onboarding_child_page.dart';
import 'package:food_app/utils/enums/onboarding_page_position.dart';

class OnboardingPageView extends StatefulWidget {
  const OnboardingPageView({super.key});

  @override
  State<OnboardingPageView> createState() => _OnboardingPageViewState();
}

class _OnboardingPageViewState extends State<OnboardingPageView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        children: const [
          OnboardingChildPage(
            onboardingPagePosition: OnboardingPagePosition.page1,
          ),
          OnboardingChildPage(
            onboardingPagePosition: OnboardingPagePosition.page2,
          ),
        ],
      ),
    );
  }
}
