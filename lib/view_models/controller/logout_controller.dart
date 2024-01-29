import 'package:get/get.dart';
import 'package:sabji/data/repository/profile_repository.dart';
import 'package:sabji/res/routes/routes_name.dart';

import '../../utils/utils.dart';

class LogoutController extends GetxController {
  var message = ''.obs;

  final _api = ProfileRepository();

  RxBool loading = false.obs;
  void getlogout() {
    loading.value = true;

    _api.getLogoutUrl().then((value) {
      loading.value = false;
      print("qqqqqqqqqqqqqq");
      Get.toNamed(RouteName.loginView);
      Utils.snackBar('Logout', 'Logout successfully');
    }).onError((error, stackTrace) {
      loading.value = false;
      Utils.snackBar('Error', error.toString());
    });
  }
}
