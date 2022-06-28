import 'package:micro_digital/src/data/model/categories/categories_response.dart';

import '../model/common/state_model.dart';
import '../shared_pref/object_factory.dart';

class CategoriesApiProvider {
  ///add to Cart
  ///
  Future<StateModel> categoriesRequest(request) async {
    final response = await ObjectFactory().apiClient.categoriesRequest(request);
    print("response" + response.toString());
    if (response.statusCode == 200) {
      // ObjectFactory().prefs.saveCompanyBaseUrl(baseUrl: GetBaseUrlResponse.fromJson(response.data).data[0].restaurantCrmUrl);
      return StateModel<CategoriesResponse>.success(
          CategoriesResponse.fromJson(response.data));
    } else {
      return StateModel<String>.error("Error Occurred");
    }
  }
}
