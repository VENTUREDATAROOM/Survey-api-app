import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sabji/data/repository/farmer_details_repository.dart';

import '../../data/repository/vendor_details_repository.dart';
import '../../res/constants/app_constants.dart';
import '../../res/routes/routes_name.dart';
import '../../utils/shared_preference.dart';
import '../../utils/utils.dart';

class EditVendorDetailsController extends GetxController {
  final _api = VendorDetailsRepository();
  final vendorIdController = TextEditingController().obs;
  List<String> vendorTypeList = <String>[
    "wholesaler".tr,
    "retailer".tr,
    "seller".tr,
  ].obs;
  final selectType = "".obs;
  void setselecttype(String? value) {
    selectType.value = value!;
    update();
  }

  List<String> vendorAgeList = <String>[
    '18-25 ',
    '26-35 ',
    '36-45',
    "46-55",
    "56-65",
    "66-75",
    "76-85"
  ].obs;
  final selectAge = "".obs;
  void setage(String? value) {
    selectAge.value = value!;
    update();
  }

  List<String> vendorVisitList = <String>[
    "days".tr,
    "weeks".tr,
    "months".tr,
  ].obs;
  final selectVisit = "".obs;
  void setroundtrip(String? value) {
    selectVisit.value = value!;
    update();
  }

  final vendorNameTextController = TextEditingController().obs;
  final vendorTypeTextController = TextEditingController().obs;
  final vendorNumberTextController = TextEditingController().obs;
  final vendorAddressTextController = TextEditingController().obs;
  final shopAddressTextController = TextEditingController().obs;
  final mandiPriorityTextController = TextEditingController().obs;
  final mandiVisitTextController = TextEditingController().obs;
  final vegetableVarietyTextController = TextEditingController().obs;
  final vendorAlternateNumTextController = TextEditingController().obs;

  RxBool loading = false.obs;
  final selectVendorType = "".obs;
  final selectVendorAge = "".obs;

  void updateVendorDetailsApi() {
    loading.value = true;
    Map data = {
      "vendorId": int.parse(vendorIdController.value.text),
      "vendorName": vendorNameTextController.value.text.toString(),
      "vendorType": selectType.value.toString(),
      "vendorNumber": vendorNumberTextController.value.text.toString(),
      "alternateNumber": vendorAlternateNumTextController.value.text.toString(),
      "age": selectAge.value.toString(),
      "vendorAddress": vendorAddressTextController.value.text.toString(),
      "shopAddress": shopAddressTextController.value.text.toString(),
      "mandiPriority": mandiPriorityTextController.value.text.toString(),
      "mandiVisit": mandiVisitTextController.value.text.toString(),
      "vegetableVariety": vegetableVarietyTextController.value.text.toString(),
      "userCode": PreferenceUtils.getString(AppConstants.userId)
    };
    _api.updateVendorDetailsApi(data).then((value) {
      print(value);
      print("valuee");
      loading.value = false;
      if (value[AppConstants.requestCustomCode] == "200") {
        resetForm();
        Get.toNamed(RouteName.homeView);
        Utils.snackBar('Vendor Details', 'Vendor details updated successfully');
      } else {
        Utils.snackBar(
          'Vendor Details',
          'Unable to update vendor details',
        );
      }
    }).onError((error, stackTrace) {
      loading.value = false;
      Utils.snackBar('Error', error.toString());
    });
  }

  void resetForm() {
    vendorNameTextController.value.text = '';
    vendorTypeTextController.value.text = '';
    vendorNumberTextController.value.text = '';
    vendorAddressTextController.value.text = '';
    shopAddressTextController.value.text = '';
    mandiPriorityTextController.value.text = '';
    mandiVisitTextController.value.text = '';
    vegetableVarietyTextController.value.text = '';
    vendorAlternateNumTextController.value.text = '';
    update();
  }
}
