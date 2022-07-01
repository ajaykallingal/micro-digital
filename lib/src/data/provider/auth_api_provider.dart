import '../model/auth/auth_request_response.dart';
import '../model/auth/auth_response.dart';
import '../model/common/state_model.dart';
import '../shared_pref/object_factory.dart';

class AuthApiProvider {
  Future<StateModel> createAccountWithPhoneNo(request) async {
    final response =
        await ObjectFactory().apiClient.createAccountWithPhoneNo(request);
    print("response" + response.toString());
    if (response.statusCode == 200) {
      // ObjectFactory().prefs.saveCompanyBaseUrl(baseUrl: GetBaseUrlResponse.fromJson(response.data).data[0].restaurantCrmUrl);
      return StateModel<AuthUserRequestResponse>.success(
          AuthUserRequestResponse.fromJson(response.data));
    } else {
      return StateModel<String>.error("Error Occurred");
    }
  }

  Future<StateModel> getOtp(String phoneNo) async {
    final response = await ObjectFactory().apiClient.getOtp(phoneNo);
    print("response" + response.toString());
    if (response!.statusCode == 200) {
      // ObjectFactory().prefs.saveCompanyBaseUrl(baseUrl: GetBaseUrlResponse.fromJson(response.data).data[0].restaurantCrmUrl);
      return StateModel<AuthUserResponse>.success(
          AuthUserResponse.fromJson(response.data));
    } else {
      return StateModel<String>.error("Error Occurred");
    }
  }
}
