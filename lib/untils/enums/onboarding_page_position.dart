enum OnboardingPagePosition { page1, page2 }

extension OnboardingPagePositionExtension on OnboardingPagePosition {
  String onboardingPageImage() {
    switch (this) {
      case OnboardingPagePosition.page1:
        return "assets/onBoarding/onboarding_1.png";
      case OnboardingPagePosition.page2:
        return "assets/onBoarding/onboarding_2.png";
    }
  }

  String onboardingPageTitle() {
    switch (this) {
      case OnboardingPagePosition.page1:
        return "Select the Favorities Menu";
      case OnboardingPagePosition.page2:
        return "Good food at a cheap price";
    }
  }

  String onboardingPageContent() {
    switch (this) {
      case OnboardingPagePosition.page1:
        return "Now eat well, don't leave the house. You can choose your favorite food only with one click";
      case OnboardingPagePosition.page2:
        return "You can eat at expensive restaurants with affordable price";
    }
  }
}
