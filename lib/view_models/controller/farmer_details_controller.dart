import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sabji/data/repository/farmer_details_repository.dart';

import '../../res/constants/app_constants.dart';
import '../../res/routes/routes_name.dart';
import '../../utils/shared_preference.dart';
import '../../utils/utils.dart';

class FarmerDetailsController extends GetxController {
  final _api = FarmerDetailsRepository();
  List<String> farmerVisitList = <String>[
    "days".tr,
    "weeks".tr,
    "months".tr,
  ].obs;
  final selectPeriod = "".obs;

  void setperiodtrip(String? value) {
    selectPeriod.value = value!;
    update();
  }

  final farmerNameTextController = TextEditingController().obs;
  final phoneNumberTextController = TextEditingController().obs;
  final alternateNumberTextController = TextEditingController().obs;
  final areaTextController = TextEditingController().obs;
  final vagCarryingTextController = TextEditingController().obs;
  final vegQuantityTextController = TextEditingController().obs;
  final mandiDistanceTextController = TextEditingController().obs;
  final transportNameTextController = TextEditingController().obs;
  final farmerVisitingTextController = TextEditingController().obs;
  final sellingAreaTextController = TextEditingController().obs;
  final mandiNameTextController = TextEditingController().obs;
  final vagVarietyTextController = TextEditingController().obs;
  final commissionTextController = TextEditingController().obs;

  RxBool loading = false.obs;

  @override
  void onClose() {}

  void addFarmerDeatilsApi() {
    loading.value = true;
    Map data = {
      "farmerName": farmerNameTextController.value.text.toString(),
      "phoneNumber": phoneNumberTextController.value.text.toString(),
      "alternateNumber": alternateNumberTextController.value.text.toString(),
      "area": areaTextController.value.text.toString(),
      "vegCurntCarrying": vagCarryingTextController.value.text.toString(),
      "vegetableQuantity": vegQuantityTextController.value.text.toString(),
      "distanceFromMandi": mandiDistanceTextController.value.text.toString(),
      "transportName": transportNameTextController.value.text.toString(),
      "farmerVisitingCount": farmerVisitingTextController.value.text.toString(),
      "sellingArea": sellingAreaTextController.value.text.toString(),
      "nameOfMandi": mandiNameTextController.value.text.toString(),
      "varietyOfVegetables": vagVarietyTextController.value.text.toString(),
      "amountOfCommision": commissionTextController.value.text.toString(),
      "quest1": selectPeriod.value.toString(),
      "quest2": "string",
      "quest3": "string",
      "quest4": "string",
      "userCode": PreferenceUtils.getString(AppConstants.userId)
    };
    _api.addFarmerDetailsApi(data).then((value) {
      print(value);
      print("valuee");
      loading.value = false;
      if (value[AppConstants.requestCustomCode] == "200") {
        resetForm();
        Get.toNamed(RouteName.homeView);
        Utils.snackBar('Farmer Details', 'farmer details added successfully');
      } else {
        Utils.snackBar(
          'Farmer Details',
          'Unable to add farmer details',
        );
      }
    }).onError((error, stackTrace) {
      loading.value = false;
      Utils.snackBar('Error', error.toString());
    });
  }

  void resetForm() {
    farmerNameTextController.value.text = '';
    phoneNumberTextController.value.text = '';
    areaTextController.value.text = '';
    vagCarryingTextController.value.text = '';
    vegQuantityTextController.value.text = '';
    mandiDistanceTextController.value.text = '';
    transportNameTextController.value.text = '';
    farmerVisitingTextController.value.text = '';
    sellingAreaTextController.value.text = '';
    mandiNameTextController.value.text = '';
    vagVarietyTextController.value.text = '';
    commissionTextController.value.text = '';
    update();
  }
}
