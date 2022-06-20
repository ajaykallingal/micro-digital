import 'dart:async';

import 'package:micro_digital/src/constants/strings.dart';
import 'package:micro_digital/src/data/model/common/state_model.dart';
import 'package:micro_digital/src/data/model/my_booking/my_booking_request.dart';
import 'package:micro_digital/src/data/model/my_booking/my_booking_response.dart';
import 'package:micro_digital/src/data/model/search/search_package_response.dart';
import 'package:micro_digital/src/data/model/search/search_request.dart';
import 'package:micro_digital/src/data/model/search/search_test_response.dart';
import 'package:micro_digital/src/data/shared_pref/object_factory.dart';



class SearchBloc {

  bool _isDisposed = false;

  /// stream for loader
  final _loadingSC = new StreamController<bool>.broadcast();
  StreamSink<bool> get loadingSink => _loadingSC.sink;
  Stream<bool> get loadingListener => _loadingSC.stream;

  /// stream for getting company base url
  final _searchTestSC = StreamController<SearchTestResponse>.broadcast();
  StreamSink<SearchTestResponse> get searchTestSCSink => _searchTestSC.sink;
  Stream<SearchTestResponse> get searchTestSCListener => _searchTestSC.stream;

  /// stream for getting company base url
  final _searchPackageSC = StreamController<SearchPackageResponse>.broadcast();
  StreamSink<SearchPackageResponse> get searchPackageSCSink => _searchPackageSC.sink;
  Stream<SearchPackageResponse> get searchPackageSCListener => _searchPackageSC.stream;




  /// method used for fetching company url using company id
  searchTest({required SearchRequest request}) async {
    if (_isDisposed) {
      return;
    }
    loadingSink.add(true);
    StateModel? state = await ObjectFactory().repository.searchTest(request);

    if (state is SuccessState) {
      if (!_searchTestSC.isClosed) {
        searchTestSCSink.add(state.value as SearchTestResponse);

      }
    } else if (state is ErrorState) {
      searchTestSCSink.addError(Strings.SOME_ERROR_OCCURRED);

    }
    loadingSink.add(false);
  }

  /// method used for fetching company url using company id
  searchPackage({required SearchRequest request}) async {
    if (_isDisposed) {
      return;
    }
    loadingSink.add(true);
    StateModel? state = await ObjectFactory().repository.searchPackage(request);

    if (state is SuccessState) {
      if (!_searchPackageSC.isClosed) {
        searchPackageSCSink.add(state.value as SearchPackageResponse);
      }
    } else if (state is ErrorState) {
      searchPackageSCSink.addError(Strings.SOME_ERROR_OCCURRED);
    }
    loadingSink.add(false);
  }



  ///controllers disposed here
  void dispose() {

    _loadingSC.close();
    _searchTestSC.close();
    _searchPackageSC.close();
  }
}