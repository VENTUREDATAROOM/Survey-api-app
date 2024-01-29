import 'dart:convert';

import '../../res/constants/app_constants.dart';
import '../../res/constants/app_url.dart';
import '../../utils/shared_preference.dart';
import '../network/network_api_services.dart';

class AddedFarmersRepository {
  final _apiService = NetworkApiServices();

  Future<dynamic> getAddedFarmersURL() async {
    String token = PreferenceUtils.getString(AppConstants.token);
    dynamic response = await _apiService.getApi(AppUrl.getAddedFarmersURL+PreferenceUtils.getString(AppConstants.userId), token);
    return response;
  }

}