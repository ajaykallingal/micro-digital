import 'dart:async';

import 'package:micro_digital/src/data/model/checkout/checkout_Order_Response.dart';

import '../../constants/strings.dart';
import '../model/common/state_model.dart';
import '../shared_pref/object_factory.dart';

class OrderBloc {
  bool _isDisposed = false;

  /// stream for loader
  final _loadingSC = new StreamController<bool>.broadcast();
  StreamSink<bool> get loadingSink => _loadingSC.sink;
  Stream<bool> get loadingListener => _loadingSC.stream;

  /// stream for getting company base url
  final _checkoutOrderSC = StreamController<CheckoutOrderResponse>.broadcast();
  StreamSink<CheckoutOrderResponse> get checkoutOrderSCSink =>
      _checkoutOrderSC.sink;
  Stream<CheckoutOrderResponse> get checkoutOrderSCListener =>
      _checkoutOrderSC.stream;

  /// method used for fetching company url using company id
  checkoutOrder({required request}) async {
    if (_isDisposed) {
      return;
    }
    loadingSink.add(true);
    StateModel? state = await ObjectFactory().repository.checkoutOrder(request);

    if (state is SuccessState) {
      if (!_checkoutOrderSC.isClosed) {
        checkoutOrderSCSink.add(state.value as CheckoutOrderResponse);
      }
    } else if (state is ErrorState) {
      checkoutOrderSCSink.addError(Strings.SOME_ERROR_OCCURRED);
    }
    loadingSink.add(false);
  }

  void dispose() {
    _loadingSC.close();
    _checkoutOrderSC.close();
  }
}
