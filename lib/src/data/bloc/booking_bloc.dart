import 'dart:async';

import 'package:micro_digital/src/constants/strings.dart';
import 'package:micro_digital/src/data/model/common/state_model.dart';
import 'package:micro_digital/src/data/model/my_booking/my_booking_request.dart';
import 'package:micro_digital/src/data/model/my_booking/my_booking_response.dart';
import 'package:micro_digital/src/data/shared_pref/object_factory.dart';



class BookingBloc {

  bool _isDisposed = false;

  /// stream for loader
  final _loadingSC = new StreamController<bool>.broadcast();
  StreamSink<bool> get loadingSink => _loadingSC.sink;
  Stream<bool> get loadingListener => _loadingSC.stream;

  /// stream for getting company base url
  final _getBookingListSC = StreamController<MyBookingResponse>.broadcast();
  StreamSink<MyBookingResponse> get getBookingListSCSink => _getBookingListSC.sink;
  Stream<MyBookingResponse> get getBookingListSCListener => _getBookingListSC.stream;




  /// method used for fetching company url using company id
  getBookingList({required MyBookingRequest request}) async {
    if (_isDisposed) {
      return;
    }
    loadingSink.add(true);
    StateModel? state = await ObjectFactory().repository.getBookingList(request);

    if (state is SuccessState) {
      if (!_getBookingListSC.isClosed) {
        getBookingListSCSink.add(state.value as MyBookingResponse);

      }
    } else if (state is ErrorState) {
      getBookingListSCSink.addError(Strings.SOME_ERROR_OCCURRED);

    }
    loadingSink.add(false);
  }



  ///controllers disposed here
  void dispose() {

    _loadingSC.close();
    _getBookingListSC.close();
  }
}