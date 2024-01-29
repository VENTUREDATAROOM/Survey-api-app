import '../../res/constants/app_constants.dart';
import '../../res/constants/app_url.dart';
import '../../utils/shared_preference.dart';
import '../network/network_api_services.dart';

class DashboardDetailsRepository {
  final _apiService = NetworkApiServices();

  Future<dynamic> getFarmerRecordsCountApi() async {
    String token = PreferenceUtils.getString(AppConstants.token);
    dynamic response = _apiService.getApi(AppUrl.getFarmerRecordsCount+PreferenceUtils.getString(AppConstants.userId), token);
    return response;
  }

  Future<dynamic> getVendorRecordsCountApi() async {
    String token = PreferenceUtils.getString(AppConstants.token);
    dynamic response = _apiService.getApi(AppUrl.getVendorRecordsCount+PreferenceUtils.getString(AppConstants.userId), token);
    return response;
  }

  Future<dynamic> getCropRecordsCountApi() async {
    String token = PreferenceUtils.getString(AppConstants.token);
    dynamic response = _apiService.getApi(AppUrl.getCropRecordsCount+PreferenceUtils.getString(AppConstants.userId), token);
    return response;
  }

  Future<dynamic> getDriverRecordsCountApi() async {
    String token = PreferenceUtils.getString(AppConstants.token);
    dynamic response = _apiService.getApi(AppUrl.getDriverRecordsCount+PreferenceUtils.getString(AppConstants.userId), token);
    return response;
  }
}