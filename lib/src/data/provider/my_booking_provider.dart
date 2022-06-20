import 'package:micro_digital/src/data/model/common/state_model.dart';
import 'package:micro_digital/src/data/model/dashboard/dashboard_response.dart';
import 'package:micro_digital/src/data/model/master/get_company_url/get_company_url_response.dart';
import 'package:micro_digital/src/data/model/my_booking/my_booking_response.dart';
import 'package:micro_digital/src/data/shared_pref/object_factory.dart';


class BookingApiProvider {
  Future<StateModel> getMyBookingList(request) async {
    final response = await ObjectFactory().apiClient.getMyBookingList(request);
    print("response" + response.toString());
    if (response.statusCode == 200) {
      // ObjectFactory().prefs.saveCompanyBaseUrl(baseUrl: GetBaseUrlResponse.fromJson(response.data).data[0].restaurantCrmUrl);
      return StateModel<MyBookingResponse>.success(MyBookingResponse.fromJson(response.data));
    } else
    {
      return StateModel<String>.error("Error Occurred");
    }
  }
}