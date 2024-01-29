
import '../../res/constants/app_constants.dart';
import '../../res/constants/app_url.dart';
import '../../utils/shared_preference.dart';
import '../network/network_api_services.dart';

class AddedVendorRepository {
  final _apiService = NetworkApiServices();
  Future<dynamic> getAddedVendorUrl() async {
    String token = PreferenceUtils.getString(AppConstants.token);
    dynamic response =await _apiService.getApi(AppUrl.getAddedVendorUrl+PreferenceUtils.getString(AppConstants.userId), token);
    return response;
  }

}