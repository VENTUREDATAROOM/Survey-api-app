import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sabji/res/constants/app_constants.dart';
import 'package:sabji/res/routes/routes_name.dart';
import 'package:sabji/utils/shared_preference.dart';
import 'package:sabji/utils/utils.dart';
import '../../data/repository/crop_details_repository.dart';

class EditCropController extends GetxController {
  final _api = CropDetailsRepository();
  List<String> cropValidityList = <String>['1', '3', '6', '9', '12'];
  RxList<String> cropTimePeriodList = <String>[
    'jan'.tr,
    'feb'.tr,
    'mar'.tr,
    'apr'.tr,
    'may'.tr,
    'jun'.tr,
    'july'.tr,
    'aug'.tr,
    'sep'.tr,
    'oct'.tr,
    'nov'.tr,
    'dec'.tr
  ].obs;
  List<String> marketPresenceList = <String>[
    'shortage'.tr,
    'bulk'.tr,
    'demand'.tr,
    'avail'.tr
  ];
  List<String> radioList = <String>['yes'.tr, 'no'.tr];

  final cropNameController = TextEditingController().obs;
  final cropSourceController = TextEditingController().obs;
  final cropIdController = TextEditingController().obs;

  final selectedCropValidity = "".obs;
  final selectedFromTime = "".obs;
  final selectedToTime = "".obs;
  final selectMarketPresence = "".obs;
  final radioPresence = "".obs;

  RxBool loading = false.obs;

  void setColdStorageRequired(String? value) {
    radioPresence.value = value!;
    update();
  }

  void setCropValidity(String? newValue) {
    selectedCropValidity.value = newValue!;
    update();
  }

  void setFromSelected(String? newValue) {
    selectedFromTime.value = newValue!;
    update();
  }

  void setToSelected(String? newValue) {
    selectedToTime.value = newValue!;
    update();
  }

  void setMarketPresence(String? newValue) {
    selectMarketPresence.value = newValue!;
    update();
  }

  void editCropDeatilsApi() {
    loading.value = true;
    Map data = {
      "vegId": int.parse(cropIdController.value.text),
      'vegetableName': cropNameController.value.text.toString(),
      'timeperiod': "${selectedFromTime.value}-${selectedToTime.value}",
      'vegetableValidity': selectedCropValidity.value.toString(),
      'coldStorageRequirement': radioPresence.value.toString(),
      'kahaSetAtiHai': cropSourceController.value.text.toString(),
      'availability': selectMarketPresence.value.toString(),
      'userCode': PreferenceUtils.getString(AppConstants.userId)
    };

    _api.editCropDetailsApi(data).then((value) {
      loading.value = false;
      if (value[AppConstants.requestCustomCode] == "200") {
        resetForm();
        Get.toNamed(RouteName.homeView);
        Utils.snackBar('Crop Details', 'Crop Details updated successfully');
      } else {
        Utils.snackBar('Crop Details', 'Unable to updated crop details');
      }
    }).onError((error, stackTrace) {
      loading.value = false;
      Utils.snackBar('Error', error.toString());
    });
  }

  void resetForm() {
    cropNameController.value.text = '';
    selectedCropValidity.value = '';
    selectedFromTime.value = '';
    selectedToTime.value = '';
    cropSourceController.value.text = '';
    selectMarketPresence.value = '';
    cropIdController.value.text = "";
    update();
  }
}
