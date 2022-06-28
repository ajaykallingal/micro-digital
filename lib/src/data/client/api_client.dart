// import 'dart:convert';
import 'dart:convert';
import 'dart:io';

import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:micro_digital/src/constants/urls.dart';
import 'package:micro_digital/src/data/model/auth/auth_request.dart';
import 'package:micro_digital/src/data/model/my_booking/my_booking_request.dart';
import 'package:micro_digital/src/data/model/search/search_request.dart';

class ApiClient {
  ApiClient() {
    initClient();
  }

  late Dio dio;

  late BaseOptions _baseOptions;

  String username = 'nadir@communiqo.com';
  // live
  String password = 'H626881X1i9oCymb95151pa14Mi8395X';
  // dev
  String passwordDev = 'w4M2099455l9k9Vy6l4PA136Y62l05lX';
  //
  /// client production
  initClient() async {
    String basicAuth =
        'Basic ' + base64Encode(utf8.encode('$username:$password'));
    _baseOptions = BaseOptions(
        baseUrl: Urls.baseUrlDev,
        connectTimeout: 30000,
        receiveTimeout: 1000000,
        followRedirects: true,
        headers: {
          HttpHeaders.contentTypeHeader: 'application/json',
          HttpHeaders.acceptHeader: 'application/json',
          "authorization": basicAuth
        },
        responseType: ResponseType.json,
        receiveDataWhenStatusError: true);

    dio = Dio(_baseOptions);

    (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (client) {
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) {
        return true;
      };
    };

    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (reqOptions, handler) {
        return handler.next(reqOptions);
      },
      onError: (DioError dioError, handler) {
        return handler.next(dioError);
      },
    ));
  }

  /// Master provider
  ///
  Future<Response> getDashboardData() {
    return dio.get(Urls.getDashboardData);
  }

  //package
  Future<Response> singlePackageDetails(request) {
    return dio.get(Urls.singlePackageDetails);
  }

  //test
  Future<Response> singleTestDetails(request) {
    return dio.get(Urls.singleTestDetails);
  }

  ///cart api provider

  Future<Response> addToCart(request) {
    return dio.post(Urls.addToCart, data: request);
  }

  ///booking  provider

  Future<Response> getMyBookingList(MyBookingRequest request) {
    return dio.get(Urls.getBookingList);
  }

  /// search provider

  //test
  Future<Response> searchTest(SearchRequest request) {
    return dio.post(Urls.searchTest, data: request);
  }

  //package
  Future<Response> searchPackage(SearchRequest request) {
    return dio.post(Urls.searchPackage, data: request);
  }

  ///auth provider

  Future<Response>? getOtp(phoneNo) {
    try {
      return dio.get(Urls.getOtp + phoneNo);
    } on DioError catch (ex) {
      if (ex.type == DioErrorType.connectTimeout) {
        throw Exception("Connection  Timeout Exception");
      }
      throw Exception(ex.message);
    }
  }

  ///auth create account

  Future<Response> createAccountWithPhoneNo(AuthUserRequest request) {
    return dio.post(Urls.createAccount, data: request);
  }

  ///categories

  Future<Response> categoriesRequest(request) {
    return dio.post(Urls.categories, data: request);
  }

  ///list my profile

  Future<Response> listMyProfile() {
    return dio.get(Urls.categories);
  }
}
