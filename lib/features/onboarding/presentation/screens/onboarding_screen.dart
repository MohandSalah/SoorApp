import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:soor/core/utils/routes/routes_enum.dart';

import '../../../../gen/assets.gen.dart';
import '../widgets/avoid_button_widget.dart';
import '../widgets/swipe_next_button_widget.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  late final PageController _pageController;
  int _currentPageIndex = 0;
  bool _avoidButtonVisible = true;
  final List<Map<String, String>> _pages = [
    {
      'imagePath': Assets.images.buildings.path,
      'text': '!مرحبًا بك في سور\nاكتشف معنا عالم العقارات في المملكة',
    },
    {
      'imagePath': Assets.images.someoneholdingphone.path,
      'text': '.دعنا نساعدك في استكشاف أماكن جديدة ومميزة مع تطبيق سور',
    },
    {
      'imagePath': Assets.images.saudimap.path,
      'text': '.لتجربة فريدة تسهل عليك اكتشاف منازل الأحلام والعقارات المميزة',
    },
  ];
  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: GestureDetector(
        onHorizontalDragUpdate: _onDradToSwitchBetweenDetails,
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height / 2,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(_pages[_currentPageIndex]['imagePath']!),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 24),
            SizedBox(
              height: 120,
              child: Text(
                _pages[_currentPageIndex]['text']!,
                textAlign: TextAlign.center,
                style: theme.textTheme.bodyLarge,
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: 68,
              height: 5,
              child: PageView(
                controller: _pageController,
                onPageChanged: (index) {
                  setState(() {
                    _currentPageIndex = index;
                    _avoidButtonVisible =
                        _currentPageIndex != _pages.length - 1;
                  });
                },
                children: _pages.map(
                  (page) {
                    return const Center(
                      child: Text('Page Content'),
                    );
                  },
                ).toList(),
              ),
            ),
            SmoothPageIndicator(
              controller: _pageController,
              count: _pages.length,
              effect: const WormEffect(dotHeight: 5.0, dotWidth: 20.0),
            ),
            const SizedBox(height: 20),
            SwipeNextButtonWidget(
              onPressed: _onPressedNext,
              buttonText: _getCurrentButtonText,
            ),
            const SizedBox(height: 20),
            AvoidButton(
              text: 'تخطي',
              onPressed: _onPressedSkip,
              visible: _avoidButtonVisible,
            ),
          ],
        ),
      ),
    );
  }

  void _onDradToSwitchBetweenDetails(DragUpdateDetails details) {
    if (details.primaryDelta! > 0) {
      _pageController.previousPage(
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    } else if (details.primaryDelta! < 0) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
  }

  void _onPressedSkip() {
    Navigator.of(context)
        .pushNamedAndRemoveUntil(Routes.login.path, (route) => false);
  }

  void _onPressedNext() {
    if (_currentPageIndex >= 3) {
      Navigator.of(context)
          .pushNamedAndRemoveUntil(Routes.login.path, (route) => false);
      return;
    }
    _pageController.nextPage(
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
    _currentPageIndex++;
    _avoidButtonVisible = _currentPageIndex != _pages.length - 1;
  }

  String _getCurrentButtonText() {
    if (_currentPageIndex == _pages.length - 1) {
      return 'ابدأ';
    } else {
      return 'المتابعة';
    }
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}
