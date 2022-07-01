import 'dart:async';

import 'package:micro_digital/src/constants/strings.dart';
import 'package:micro_digital/src/data/model/categories/categories_response.dart';
import 'package:micro_digital/src/data/model/common/state_model.dart';
import 'package:micro_digital/src/data/model/dashboard/dashboard_response.dart';
import 'package:micro_digital/src/data/model/master/package/single_package_response.dart';
import 'package:micro_digital/src/data/model/master/test/single_test_details.dart';
import 'package:micro_digital/src/data/shared_pref/object_factory.dart';

enum MasterBlocAction { fetch, clearData }

enum CounterAction { increment, decrement, reset, fetch }

enum ThemeAction { off, on }

class MasterBloc {
  bool _isDisposed = false;

  ///event stream
  final _eventSC = StreamController<MasterBlocAction>();
  StreamSink<MasterBlocAction> get eventSink => _eventSC.sink;
  Stream<MasterBlocAction> get eventStream => _eventSC.stream;

  /// event stream for theme
  final _eventThemeSC = StreamController<ThemeAction>();
  StreamSink<ThemeAction> get eventThemeSink => _eventThemeSC.sink;
  Stream<ThemeAction> get eventThemeStream => _eventThemeSC.stream;

  /// stream for theme mode status
  final _themeStatusSC = StreamController<bool>.broadcast();
  StreamSink<bool> get themeStatusSink => _themeStatusSC.sink;
  Stream<bool> get themeStatusStream => _themeStatusSC.stream;

  /// stream for loader
  final _loadingSC = new StreamController<bool>.broadcast();
  StreamSink<bool> get loadingSink => _loadingSC.sink;
  Stream<bool> get loadingListener => _loadingSC.stream;

  /// dashboard
  final _getDashboardSC = StreamController<DashboardResponse>.broadcast();
  StreamSink<DashboardResponse> get getDashboardSCSink => _getDashboardSC.sink;
  Stream<DashboardResponse> get getDashboardSCListener =>
      _getDashboardSC.stream;

  /// package
  final _singlePackageDetailsSC =
      StreamController<SinglePackageResponse>.broadcast();
  StreamSink<SinglePackageResponse> get singlePackageDetailsSCSink =>
      _singlePackageDetailsSC.sink;
  Stream<SinglePackageResponse> get singlePackageDetailsSCListener =>
      _singlePackageDetailsSC.stream;

  /// test
  final _singleTestDetailsSC = StreamController<SingleTestResponse>.broadcast();
  StreamSink<SingleTestResponse> get singleTestDetailsSCSink =>
      _singleTestDetailsSC.sink;
  Stream<SingleTestResponse> get singleTestDetailsSCListener =>
      _singleTestDetailsSC.stream;

  /// categories
  final _categoriesDetailsSC = StreamController<CategoriesResponse>.broadcast();
  StreamSink<CategoriesResponse> get categoriesDetailsSCSink =>
      _categoriesDetailsSC.sink;
  Stream<CategoriesResponse> get categoriesDetailsSCListener =>
      _categoriesDetailsSC.stream;

  MasterBloc() {
    eventStream.listen((event) {
      if (event == MasterBlocAction.fetch) {
        themeStatusSink.add(true);
        ObjectFactory().prefs.setDarkMode(true);
      } else if (event == MasterBlocAction.clearData) {
        themeStatusSink.add(false);
        ObjectFactory().prefs.setDarkMode(false);
      }
    });
  }

  /// method used for fetching company url using company id
  getDashboardData() async {
    if (_isDisposed) {
      return;
    }
    loadingSink.add(true);
    StateModel? state = await ObjectFactory().repository.getDashboardData();

    if (state is SuccessState) {
      if (!_getDashboardSC.isClosed) {
        getDashboardSCSink.add(state.value as DashboardResponse);
      }
    } else if (state is ErrorState) {
      getDashboardSCSink.addError(Strings.SOME_ERROR_OCCURRED);
    }
    loadingSink.add(false);
  }

  ///package
  singlePackageDetails(request) async {
    if (_isDisposed) {
      return;
    }
    loadingSink.add(true);
    StateModel? state =
        await ObjectFactory().repository.singlePackageDetails(request);

    if (state is SuccessState) {
      if (!_singlePackageDetailsSC.isClosed) {
        singlePackageDetailsSCSink.add(state.value as SinglePackageResponse);
      }
    } else if (state is ErrorState) {
      singlePackageDetailsSCSink.addError(Strings.SOME_ERROR_OCCURRED);
    }
    loadingSink.add(false);
  }

  ///test
  singleTestDetails(request) async {
    if (_isDisposed) {
      return;
    }
    loadingSink.add(true);
    StateModel? state =
        await ObjectFactory().repository.singleTestDetails(request);

    if (state is SuccessState) {
      if (!_singleTestDetailsSC.isClosed) {
        singleTestDetailsSCSink.add(state.value as SingleTestResponse);
      }
    } else if (state is ErrorState) {
      singleTestDetailsSCSink.addError(Strings.SOME_ERROR_OCCURRED);
    }
    loadingSink.add(false);
  }

  ///categories
  categoriesRequest(request) async {
    if (_isDisposed) {
      return;
    }
    loadingSink.add(true);
    StateModel? state =
        await ObjectFactory().repository.categoriesRequest(request);

    if (state is SuccessState) {
      if (!_categoriesDetailsSC.isClosed) {
        categoriesDetailsSCSink.add(state.value as CategoriesResponse);
      }
    } else if (state is ErrorState) {
      categoriesDetailsSCSink.addError(Strings.SOME_ERROR_OCCURRED);
    }
    loadingSink.add(false);
  }

  ///controllers disposed here
  void dispose() {
    _themeStatusSC.close();
    _eventSC.close();
    _eventThemeSC.close();
    _loadingSC.close();
    _getDashboardSC.close();
    _singleTestDetailsSC.close();
    _singlePackageDetailsSC.close();
    _categoriesDetailsSC.close();
  }
}
