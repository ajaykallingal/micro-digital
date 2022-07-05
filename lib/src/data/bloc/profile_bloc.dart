import 'dart:async';

import '../../constants/strings.dart';
import '../model/common/state_model.dart';
import '../model/profile/create_profile/create_profile_response.dart';
import '../model/profile/list_my_profile/list_my_profile_response.dart';
import '../shared_pref/object_factory.dart';

class ProfileBloc {
  /// Profiles
  bool _isDisposed = false;

  /// stream for loader
  final _loadingSC = new StreamController<bool>.broadcast();
  StreamSink<bool> get loadingSink => _loadingSC.sink;
  Stream<bool> get loadingListener => _loadingSC.stream;

  /// list my profiles
  final _listMyProfileSC = StreamController<ListMyProfileResponse>.broadcast();
  StreamSink<ListMyProfileResponse> get listMyProfileSCSink =>
      _listMyProfileSC.sink;
  Stream<ListMyProfileResponse> get listMyProfileSCListener =>
      _listMyProfileSC.stream;

  /// create my profile
  final _createProfileSC = StreamController<CreateProfileResponse>.broadcast();
  StreamSink<CreateProfileResponse> get createProfileSCSink =>
      _createProfileSC.sink;
  Stream<CreateProfileResponse> get createProfileSCListener =>
      _createProfileSC.stream;

  /// method used for fetching company url using company id
  listMyProfile(String request) async {
    if (_isDisposed) {
      return;
    }
    loadingSink.add(true);
    StateModel? state = await ObjectFactory().repository.listMyProfile(request);

    if (state is SuccessState) {
      if (!_listMyProfileSC.isClosed) {
        listMyProfileSCSink.add(state.value as ListMyProfileResponse);
      }
    } else if (state is ErrorState) {
      listMyProfileSCSink.addError(Strings.SOME_ERROR_OCCURRED);
    }
    loadingSink.add(false);
  }

  /// method used for fetching company url using company id
  createProfile({required request}) async {
    if (_isDisposed) {
      return;
    }
    loadingSink.add(true);
    StateModel? state = await ObjectFactory().repository.createProfile(request);

    if (state is SuccessState) {
      if (!_createProfileSC.isClosed) {
        createProfileSCSink.add(state.value as CreateProfileResponse);
      }
    } else if (state is ErrorState) {
      createProfileSCSink.addError(Strings.SOME_ERROR_OCCURRED);
    }
    loadingSink.add(false);
  }

  ///controllers disposed here

  void dispose() {
    _listMyProfileSC.close();
    _createProfileSC.close();
    _loadingSC.close();
  }
}
