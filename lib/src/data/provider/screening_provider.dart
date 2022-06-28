import 'package:micro_digital/src/data/model/common/state_model.dart';
import 'package:micro_digital/src/data/model/screening/screening_response.dart';
import 'package:micro_digital/src/data/shared_pref/object_factory.dart';


class ScreeningApiProvider {
  Future<StateModel> screeningRequest(request) async {
    final response = await ObjectFactory().apiClient.screeningRequest(request);
    print("response" + response.toString());
    if (response.statusCode == 200) {
      // ObjectFactory().prefs.saveCompanyBaseUrl(baseUrl: GetBaseUrlResponse.fromJson(response.data).data[0].restaurantCrmUrl);
      return StateModel<ScreeningResponse>.success(ScreeningResponse.fromJson(response.data));
    } else
    {
      return StateModel<String>.error("Error Occurred");
    }
  }
}