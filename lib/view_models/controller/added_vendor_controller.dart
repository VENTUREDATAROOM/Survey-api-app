import 'package:get/get.dart';
import 'package:sabji/data/repository/added_vegetable_repository.dart';
import '../../data/repository/added_driver_repository.dart';
import '../../data/repository/added_vendor_repository.dart';
import '../../res/constants/app_constants.dart';


class AddedVendorController extends GetxController{
  final _api=AddedVendorRepository();
  RxList<dynamic> vendors =<dynamic>[].obs;
  RxBool isLoading=false.obs;
  @override
  void onInit() {
    getAddedVendorUrl();
  }
  void getAddedVendorUrl(){
    isLoading.value=true;
    _api.getAddedVendorUrl().then((value){
      isLoading.value=false;
      vendors.value=value[AppConstants.result];
      print(vendors.value.length);
      print("hello");
      update();
    }).onError((error, stackTrace){
      isLoading.value=false;
      print(error);
    });
  }
}

