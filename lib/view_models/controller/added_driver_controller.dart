import 'package:get/get.dart';
import '../../data/repository/added_driver_repository.dart';
import '../../res/constants/app_constants.dart';


class AddedDriverController extends GetxController{
  final _api=AddedDriverRepository();
  RxList<dynamic> drivers =<dynamic>[].obs;
  RxBool isLoading=false.obs;
  @override
  void onInit() {
    getAddedDriverUrl();
  }
  void getAddedDriverUrl(){
    isLoading.value=true;
    _api.getAddedDriverUrl().then((value){
      isLoading.value=false;
      drivers.value=value[AppConstants.result];
      print(drivers.value.length);
      update();
    }).onError((error, stackTrace){
      isLoading.value=false;
      print(error);
    });
  }
}
