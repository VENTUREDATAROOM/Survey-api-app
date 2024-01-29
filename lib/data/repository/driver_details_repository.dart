import 'dart:developer';

import 'package:sabji/data/network/network_api_services.dart';
import 'package:sabji/res/constants/app_url.dart';

import '../../res/constants/app_constants.dart';
import '../../utils/shared_preference.dart';

class DriverDetailsRepository {
  final _apiService = NetworkApiServices();
  Future<dynamic> addDriverDetailsApi(var data) async {
    String token = PreferenceUtils.getString(AppConstants.token);
    dynamic response =
        _apiService.postApi(data, AppUrl.addDriverDetailsUrl, token);
    log("data : $data");
    log("url: ${AppUrl.addDriverDetailsUrl}");
    log("Token : $token");
    return response;
  }

  Future<dynamic> updateDriverDetailsApi(var data) async {
    String token = PreferenceUtils.getString(AppConstants.token);
    dynamic response =
        _apiService.putApi(data, AppUrl.updateDriverDetailsUrl, token);
    return response;
  }
}
