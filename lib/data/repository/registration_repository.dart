import 'package:sabji/data/network/network_api_services.dart';

import '../../res/constants/app_url.dart';



class RegisterRepository{
  final _apiService = NetworkApiServices();
  Future<dynamic> registerApi(var data) async{
    dynamic response = _apiService.postApi(data, AppUrl.registerUrl,"");
    return response;
  }

}