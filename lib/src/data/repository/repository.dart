import 'package:micro_digital/src/data/model/common/state_model.dart';
import 'package:micro_digital/src/data/provider/cart_api_provider.dart';
import 'package:micro_digital/src/data/provider/categories_api_provider.dart';
import 'package:micro_digital/src/data/provider/master_provider.dart';
import 'package:micro_digital/src/data/provider/my_booking_provider.dart';
import 'package:micro_digital/src/data/provider/screening_provider.dart';
import 'package:micro_digital/src/data/provider/search_provider.dart';

import '../provider/auth_api_provider.dart';
import '../provider/order_api_provider.dart';
import '../provider/profile_provider.dart';

/// Repository is an intermediary class between network and data
class Repository {
  // final authApiProvider = AuthApiProvider();
  final orderApiProvider = OrderApiProvider();
  final masterApiProvider = MasterApiProvider();
  final bookingApiProvider = BookingApiProvider();
  final searchApiProvider = SearchApiProvider();
  final cartApiProvider = CartApiProvider();
  final authApiProvider = AuthApiProvider();
  final categoriesApiProvider = CategoriesApiProvider();
  final profileApiProvider = ProfileApiProvider();
  final screeningApiProvider = ScreeningApiProvider();

  /// auth api provider

  //get otp
  // Future<StateModel> getOtp(phoneNo,signature) => authApiProvider.getOtp(phoneNo,signature);

  ///order api provider

  Future<StateModel> checkoutOrder(request) =>
      orderApiProvider.checkoutOrder(request);

  ///profile api provider
  Future<StateModel> createProfile(request) =>
      profileApiProvider.createProfile(request);

  Future<StateModel> listMyProfile(String request) =>
      profileApiProvider.listMyProfile(request);

  ///master api provider
  Future<StateModel> getDashboardData() => masterApiProvider.getDashboardData();

  Future<StateModel> singlePackageDetails(request) =>
      masterApiProvider.singlePackageDetails(request);

  Future<StateModel> singleTestDetails(request) =>
      masterApiProvider.singleTestDetails(request);

  ///cart api provider
  Future<StateModel> getCartList(request) =>
      cartApiProvider.getCartList(request);

  Future<StateModel> deleteFromCart(request) =>
      cartApiProvider.deleteFromCart(request);

  Future<StateModel> addToCart(request) => cartApiProvider.addToCart(request);

  ///booking api provider
  Future<StateModel> getBookingList(request) =>
      bookingApiProvider.getMyBookingList(request);

  ///search api provider
  Future<StateModel> searchTest(request) =>
      searchApiProvider.searchTest(request);

  Future<StateModel> searchPackage(request) =>
      searchApiProvider.searchPackage(request);

  ///auth api provider
  Future<StateModel> createAccountWithPhoneNo(request) =>
      authApiProvider.createAccountWithPhoneNo(request);

  Future<StateModel> getOtp(String phoneNo) => authApiProvider.getOtp(phoneNo);

  ///screening api provider
  Future<StateModel> screeningRequest(request) =>
      screeningApiProvider.screeningRequest(request);

  Future<StateModel> categoriesRequest(request) =>
      categoriesApiProvider.categoriesRequest(request);
}
