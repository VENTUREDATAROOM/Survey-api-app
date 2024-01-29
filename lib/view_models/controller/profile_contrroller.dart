import 'dart:developer';

import 'package:get/get.dart';
import 'package:sabji/data/repository/profile_repository.dart';

import '../../utils/utils.dart';

class ProfileController extends GetxController {
  var mobileno = ''.obs;
  var name = ''.obs;
  var dob = ''.obs;
  var email = ''.obs;
  var userName = ''.obs;
  var aadharnum = ''.obs;
  var profiledata = ''.obs;

  final _api = ProfileRepository();

  @override
  void onInit() {
    refreshData();
    super.onInit();
    getprofileData();
  }

  Future<void> refreshData() async {
    await getprofileData();
  }

  Future<void> getprofileData() async {
    try {
      final value = await _api.getProfileUrl();
      log("value: $value");
      if (value['status'] == 200) {
        profiledata.value = value['result']['email'];
        name.value = value['result']['name'];
        dob.value = value['result']['dateofbirth'];
        mobileno.value = value['result']['mobileno'];
        email.value = value['result']['email'];
        userName.value = value['result']['username'];
        aadharnum.value = value['result']['aadharNo'];
        log("aadharnum ${aadharnum.value}");
      }
    } catch (error, stackTrace) {
      Utils.snackBar('Error', error.toString());
    }
  }
}
