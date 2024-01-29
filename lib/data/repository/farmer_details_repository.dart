import '../../res/constants/app_constants.dart';
import '../../res/constants/app_url.dart';
import '../../utils/shared_preference.dart';
import '../network/network_api_services.dart';

class FarmerDetailsRepository {
  final _apiService = NetworkApiServices();
  Future<dynamic> addFarmerDetailsApi(var data) async {
    String token = PreferenceUtils.getString(AppConstants.token);
    dynamic response = _apiService.postApi(data, AppUrl.addKisanDataUrl, token);
    return response;
  }

  Future<dynamic> updateFarmerDetailsApi(var data) async {
    String token = PreferenceUtils.getString(AppConstants.token);
    dynamic response =
        _apiService.putApi(data, AppUrl.updateKisanDataUrl, token);
    return response;
  }
}
