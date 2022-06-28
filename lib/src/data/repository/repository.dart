import 'package:dio/dio.dart';
import 'package:micro_digital/src/data/model/common/state_model.dart';
import 'package:micro_digital/src/data/provider/cart_api_provider.dart';
import 'package:micro_digital/src/data/provider/master_provider.dart';
import 'package:micro_digital/src/data/provider/my_booking_provider.dart';
import 'package:micro_digital/src/data/provider/screening_provider.dart';
import 'package:micro_digital/src/data/provider/search_provider.dart';

import '../provider/auth_api_provider.dart';


/// Repository is an intermediary class between network and data
class Repository {
  // final authApiProvider = AuthApiProvider();
  final masterApiProvider = MasterApiProvider();
  final bookingApiProvider = BookingApiProvider();
  final searchApiProvider = SearchApiProvider();
  final cartApiProvider = CartApiProvider();
  final authApiProvider = AuthApiProvider();
  final screeningApiProvider = ScreeningApiProvider();


  /// auth api provider

  //get otp
  // Future<StateModel> getOtp(phoneNo,signature) => authApiProvider.getOtp(phoneNo,signature);

  ///master api provider
  Future<StateModel> getDashboardData() =>
      masterApiProvider.getDashboardData();

  Future<StateModel> singlePackageDetails(request) =>
      masterApiProvider.singlePackageDetails(request);

  Future<StateModel> singleTestDetails(request) =>
      masterApiProvider.singleTestDetails(request);

  ///cart api provider

  Future<StateModel> addToCart(request) =>
      cartApiProvider.addToCart(request);


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

  Future<StateModel> getOtp(String phoneNo) =>
      authApiProvider.getOtp(phoneNo);

  ///screening api provider
  Future<StateModel> screeningRequest(request) =>
      screeningApiProvider.screeningRequest(request);


}
