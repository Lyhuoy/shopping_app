import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoppingapp/views/authentication/start_screen.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController(initialPage: 0, keepPage: true);
  bool _isLastPage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _pageController,
            onPageChanged: (int page) {
              setState(() {
                _isLastPage = (page == 2);
              });
            },
            children: const [
              OnboardingWidget(
                image: 'https://static.vecteezy.com/system/resources/previews/008/475/566/original/beautiful-young-asian-woman-with-shopping-bags-file-png.png',
                title: 'Onboarding 1',
                description: 'This is the first onboarding screen',
              ),
              OnboardingWidget(
                image: 'https://static.vecteezy.com/system/resources/previews/008/475/566/original/beautiful-young-asian-woman-with-shopping-bags-file-png.png',
                title: 'Onboarding 2',
                description: 'This is the second onboarding screen',
              ),
              OnboardingWidget(
                image: 'https://static.vecteezy.com/system/resources/previews/008/475/566/original/beautiful-young-asian-woman-with-shopping-bags-file-png.png',
                title: 'Onboarding 3',
                description: 'This is the third onboarding screen This is the third onboarding screenThis is the third onboarding screen',
              ),
            ],
          ),
          Container(
            alignment: const Alignment(0, 0.35),
            child: SmoothPageIndicator(
              controller: _pageController,
              count: 3,
              textDirection: TextDirection.ltr,
              effect: const WormEffect(
                dotColor: Colors.grey,
                activeDotColor: Color(0xFF9775FA),
                dotHeight: 12,
                dotWidth: 12,
              ),
            ),
          ),
          Container(
            alignment: const Alignment(0, 0.9),
            child: !_isLastPage
                ? Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: const Color(0xFF9775FA),
                          ),
                          child: TextButton(
                            onPressed: () {
                              _pageController.nextPage(
                                duration: const Duration(milliseconds: 500),
                                curve: Curves.ease,
                              );
                            },
                            child: const Text(
                              'Continue',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            _pageController.animateToPage(
                              2,
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.ease,
                            );
                          },
                          child: const Text(
                            'Skip',
                            style: TextStyle(color: Color(0xFF9775FA)),
                          ),
                        ),
                      ],
                    ),
                  )
                : Padding(
                    padding: const EdgeInsets.symmetric(vertical: 31.0, horizontal: 20.0),
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: const Color(0xFF9775FA),
                      ),
                      child: TextButton(
                        onPressed: () {
                          Get.offAll(() => const StartScreen());
                        },
                        child: const Text(
                          'Get Started',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
          )
        ],
      ),
    );
  }
}

class OnboardingWidget extends StatelessWidget {
  final String image;
  final String title;
  final String description;
  const OnboardingWidget({
    super.key,
    required this.image,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const SizedBox(height: 120),
        Container(
          height: 300,
          width: 300,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(image),
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(height: 20),
        Text(
          title,
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        Padding(
          padding: const EdgeInsets.all(20),
          child: Text(
            description,
            style: TextStyle(fontSize: 16, color: Colors.grey.shade600),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
