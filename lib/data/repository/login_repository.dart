import 'package:get/get.dart';
import 'package:sabji/data/network/network_api_services.dart';

import '../../res/constants/app_url.dart';


class LoginRepository{
  final _apiService = NetworkApiServices();
  
  Future<dynamic> loginApi(var data) async{

  dynamic response = _apiService.postApiEncoded(data, AppUrl.loginUrl,"");
  print("##########################"+response.toString());
  return response;

  }

}