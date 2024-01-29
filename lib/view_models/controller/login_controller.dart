import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sabji/data/repository/login_repository.dart';

import 'package:sabji/res/routes/routes_name.dart';
import 'package:sabji/utils/shared_preference.dart';
import 'package:sabji/utils/utils.dart';

import '../../res/constants/app_constants.dart';

class LoginController extends GetxController {
  final _api = LoginRepository();
  final emailController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;
  RxBool loading = false.obs;

  Future<void> loginApi() async {
    loading.value = true;
    Map data = {
      'username': emailController.value.text.toString(),
      'password': passwordController.value.text.toString()
    };
    var respData = await _api.loginApi(data);
    print("@@@@@@@@@@@@@@@@@@@@@" + respData.toString());
    loading.value = false;
    if (respData[AppConstants.requestCustomCode] == "200") {
      PreferenceUtils.setString(
          AppConstants.userId, emailController.value.text.toString());
      PreferenceUtils.setString(
          AppConstants.token, respData[AppConstants.requestToken]);
      Get.offAndToNamed(RouteName.homeView);
    } else {
      Utils.snackBar('Login Error', 'User Name And Password Did Not Match');
    }
    // _api.loginApi(data).then((data) {
    //   Map<String, dynamic> jsonMap = json.decode(data);
    //   print("@@@@@@@@@@@@@@@@@@@@@"+jsonMap.toString());
    //   loading.value = false;
    //   if (data[AppConstants.requestCustomCode] == "200") {
    //     PreferenceUtils.setString(AppConstants.userId, emailController.value.text.toString());
    //     PreferenceUtils.setString(AppConstants.token, data[AppConstants.requestToken]);
    //     Get.toNamed(RouteName.homeView);
    //   } else {
    //     Utils.snackBar('Login', 'Login Failed');
    //   }
    // }).onError((error, stackTrace) {
    //   print("************************"+error.toString());
    //   loading.value = false;
    //   Utils.snackBar('Error', error.toString());
    // });
  }
}
