import 'package:flutter/material.dart';

import '../../../features/auth/presentation/screens/login_screen.dart';
import '../../../features/auth/presentation/screens/otp_screen.dart';
import '../../../features/faq/presentation/screens/faq_screen.dart';
import '../../../features/onboarding/presentation/screens/onboarding_screen.dart';
import '../../../features/onboarding/presentation/screens/start_screen.dart';
import 'routes_enum.dart';

class RoutesService {
  const RoutesService._();
  static const instance = RoutesService._();
  Map<String, Widget Function(BuildContext context)> getRoutes(
      BuildContext context) {
    return <String, Widget Function(BuildContext context)>{
      Routes.splash.path: (_) => const StartScreen(),
      Routes.onBoarding.path: (_) => const OnboardingScreen(),
      Routes.login.path: (_) => const LoginScreen(),
      Routes.otp.path: (_) => const OTPScreen(),
      Routes.faq.path: (_) => const FaqScreen(),
    };
  }
}
