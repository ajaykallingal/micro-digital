import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:micro_digital/src/ui/login/otp_screen_argument.dart';
import 'package:micro_digital/src/ui/login/otp_verification_screen.dart';
import 'package:micro_digital/src/ui/orderdetails/orderdetails_widget.dart';
import 'package:micro_digital/src/ui/package_details/package_details_widget.dart';
import 'package:micro_digital/src/ui/test_details/test_details_widget.dart';

import '../ui/home_navigation/home_navigation_screen.dart';
import '../ui/login/login_widget.dart';
import '../ui/splash/splash_screen.dart';

class RouteGenerator {
  RouteGenerator._();

  static const initialPage = '/';
  static const splashPage = '/splash';
  static const loginPage = '/login';
  static const otpScreen = '/otp';
  static const homeNavigationPage = '/home';
  static const dashboardPage = '/dashboard';
  static const bookingDetailPage = '/booking_detail';
  static const userChatsPage = '/userChats';
  static const settingsPage = '/settings';
  static const profilePage = '/profile';
  static const menuPage = '/menu';
  static const cartPage = '/cart';
  static const checkoutPage = '/checkout';
  static const packageCategoryPage = '/package_category';
  static const packageDetailsPage = '/package_details';
  static const myReportPage = '/my_reports';
  static const testInfoPage = '/test_info';
  static const testDetailPage = '/test_detail';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case initialPage:
      // if (args is HomeNavigationArgs) {
      //   return MaterialPageRoute(builder: (_) => HomeNavigation(args: args,));
      // } else {
      //   return _errorRoute();
      // }
      case splashPage:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      // case dashboardPage:
      //
      //   return MaterialPageRoute(builder: (_) => const HomeNavigation(index: 0,));
      case loginPage:
        return MaterialPageRoute(builder: (_) => LoginWidget());

      case otpScreen:
        final otpScreenArguments = args as OtpScreenArguments;
        return MaterialPageRoute(
            builder: (_) => OtpVerificationScreen(
                  otpScreenArguments: otpScreenArguments,
                ));
      case dashboardPage:
        return MaterialPageRoute(
            builder: (_) => const HomeNavigation(
                  index: 0,
                ));
      // case profilePage:
      //   return MaterialPageRoute(builder: (_) => ProfileScreen());
      case packageDetailsPage:
        return MaterialPageRoute(builder: (_) => PackageDetailsWidget());
      // case packageCategoryPage:
      //   return MaterialPageRoute(builder: (_) => PackageCategoryScreen());
      // case testInfoPage:
      //   return MaterialPageRoute(builder: (_) => TestInfoScreen());
      // case checkoutPage:
      //   return MaterialPageRoute(builder: (_) => CheckoutScreen());
      // case cartPage:
      //   return MaterialPageRoute(builder: (_) => CartScreen());
      case testDetailPage:
        return MaterialPageRoute(builder: (_) => TestDetailsWidget());
      case bookingDetailPage:
        return MaterialPageRoute(builder: (_) => OrderdetailsWidget());
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,
          foregroundColor: Colors.blue,
          title: const Text("Error"),
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
        body: const Center(
          child: Text("Coming soon"),
        ),
      );
    });
  }
}
