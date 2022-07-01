import 'package:micro_digital/src/data/model/cart/add_to_cart_response.dart';
import 'package:micro_digital/src/data/model/common/state_model.dart';
import 'package:micro_digital/src/data/shared_pref/object_factory.dart';

class CartApiProvider {
  ///add to Cart
  ///
  Future<StateModel> addToCart(request) async {
    final response = await ObjectFactory().apiClient.addToCart(request);
    print("response" + response.toString());
    if (response.statusCode == 200) {
      // ObjectFactory().prefs.saveCompanyBaseUrl(baseUrl: GetBaseUrlResponse.fromJson(response.data).data[0].restaurantCrmUrl);
      return StateModel<AddToCartResponse>.success(
          AddToCartResponse.fromJson(response.data));
    } else {
      return StateModel<String>.error("Error Occurred");
    }
  }

  ///delete from cart
  ///

  Future<StateModel> deleteFromCart(request) async {
    final response = await ObjectFactory().apiClient.deleteFromCart(request);
    print("response" + response.toString());
    if (response.statusCode == 200) {
      // ObjectFactory().prefs.saveCompanyBaseUrl(baseUrl: GetBaseUrlResponse.fromJson(response.data).data[0].restaurantCrmUrl);
      return StateModel<AddToCartResponse>.success(
          AddToCartResponse.fromJson(response.data));
    } else {
      return StateModel<String>.error("Error Occurred");
    }
  }

  ///getCartList
  ///
  Future<StateModel> getCartList(request) async {
    final response = await ObjectFactory().apiClient.getCartList(request);
    print("response" + response.toString());
    if (response.statusCode == 200) {
      // ObjectFactory().prefs.saveCompanyBaseUrl(baseUrl: GetBaseUrlResponse.fromJson(response.data).data[0].restaurantCrmUrl);
      return StateModel<AddToCartResponse>.success(
          AddToCartResponse.fromJson(response.data));
    } else {
      return StateModel<String>.error("Error Occurred");
    }
  }
}
