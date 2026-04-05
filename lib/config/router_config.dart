import 'package:go_router/go_router.dart';
import '../features/auth/presentation/screens/screens.dart';
import '../features/dashboard/presentation/screens/dashboard_screens.dart';
import '../features/invest/presentation/screens/invest_screens.dart';
import 'route_names.dart';

final appRouter = GoRouter(
  initialLocation: RouteNames.phoneVerification,
  routes: [
    GoRoute(
      path: RouteNames.phoneVerification,
      builder: (context, state) => const PhoneVerificationScreen(),
    ),
    GoRoute(
      path: RouteNames.otpVerification,
      builder: (context, state) => const OtpVerificationScreen(),
    ),
    GoRoute(
      path: RouteNames.register,
      builder: (context, state) => const RegisterScreen(),
    ),
    GoRoute(
      path: RouteNames.home,
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: RouteNames.dashboardHome,
      builder: (context, state) => const DashboardHomeScreen(),
    ),
    GoRoute(
      path: RouteNames.history,
      builder: (context, state) => const DashboardHistoryScreen(),
    ),
    GoRoute(
      path: RouteNames.investPersonal,
      builder: (context, state) => const PersonalInfoScreen(),
    ),
    GoRoute(
      path: RouteNames.investTerms,
      builder: (context, state) => const InvestTermsScreen(),
    ),
    GoRoute(
      path: RouteNames.investSummary,
      builder: (context, state) => const InvestSummaryScreen(),
    ),
  ],
);
