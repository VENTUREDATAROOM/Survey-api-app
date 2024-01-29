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

class CropDetailsController extends GetxController {
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
  // var marketPresenceListHindi = <String>['कमी', 'बल्क उपलब्ध', 'आवश्यकता के हिसाब से', 'उपलब्ध नहीं है'];
  // List<String> marketPresenceList() {
  //    return Get.locale?.languageCode == 'hi' ? marketPresenceListHindi : marketPresenceListEnglish;
  //  }

  final cropNameController = TextEditingController().obs;
  final cropSourceController = TextEditingController().obs;

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

  final ImagePicker imagePicker = ImagePicker();
  final pickedImage = Rx<File?>(null);
  final imageFiles = RxList<String>([]);

  Future<void> pickMultiImage() async {
    try {
      var pickedFile = await imagePicker.pickImage(
        source: ImageSource.camera,
        maxHeight: 150,
        imageQuality: 90,
      );
      //you can use ImageCourse.camera for Camera capture
      if (pickedFile != null) {
        pickedImage.value = File(pickedFile.path);

        final bytes = await pickedFile.readAsBytes();

        final b64img = base64.encode(bytes);
        imageFiles.add(b64img);
      }
    } catch (e) {
      if (kDebugMode) {
        print('error while picking file.');
      }
    }
  }

  void addCropDeatilsApi() {
    print("IMAGES ARRAYS " + imageFiles.length.toString());
    loading.value = true;
    Map data = {
      'vegetableName': cropNameController.value.text.toString(),
      'timeperiod': "${selectedFromTime.value}-${selectedToTime.value}",
      'vegetableValidity': selectedCropValidity.value.toString(),
      'coldStorageRequirement': radioPresence.value.toString(),
      'kahaSetAtiHai': cropSourceController.value.text.toString(),
      'availability': selectMarketPresence.value.toString(),
      'pic': imageFiles,
      'userCode': PreferenceUtils.getString(AppConstants.userId)
    };

    _api.addCropDetailsApi(data).then((value) {
      loading.value = false;
      if (value[AppConstants.requestCustomCode] == "200") {
        resetForm();
        Get.toNamed(RouteName.homeView);
        Utils.snackBar('Crop Details', 'Crop Details added successfully');
      } else {
        Utils.snackBar('Crop Details', 'Unable to add crop details');
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
    imageFiles.value = [];
    update();
  }
}


//
// import 'dart:convert';
// import 'dart:io';
//
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:sabji/res/constants/app_constants.dart';
// import 'package:sabji/res/routes/routes_name.dart';
// import 'package:sabji/utils/shared_preference.dart';
// import 'package:sabji/utils/utils.dart';
//
// import '../../data/repository/crop_details_repository.dart';
//
// class CropDetailsController extends GetxController {
//   final _api = CropDetailsRepository();
//
//   var cropValidityList = <String>['1', '3', '6', '9', '12'];
//   var cropTimePeriodListEnglish = <String>['jan', 'feb', 'mar', 'apr', 'may', 'jun', 'july', 'aug', 'sep', 'oct', 'nov', 'dec'];
//   var cropTimePeriodListHindi = <String>['जनवरी', 'फ़रवरी', 'मार्च', 'अप्रैल', 'मई', 'जून', 'जुलाई', 'अगस्त', 'सितंबर', 'अक्टूबर', 'नवंबर', 'दिसंबर'];
//   var marketPresenceListEnglish = <String>['Shortage', 'Bulk Available', 'On Demand', 'Not Available'];
//   var marketPresenceListHindi = <String>['कमी', 'थोक उपलब्ध', 'आवश्यकता के अनुसार', 'उपलब्ध नहीं'];
//
//   final cropNameController = TextEditingController().obs;
//   final cropSourceController = TextEditingController().obs;
//
//   final selectedCropValidity = "".obs;
//   final selectedFromTime = "".obs;
//   final selectedToTime = "".obs;
//   final selectMarketPresence = "".obs;
//
//   RxBool loading = false.obs;
//   String _coldStorage = 'No';
//   String get coldStorage => _coldStorage;
//
//   void setColdStorage(String value) {
//     _coldStorage = value;
//     if (kDebugMode) {
//       print(_coldStorage);
//     }
//     update();
//   }
//
//   void setCropValidity(String? newValue) {
//     selectedCropValidity.value = newValue!;
//     update();
//   }
//
//   void setFromSelected(String? newValue) {
//     selectedFromTime.value = newValue!;
//     update();
//   }
//
//   void setToSelected(String? newValue) {
//     selectedToTime.value = newValue!;
//     update();
//   }
//
//   void setMarketPresence(String? newValue) {
//     selectMarketPresence.value = newValue!;
//     update();
//   }
//
//   final ImagePicker imagePicker = ImagePicker();
//   final pickedImage = Rx<File?>(null);
//   final imageFiles = RxList<String>([]);
//
//   Future<void> pickMultiImage() async {
//     try {
//       var pickedFile = await imagePicker.pickImage(
//         source: ImageSource.camera,
//         maxHeight: 150,
//         imageQuality: 90,
//       );
//
//       if (pickedFile != null) {
//         pickedImage.value = File(pickedFile.path);
//
//         final bytes = await pickedFile.readAsBytes();
//
//         final b64img = base64.encode(bytes);
//         imageFiles.add(b64img);
//       }
//     } catch (e) {
//       if (kDebugMode) {
//         print('error while picking file.');
//       }
//     }
//   }
//
//   void addCropDeatilsApi() {
//     print("IMAGES ARRAYS " + imageFiles.length.toString());
//     loading.value = true;
//     Map data = {
//       'vegetableName': cropNameController.value.text.toString(),
//       'timeperiod': "${selectedFromTime.value}-${selectedToTime.value}",
//       'vegetableValidity': selectedCropValidity.value.toString(),
//       'coldStorageRequirement': _coldStorage.toString(),
//       'kahaSetAtiHai': cropSourceController.value.text.toString(),
//       'availability': selectMarketPresence.value.toString(),
//       'pic': imageFiles,
//       'userCode': PreferenceUtils.getString(AppConstants.userId),
//     };
//
//     _api.addCropDetailsApi(data).then((value) {
//       loading.value = false;
//       if (value[AppConstants.requestCustomCode] == "200") {
//         resetForm();
//         Get.toNamed(RouteName.homeView);
//         Utils.snackBar('Crop Details', 'Crop Details added successfully');
//       } else {
//         Utils.snackBar('Crop Details', 'Unable to add crop details');
//       }
//     }).onError((error, stackTrace) {
//       loading.value = false;
//       Utils.snackBar('Error', error.toString());
//     });
//   }
//
//   void resetForm() {
//     cropNameController.value.text = '';
//     selectedCropValidity.value = '';
//     selectedFromTime.value = '';
//     selectedToTime.value = '';
//     cropSourceController.value.text = '';
//     selectMarketPresence.value = '';
//     imageFiles.value = [];
//     update();
//   }
//
//   List<String> getCropTimePeriodList() {
//     return Get.locale?.languageCode == 'hi' ? cropTimePeriodListHindi : cropTimePeriodListEnglish;
//   }
//
//   List<String> getMarketPresenceList() {
//     return Get.locale?.languageCode == 'hi' ? marketPresenceListHindi : marketPresenceListEnglish;
//   }
// }
