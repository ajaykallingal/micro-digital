


import 'dart:async';

import '../../constants/strings.dart';
import '../model/auth/auth_response.dart';
import '../model/common/state_model.dart';
import '../shared_pref/object_factory.dart';

class AuthBloc {

  bool _isDisposed = false;

  /// stream for loader
  final _loadingSC = new StreamController<bool>.broadcast();
  StreamSink<bool> get loadingSink => _loadingSC.sink;
  Stream<bool> get loadingListener => _loadingSC.stream;

  /// stream for getting company base url
  final _otpLoginSC = StreamController<AuthUserResponse>.broadcast();
  StreamSink<AuthUserResponse> get otpLoginSCSink => _otpLoginSC.sink;
  Stream<AuthUserResponse> get otpLoginSCListener => _otpLoginSC.stream;


  final _getOtpSC =  StreamController<AuthUserResponse>.broadcast();
  StreamSink<AuthUserResponse> get getOtpSCSink => _getOtpSC.sink;
  Stream<AuthUserResponse> get getOtpSCListener => _getOtpSC.stream;




  /// method used for fetching company url using company id
  createAccountWithPhoneNo({required request}) async {
    if (_isDisposed) {
      return;
    }
    loadingSink.add(true);
    StateModel? state = await ObjectFactory().repository.createAccountWithPhoneNo(request);

    if (state is SuccessState) {
      if (!_otpLoginSC.isClosed) {
        otpLoginSCSink.add(state.value as AuthUserResponse);
      }
    } else if (state is ErrorState) {
      otpLoginSCSink.addError(Strings.SOME_ERROR_OCCURRED);
    }
    loadingSink.add(false);
  }

  getOtp({required String phoneNo}) async {
    if (_isDisposed) {
      return;
    }
    loadingSink.add(true);
    StateModel? state = await ObjectFactory().repository.getOtp(phoneNo);

    if (state is SuccessState) {
      if (!_getOtpSC.isClosed) {
        getOtpSCSink.add(state.value as AuthUserResponse);
      }
    } else if (state is ErrorState) {
      getOtpSCSink.addError(Strings.SOME_ERROR_OCCURRED);
    }
    loadingSink.add(false);
  }



  ///controllers disposed here
  void dispose() {
    _loadingSC.close();
    _otpLoginSC.close();
  }
}