import 'dart:async';

import 'package:micro_digital/src/constants/strings.dart';
import 'package:micro_digital/src/data/model/cart/add_to_cart_response.dart';
import 'package:micro_digital/src/data/model/common/state_model.dart';
import 'package:micro_digital/src/data/model/my_booking/my_booking_request.dart';
import 'package:micro_digital/src/data/model/my_booking/my_booking_response.dart';
import 'package:micro_digital/src/data/shared_pref/object_factory.dart';



class CartBloc {

  bool _isDisposed = false;

  /// stream for loader
  final _loadingSC = new StreamController<bool>.broadcast();
  StreamSink<bool> get loadingSink => _loadingSC.sink;
  Stream<bool> get loadingListener => _loadingSC.stream;

  /// stream for getting company base url
  final _addToCartSC = StreamController<AddToCartResponse>.broadcast();
  StreamSink<AddToCartResponse> get addToCartSCSink => _addToCartSC.sink;
  Stream<AddToCartResponse> get addToCartSCListener => _addToCartSC.stream;




  /// method used for fetching company url using company id
  addToCart({required request}) async {
    if (_isDisposed) {
      return;
    }
    loadingSink.add(true);
    StateModel? state = await ObjectFactory().repository.addToCart(request);

    if (state is SuccessState) {
      if (!_addToCartSC.isClosed) {
        addToCartSCSink.add(state.value as AddToCartResponse);
      }
    } else if (state is ErrorState) {
      addToCartSCSink.addError(Strings.SOME_ERROR_OCCURRED);
    }
    loadingSink.add(false);
  }



  ///controllers disposed here
  void dispose() {
    _loadingSC.close();
    _addToCartSC.close();
  }
}