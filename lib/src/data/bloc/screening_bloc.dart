import 'dart:async';

import 'package:micro_digital/src/constants/strings.dart';
import 'package:micro_digital/src/data/model/common/state_model.dart';
import 'package:micro_digital/src/data/model/my_booking/my_booking_request.dart';
import 'package:micro_digital/src/data/model/my_booking/my_booking_response.dart';
import 'package:micro_digital/src/data/model/screening/screening_request.dart';
import 'package:micro_digital/src/data/model/screening/screening_response.dart';
import 'package:micro_digital/src/data/shared_pref/object_factory.dart';



class ScreeningBloc {

  bool _isDisposed = false;

  /// stream for loader
  final _loadingSC = new StreamController<bool>.broadcast();
  StreamSink<bool> get loadingSink => _loadingSC.sink;
  Stream<bool> get loadingListener => _loadingSC.stream;

  /// stream for getting company base url
  final _screeningSC = StreamController<ScreeningResponse>.broadcast();
  StreamSink<ScreeningResponse> get screeningSCSink => _screeningSC.sink;
  Stream<ScreeningResponse> get screeningSCListener => _screeningSC.stream;




  /// method used for fetching company url using company id
  screeningRequest({required ScreeningRequest request}) async {
    if (_isDisposed) {
      return;
    }
    loadingSink.add(true);
    StateModel? state = await ObjectFactory().repository.screeningRequest(request);

    if (state is SuccessState) {
      if (!_screeningSC.isClosed) {
        screeningSCSink.add(state.value as ScreeningResponse);
      }
    } else if (state is ErrorState) {
      screeningSCSink.addError(Strings.SOME_ERROR_OCCURRED);

    }
    loadingSink.add(false);
  }



  ///controllers disposed here
  void dispose() {

    _loadingSC.close();
    _screeningSC.close();
  }
}