import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:micro_digital/src/ui/add_member/add_member_screen.dart';
import 'package:micro_digital/src/ui/categories/categories_detailed.dart';
import 'package:micro_digital/src/ui/categories/categories_view_screen.dart';
import 'package:micro_digital/src/ui/login/otp_screen_argument.dart';
import 'package:micro_digital/src/ui/login/otp_verification_screen.dart';
import 'package:micro_digital/src/ui/orderdetails/orderdetails_widget.dart';
import 'package:micro_digital/src/ui/package_details/package_details_widget.dart';
import 'package:micro_digital/src/ui/risk_areas/risk_area_category_detailed_list_view.dart';
import 'package:micro_digital/src/ui/risk_areas/risk_area_detailed_view_arguments.dart';
import 'package:micro_digital/src/ui/risk_areas/risk_areas_category.dart';
import 'package:micro_digital/src/ui/select_member/select_member_page.dart';
import 'package:micro_digital/src/ui/screening/screening_screen.dart';
import 'package:micro_digital/src/ui/test_details/test_details_widget.dart';

import '../ui/categories/components/categories_detailed_page_arguments.dart';
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
  static const selectMemberPage = '/select_Member';
  static const riskAreasCategoriesPage = '/risk_Areas_Category';
  static const riskAreasCategoriesDetailedPage = '/riskAreas_Category_listView';
  static const categoriesViewPge = '/category_view';
  static const categoriesDetailedViewPge = '/category_detailed_view';
  static const addMemberPage = '/add_member';
  static const screeningScreenPage = '/screeningDetails';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      // case initialPage:
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

      case selectMemberPage:
        return MaterialPageRoute(builder: (_) => SelectMemberPage());

      case riskAreasCategoriesPage:
        return MaterialPageRoute(builder: (_) => RiskAreasCategoryPage());

      case riskAreasCategoriesDetailedPage:
        final riskAreaCategoryDetailedViewArguments =
            args as RiskAreaDetailedViewArguments;
        return MaterialPageRoute(
            builder: (_) => RiskAreaCategoryDetailedListView(
                  riskAreaCategoryDetailedViewArguments:
                      riskAreaCategoryDetailedViewArguments,
                ));

      case categoriesViewPge:
        return MaterialPageRoute(builder: (_) => CategoriesViewScreen());

      case categoriesDetailedViewPge:
        final categoriesDetailedViewPageArguments =
            args as CategoriesDetailedViewPageArguments;
        return MaterialPageRoute(
            builder: (_) => CategoriesDetailed(
                  categoriesDetailedViewPageArguments:
                      categoriesDetailedViewPageArguments,
                ));

      case addMemberPage:
        return MaterialPageRoute(builder: (_) => AddMemberScreen());
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
      case screeningScreenPage:
        final arguments = args as String;
        return MaterialPageRoute(builder: (_) => ScreeningScreen(screeningType: arguments,));
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
