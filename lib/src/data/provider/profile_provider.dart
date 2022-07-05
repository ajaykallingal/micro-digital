import '../model/common/state_model.dart';
import '../model/profile/create_profile/create_profile_response.dart';
import '../model/profile/list_my_profile/list_my_profile_response.dart';
import '../shared_pref/object_factory.dart';

class ProfileApiProvider {
  ///Create profile
  ///
  Future<StateModel> createProfile(request) async {
    final response = await ObjectFactory().apiClient.createProfile(request);
    print("response" + response.toString());
    if (response.statusCode == 200) {
      // ObjectFactory().prefs.saveCompanyBaseUrl(baseUrl: GetBaseUrlResponse.fromJson(response.data).data[0].restaurantCrmUrl);
      return StateModel<CreateProfileResponse>.success(
          CreateProfileResponse.fromJson(response.data));
    } else {
      return StateModel<String>.error("Error Occurred");
    }
  }

  ///List my profiles
  ///
  Future<StateModel> listMyProfile(String request) async {
    final response = await ObjectFactory().apiClient.listMyProfile(request);
    print("response" + response.toString());
    if (response.statusCode == 200) {
      // ObjectFactory().prefs.saveCompanyBaseUrl(baseUrl: GetBaseUrlResponse.fromJson(response.data).data[0].restaurantCrmUrl);
      return StateModel<ListMyProfileResponse>.success(
          ListMyProfileResponse.fromJson(response.data));
    } else {
      return StateModel<String>.error("Error Occurred");
    }
  }
}
