import 'dart:async';

import 'package:micro_digital/src/constants/strings.dart';
import 'package:micro_digital/src/data/model/cart/add_to_cart_response.dart';
import 'package:micro_digital/src/data/model/common/state_model.dart';
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

  /// stream for getting company base url
  final _deleteCartSC = StreamController<AddToCartResponse>.broadcast();
  StreamSink<AddToCartResponse> get deleteCartSCSink => _addToCartSC.sink;
  Stream<AddToCartResponse> get deleteCartSCListener => _addToCartSC.stream;

  /// stream for getting company base url
  final _listCartSC = StreamController<AddToCartResponse>.broadcast();
  StreamSink<AddToCartResponse> get listCartSCSink => _addToCartSC.sink;
  Stream<AddToCartResponse> get listCartSCListener => _addToCartSC.stream;

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

  /// delete cart
  deleteFromCart({required request}) async {
    if (_isDisposed) {
      return;
    }
    loadingSink.add(true);
    StateModel? state =
        await ObjectFactory().repository.deleteFromCart(request);

    if (state is SuccessState) {
      if (!_deleteCartSC.isClosed) {
        deleteCartSCSink.add(state.value as AddToCartResponse);
      }
    } else if (state is ErrorState) {
      deleteCartSCSink.addError(Strings.SOME_ERROR_OCCURRED);
    }
    loadingSink.add(false);
  }

  /// list cart
  getCartList(request) async {
    if (_isDisposed) {
      return;
    }
    loadingSink.add(true);
    StateModel? state = await ObjectFactory().repository.getCartList(request);

    if (state is SuccessState) {
      if (!_listCartSC.isClosed) {
        listCartSCSink.add(state.value as AddToCartResponse);
      }
    } else if (state is ErrorState) {
      listCartSCSink.addError(Strings.SOME_ERROR_OCCURRED);
    }
    loadingSink.add(false);
  }

  ///controllers disposed here
  void dispose() {
    _loadingSC.close();
    _addToCartSC.close();
    _deleteCartSC.close();
    _listCartSC.close();
  }
}
