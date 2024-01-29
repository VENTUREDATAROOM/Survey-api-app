import 'package:get/get.dart';
import 'package:sabji/data/repository/added_vegetable_repository.dart';
import '../../data/repository/added_driver_repository.dart';
import '../../res/constants/app_constants.dart';

class AddedVegetableController extends GetxController {
  final _api = AddedVegetableRepository();
  RxList<dynamic> vegetables = <dynamic>[].obs;
  RxBool isLoading = false.obs;
  @override
  void onInit() {
    super.onInit();
    getAddedVegetableUrl();
  }

  void getAddedVegetableUrl() {
    isLoading.value = true;
    _api.getAddedVegetableUrl().then((value) {
      isLoading.value = false;
      vegetables.value = value[AppConstants.result];
      print(vegetables.value.length);
      print("hello");
      update();
    }).onError((error, stackTrace) {
      isLoading.value = false;
      print(error);
    });
  }
}
