import 'package:micro_digital/src/data/model/common/state_model.dart';
import 'package:micro_digital/src/data/model/dashboard/dashboard_response.dart';
import 'package:micro_digital/src/data/model/master/get_company_url/get_company_url_response.dart';
import 'package:micro_digital/src/data/model/my_booking/my_booking_response.dart';
import 'package:micro_digital/src/data/model/search/search_package_response.dart';
import 'package:micro_digital/src/data/model/search/search_test_response.dart';
import 'package:micro_digital/src/data/shared_pref/object_factory.dart';


class SearchApiProvider {
  Future<StateModel> searchTest(request) async {
    final response = await ObjectFactory().apiClient.searchTest(request);
    print("response" + response.toString());
    if (response.statusCode == 200) {
      // ObjectFactory().prefs.saveCompanyBaseUrl(baseUrl: GetBaseUrlResponse.fromJson(response.data).data[0].restaurantCrmUrl);
      return StateModel<SearchTestResponse>.success(SearchTestResponse.fromJson(response.data));
    } else
    {

      return StateModel<String>.error("Error Occurred");
    }
  }
  Future<StateModel> searchPackage(request) async {
    final response = await ObjectFactory().apiClient.searchPackage(request);
    print("response" + response.toString());
    if (response.statusCode == 200) {
      // ObjectFactory().prefs.saveCompanyBaseUrl(baseUrl: GetBaseUrlResponse.fromJson(response.data).data[0].restaurantCrmUrl);
      return StateModel<SearchPackageResponse>.success(SearchPackageResponse.fromJson(response.data));
    } else
    {

      return StateModel<String>.error("Error Occurred");
    }
  }
}