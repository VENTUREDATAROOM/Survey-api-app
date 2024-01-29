import '../../res/constants/app_constants.dart';
import '../../res/constants/app_url.dart';
import '../../utils/shared_preference.dart';
import '../network/network_api_services.dart';

class VendorDetailsRepository {
  final _apiService = NetworkApiServices();
  Future<dynamic> addVendorDetailsApi(var data) async {
    String token = PreferenceUtils.getString(AppConstants.token);
    dynamic response =
        _apiService.postApi(data, AppUrl.addVendorDetailsUrl, token);
    return response;
  }

  Future<dynamic> updateVendorDetailsApi(var data) async {
    String token = PreferenceUtils.getString(AppConstants.token);
    dynamic response =
        _apiService.putApi(data, AppUrl.updateVendorDetailsUrl, token);
    return response;
  }
}
