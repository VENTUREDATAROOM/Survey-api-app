import '../../res/constants/app_constants.dart';
import '../../res/constants/app_url.dart';
import '../../utils/shared_preference.dart';
import '../network/network_api_services.dart';

class CropDetailsRepository {
  final _apiService = NetworkApiServices();
  Future<dynamic> addCropDetailsApi(var data) async {
    String token = PreferenceUtils.getString(AppConstants.token);
    dynamic response =
        _apiService.postApi(data, AppUrl.addVegitableDetailsUrl, token);
    return response;
  }

  Future<dynamic> editCropDetailsApi(var data) async {
    String token = PreferenceUtils.getString(AppConstants.token);
    dynamic response = _apiService.putApi(data, AppUrl.updatevegetables, token);
    return response;
  }
}
