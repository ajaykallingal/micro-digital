import 'package:micro_digital/src/data/model/common/state_model.dart';
import 'package:micro_digital/src/data/model/dashboard/dashboard_response.dart';
import 'package:micro_digital/src/data/model/master/get_company_url/get_company_url_response.dart';
import 'package:micro_digital/src/data/model/master/package/single_package_response.dart';
import 'package:micro_digital/src/data/model/master/test/single_test_details.dart';
import 'package:micro_digital/src/data/shared_pref/object_factory.dart';


class MasterApiProvider {
  Future<StateModel> getDashboardData() async {
    final response = await ObjectFactory().apiClient.getDashboardData();
    print("response" + response.toString());
    if (response.statusCode == 200) {
      // ObjectFactory().prefs.saveCompanyBaseUrl(baseUrl: GetBaseUrlResponse.fromJson(response.data).data[0].restaurantCrmUrl);
      return StateModel<DashboardResponse>.success(DashboardResponse.fromJson(response.data));
    } else
      {

      return StateModel<String>.error("Error Occurred");
    }
  }

  ///packages
  ///
  Future<StateModel> singlePackageDetails(request) async {
    final response = await ObjectFactory().apiClient.singlePackageDetails(request);
    print("response" + response.toString());
    if (response.statusCode == 200) {
      // ObjectFactory().prefs.saveCompanyBaseUrl(baseUrl: GetBaseUrlResponse.fromJson(response.data).data[0].restaurantCrmUrl);
      return StateModel<SinglePackageResponse>.success(SinglePackageResponse.fromJson(response.data));
    } else
      {

      return StateModel<String>.error("Error Occurred");
    }
  }
  ///Test
  ///
  Future<StateModel> singleTestDetails(request) async {
    final response = await ObjectFactory().apiClient.singleTestDetails(request);
    print("response" + response.toString());
    if (response.statusCode == 200) {
      // ObjectFactory().prefs.saveCompanyBaseUrl(baseUrl: GetBaseUrlResponse.fromJson(response.data).data[0].restaurantCrmUrl);
      return StateModel<SingleTestResponse>.success(SingleTestResponse.fromJson(response.data));
    } else
      {

      return StateModel<String>.error("Error Occurred");
    }
  }



}