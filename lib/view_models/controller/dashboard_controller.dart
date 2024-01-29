import 'package:get/get.dart';

import '../../data/repository/dashboard_repository.dart';
import '../../res/constants/app_constants.dart';
import '../../utils/utils.dart';

class DashboardController extends GetxController {
  var cropCount = 0.obs;
  var farmerCount = 0.obs;
  var driverCount = 0.obs;
  var vendorCount = 0.obs;
  final _api = DashboardDetailsRepository();

  @override
  void onInit() {
    refreshData();
    super.onInit();
  }

  Future<void> refreshData() async {
    await getCropDetailsCount();
    await getDriverDetailsCount();
    await getFarmerDetailsCount();
    await getVendorDetailsCount();
  }

  Future<void> getCropDetailsCount() async {
    try {
      final value = await _api.getCropRecordsCountApi();
      if (value[AppConstants.requestCustomCode] == "200") {
        cropCount.value = value[AppConstants.result];
        print('Crop count updated: $cropCount');
      }
    } catch (error, stackTrace) {
      Utils.snackBar('Error', error.toString());
    }
  }

  Future<void> getDriverDetailsCount() async {
    try {
      final value = await _api.getDriverRecordsCountApi();
      if (value[AppConstants.requestCustomCode] == "200") {
        driverCount.value = value[AppConstants.result];
        print('Driver count updated: $driverCount');
      }
    } catch (error, stackTrace) {
      Utils.snackBar('Error', error.toString());
    }
  }

  Future<void> getFarmerDetailsCount() async {
    try {
      final value = await _api.getFarmerRecordsCountApi();
      if (value[AppConstants.requestCustomCode] == "200") {
        farmerCount.value = value[AppConstants.result];
        print('Farmer count updated: $farmerCount');
      }
    } catch (error, stackTrace) {
      Utils.snackBar('Error', error.toString());
    }
  }

  Future<void> getVendorDetailsCount() async {
    try {
      final value = await _api.getVendorRecordsCountApi();
      if (value[AppConstants.requestCustomCode] == "200") {
        vendorCount.value = value[AppConstants.result];
        print('Vendor count updated: $vendorCount');
      }
    } catch (error, stackTrace) {
      Utils.snackBar('Error', error.toString());
    }
  }
}
