import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sabji/data/repository/driver_details_repository.dart';

import '../../res/constants/app_constants.dart';
import '../../res/routes/routes_name.dart';
import '../../utils/shared_preference.dart';
import '../../utils/utils.dart';

class DriverDetailsController extends GetxController {
  final _api = DriverDetailsRepository();
  List<String> roundTripList = <String>[
    "days".tr,
    "weeks".tr,
    "months".tr,
  ].obs;
  final selectTrip = "".obs;

  void setroundtrip(String? value) {
    selectTrip.value = value!;
    update();
  }

  final driverNameTextController = TextEditingController().obs;
  final driverIdTextController = TextEditingController().obs;
  final vehicleNameTextController = TextEditingController().obs;
  final qtyVegTextController = TextEditingController().obs;
  final roundTripTextController = TextEditingController().obs;
  final driverAreaTextController = TextEditingController().obs;
  final vehicleOwnerTextController = TextEditingController().obs;
  final driverContactTextController = TextEditingController().obs;
  final driverAlternateNumTextController = TextEditingController().obs;

  RxBool loading = false.obs;

  void addDriverDeatilsApi() {
    loading.value = true;
    Map data = {
      "driverName": driverNameTextController.value.text.toString(),
      "dvechileName": vehicleNameTextController.value.text.toString(),
      "quantityOfVegetables": qtyVegTextController.value.text.toString(),
      "roundCount": roundTripTextController.value.text.toString(),
      "timesOfRaotation": selectTrip.value.toString(),
      "driverArea": driverAreaTextController.value.text.toString(),
      "vechileOwnerName": vehicleOwnerTextController.value.text.toString(),
      "driverNumber": driverContactTextController.value.text.toString(),
      "alternateNumber": driverAlternateNumTextController.value.text.toString(),
      "userCode": PreferenceUtils.getString(AppConstants.userId)
    };
    _api.addDriverDetailsApi(data).then((value) {
      loading.value = false;
      print("Value of driver: $value");
      if (value[AppConstants.requestCustomCode] == "200") {
        resetForm();
        print("qqqqqqqqqqqqqq");
        Get.toNamed(RouteName.homeView);
        Utils.snackBar('Driver Details', 'Driver Details added successfully');
      } else {
        Utils.snackBar('Driver Details', 'Unable to add driver details');
      }
    }).onError((error, stackTrace) {
      loading.value = false;
      Utils.snackBar('Error', error.toString());
    });
  }

  void updateDriverDeatilsApi() {
    loading.value = true;
    Map data = {
      "driverId": int.parse(driverIdTextController.value.text),
      "driverName": driverNameTextController.value.text.toString(),
      "dVechileName": vehicleNameTextController.value.text.toString(),
      "quantityOfVegetables": qtyVegTextController.value.text.toString(),
      "roundCount": roundTripTextController.value.text.toString(),
      "driverArea": driverAreaTextController.value.text.toString(),
      "vechileOwnerName": vehicleOwnerTextController.value.text.toString(),
      "driverNumber": driverContactTextController.value.text.toString(),
      "alternateNumber": driverAlternateNumTextController.value.text.toString(),
      "userCode": PreferenceUtils.getString(AppConstants.userId)
    };
    _api.updateDriverDetailsApi(data).then((value) {
      loading.value = false;
      if (value[AppConstants.requestCustomCode] == "200") {
        resetForm();
        print("qqqqqqqqqqqqqq");
        Get.toNamed(RouteName.homeView);
        Utils.snackBar('Driver Details', 'Driver Details added successfully');
      } else {
        Utils.snackBar('Driver Details', 'Unable to add driver details');
      }
    }).onError((error, stackTrace) {
      loading.value = false;
      Utils.snackBar('Error', error.toString());
    });
  }

  void resetForm() {
    driverNameTextController.value.text = '';
    vehicleNameTextController.value.text = '';
    qtyVegTextController.value.text = '';
    roundTripTextController.value.text = '';
    driverAreaTextController.value.text = '';
    vehicleOwnerTextController.value.text = '';
    driverContactTextController.value.text = '';
    driverAlternateNumTextController.value.text = '';
    update();
  }
}
