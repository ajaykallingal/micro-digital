import 'package:micro_digital/src/data/model/checkout/checkout_Order_Response.dart';

import '../model/common/state_model.dart';
import '../shared_pref/object_factory.dart';

class OrderApiProvider {
  ///checkout
  ///
  Future<StateModel> checkoutOrder(request) async {
    final response = await ObjectFactory().apiClient.checkoutOrder(request);
    print("response" + response.toString());
    if (response.statusCode == 200) {
      // ObjectFactory().prefs.saveCompanyBaseUrl(baseUrl: GetBaseUrlResponse.fromJson(response.data).data[0].restaurantCrmUrl);
      return StateModel<CheckoutOrderResponse>.success(
          CheckoutOrderResponse.fromJson(response.data));
    } else {
      return StateModel<String>.error("Error Occurred");
    }
  }
}
