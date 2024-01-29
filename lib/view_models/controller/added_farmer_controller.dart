// import 'dart:convert';
//
// import 'package:get/get.dart';
// import 'package:sabji/data/repository/added_farmers_repository.dart';
// import 'package:sabji/models/addedformermodel.dart';
//
// import '../../res/constants/app_constants.dart';
// import '../../utils/utils.dart';
//
// class AddedFarmerController extends GetxController {
//   final _api = AddedFarmersRepository();
//
//   Future<List<Result>> getAddedFarmers() async {
//     final response = await _api.getAllAddedFarmerRecordsApi();
//     print(response);
//     if (response.statusCode == 200) {
//       final List result = json.decode(response.body);
//       return result.map((e) => Result.fromJson(e)).toList();
//     } else {
//       throw Exception('Failed to load data');
//     }
//   }
// }

import 'package:get/get.dart';
import 'package:sabji/data/repository/added_farmers_repository.dart';
import '../../res/constants/app_constants.dart';

class AddedFarmerController extends GetxController {
  final _api = AddedFarmersRepository();
  RxList<dynamic> farmers = <dynamic>[].obs;
  RxBool isLoading = false.obs;
  @override
  void onInit() {
    super.onInit();
    getAddedFarmerURL();
  }

  void getAddedFarmerURL() {
    isLoading.value = true;
    _api.getAddedFarmersURL().then((value) {
      isLoading.value = false;
      farmers.value = value[AppConstants.result];

      print("this is farmers ${farmers.value}");
      print("hello");
      update();
    }).onError((error, stackTrace) {
      isLoading.value = false;
      print(error);
    });
  }
}
