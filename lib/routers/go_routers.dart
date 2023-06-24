import 'package:go_router/go_router.dart';
import 'package:new_app/views/business_category_details.dart';
import 'package:new_app/views/education_category_details.dart';
import 'package:new_app/views/entertainment_category_details.dart';
import 'package:new_app/views/main_page.dart';
import 'package:new_app/views/onboarding_page.dart';
import 'package:new_app/views/sign_in.dart';
import 'package:new_app/views/sign_up.dart';
import 'package:new_app/views/sports_category_details.dart';
import 'package:new_app/views/tech_category_details.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const OnboardingPage(),
    ),
    GoRoute(
      path: '/main',
      builder: (context, state) => const MainPage(),
    ),
    GoRoute(
      path: '/signin',
      builder: (context, state) => const SignIn(),
    ),
    GoRoute(
      path: '/signup',
      builder: (context, state) => const SignUp(),
    ),
    GoRoute(
      path: '/main/sports',
      builder: (context, state) => const SportsCategoryDetailPage(),
    ),
    GoRoute(
      path: '/main/technology',
      builder: (context, state) => const TechnologyCategoryDetailPage(),
    ),
    GoRoute(
      path: '/main/entertainment',
      builder: (context, state) => const EntertainmentCategoryDetailPage(),
    ),
    GoRoute(
      path: '/main/business',
      builder: (context, state) => const BusinessCategoryDetailPage(),
    ),
    GoRoute(
      path: '/main/education',
      builder: (context, state) => const EducationCategoryDetailPage(),
    ),
  ],
);
