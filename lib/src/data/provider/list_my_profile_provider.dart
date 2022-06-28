import 'package:micro_digital/src/data/model/list_my_profile/list_my_profile_response.dart';

import '../model/common/state_model.dart';
import '../shared_pref/object_factory.dart';

class ListMyProfileApiProvider {
  Future<StateModel> listMyProfile() async {
    final response = await ObjectFactory().apiClient.listMyProfile();
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
