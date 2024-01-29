import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sabji/res/components/text_form_feild.dart';
import 'package:sabji/utils/validator.dart';
import 'package:sabji/view_models/controller/farmer_details_controller.dart';
import '../res/components/round_button.dart';

import '../view_models/controller/vendor_details_controller.dart';
import 'custom_text.dart';

class VendorDetailsView extends StatefulWidget {
  const VendorDetailsView({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _VendorDetailsView createState() => _VendorDetailsView();
}

class _VendorDetailsView extends State<VendorDetailsView> {
  final vendorDetailsController = Get.put(VendorDetailsController());
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: Text("vendor_details".tr),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                EditTextUtils().getCustomEditTextArea(
                    obscureText: false,
                    labelValue: 'vendor_name'.tr,
                    hintValue: 'vendor_name'.tr,
                    validator: (str) {
                      if (str!.isEmpty) {
                        return Validator.validateName(str ?? "");
                      }
                    },
                    controller:
                        vendorDetailsController.vendorNameTextController.value,
                    keyboardType: TextInputType.text,
                    textStyle: Theme.of(context)
                        .textTheme
                        .labelMedium!
                        .copyWith(fontSize: 14.0),
                    validationErrorMsg: 'vendor_name'.tr),
                const SizedBox(
                  height: 20,
                ),
                CustomText('vendor_age'.tr, 16, FontWeight.bold),
                const SizedBox(
                  height: 10,
                ),
                Obx(() => DropdownButtonFormField(
                      hint: Text('select_age'.tr),
                      decoration: const InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black, width: 1),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black, width: 1),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                      ),
                      dropdownColor: Colors.white,
                      value: vendorDetailsController.selectAge.value == ""
                          ? null
                          : vendorDetailsController.selectAge.value,
                      onChanged: (String? newValue) {
                        vendorDetailsController.setage(newValue);
                      },
                      items: vendorDetailsController.vendorAgeList
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(
                            value,
                            style: const TextStyle(fontSize: 16),
                          ),
                        );
                      }).toList(),
                    )),
                const SizedBox(
                  height: 20,
                ),
                CustomText('vendor_type'.tr, 16, FontWeight.bold),
                const SizedBox(
                  height: 10,
                ),
                Obx(() => DropdownButtonFormField(
                      hint: Text('select_options'.tr),
                      decoration: const InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black, width: 1),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black, width: 1),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                      ),
                      dropdownColor: Colors.white,
                      value: vendorDetailsController.selectType.value == ""
                          ? null
                          : vendorDetailsController.selectType.value,
                      onChanged: (String? newValue) {
                        vendorDetailsController.setselecttype(newValue);
                      },
                      items: vendorDetailsController.vendorTypeList
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(
                            value,
                            style: const TextStyle(fontSize: 16),
                          ),
                        );
                      }).toList(),
                    )),
                const SizedBox(
                  height: 20,
                ),
                EditTextUtils().getCustomEditTextArea(
                    obscureText: false,
                    labelValue: 'vendor_number'.tr,
                    hintValue: 'vendor_number'.tr,
                    validator: (str) =>
                        Validator.validatePhoneNumber(str ?? ""),
                    controller: vendorDetailsController
                        .vendorNumberTextController.value,
                    keyboardType: TextInputType.number,
                    textStyle: Theme.of(context)
                        .textTheme
                        .labelMedium!
                        .copyWith(fontSize: 14.0),
                    validationErrorMsg: 'vendor_number'.tr),
                const SizedBox(
                  height: 20,
                ),
                EditTextUtils().getCustomEditTextArea(
                    obscureText: false,
                    labelValue: 'vendor_alternate_number'.tr,
                    hintValue: 'vendor_alternate_number'.tr,
                    validator: (str) =>
                        Validator.validatePhoneNumber(str ?? ""),
                    controller: vendorDetailsController
                        .vendorAlternateNumTextController.value,
                    keyboardType: TextInputType.number,
                    textStyle: Theme.of(context)
                        .textTheme
                        .labelMedium!
                        .copyWith(fontSize: 14.0),
                    validationErrorMsg: 'vendor_alternate_number'.tr),
                const SizedBox(
                  height: 20,
                ),
                EditTextUtils().getCustomEditTextArea(
                    obscureText: false,
                    labelValue: 'vendor_address'.tr,
                    hintValue: 'vendor_address'.tr,
                    validator: (str) {
                      if (str!.isNotEmpty) {
                        return Validator.validateAddress(str ?? "");
                      } else {
                        return "Address Cannot be Empty";
                      }
                    },
                    controller: vendorDetailsController
                        .vendorAddressTextController.value,
                    keyboardType: TextInputType.emailAddress,
                    textStyle: Theme.of(context)
                        .textTheme
                        .labelMedium!
                        .copyWith(fontSize: 14.0),
                    validationErrorMsg: 'vendor_address'.tr),
                const SizedBox(
                  height: 20,
                ),
                EditTextUtils().getCustomEditTextArea(
                    obscureText: false,
                    labelValue: 'shop_address'.tr,
                    hintValue: 'shop_address'.tr,
                    validator: (str) {
                      if (str!.isNotEmpty) {
                        return Validator.validateAddress(str ?? "");
                      } else {
                        return "Shop Address Cannot be Empty";
                      }
                    },
                    controller:
                        vendorDetailsController.shopAddressTextController.value,
                    keyboardType: TextInputType.emailAddress,
                    textStyle: Theme.of(context)
                        .textTheme
                        .labelMedium!
                        .copyWith(fontSize: 14.0),
                    validationErrorMsg: 'shop_address'.tr),
                const SizedBox(
                  height: 20,
                ),
                EditTextUtils().getCustomEditTextArea(
                    obscureText: false,
                    labelValue: 'mandi_priority'.tr,
                    hintValue: 'mandi_priority'.tr,
                    validator: (str) {
                      if (str!.isNotEmpty) {
                        return Validator.validateAddress(str ?? "");
                      } else {
                        return "Priority Cannot be Empty";
                      }
                    },
                    controller: vendorDetailsController
                        .mandiPriorityTextController.value,
                    keyboardType: TextInputType.emailAddress,
                    textStyle: Theme.of(context)
                        .textTheme
                        .labelMedium!
                        .copyWith(fontSize: 14.0),
                    validationErrorMsg: 'mandi_priority'.tr),
                const SizedBox(
                  height: 20,
                ),
                const SizedBox(
                  height: 20,
                ),
                EditTextUtils().getCustomEditTextArea(
                    obscureText: false,
                    labelValue: 'mandi_visit'.tr,
                    hintValue: 'mandi_visit'.tr,
                    validator: (str) {
                      if (str!.isNotEmpty) {
                        return Validator.validateAmountNumber(str ?? "");
                      } else {
                        return "Visit Cannot be Empty";
                      }
                    },
                    controller:
                        vendorDetailsController.mandiVisitTextController.value,
                    keyboardType: TextInputType.emailAddress,
                    textStyle: Theme.of(context)
                        .textTheme
                        .labelMedium!
                        .copyWith(fontSize: 14.0),
                    validationErrorMsg: 'mandi_visit'.tr),
                const SizedBox(
                  height: 20,
                ),
                const SizedBox(
                  height: 20,
                ),
                EditTextUtils().getCustomEditTextArea(
                    obscureText: false,
                    labelValue: 'vegetable_variety'.tr,
                    hintValue: 'vegetable_variety'.tr,
                    validator: (str) {
                      if (str!.isEmpty) {
                        return Validator.validateText(str ?? "");
                      }
                    },
                    controller: vendorDetailsController
                        .vegetableVarietyTextController.value,
                    keyboardType: TextInputType.text,
                    textStyle: Theme.of(context)
                        .textTheme
                        .labelMedium!
                        .copyWith(fontSize: 14.0),
                    validationErrorMsg: 'vegetable_variety'.tr),
                const SizedBox(
                  height: 20,
                ),
                const SizedBox(
                  height: 20,
                ),
                Obx(() => Center(
                      child: RoundButtonWidget(
                        title: 'Submit',
                        loading: vendorDetailsController.loading.value,
                        onPress: () {
                          if (kDebugMode) {
                            print(_formKey.currentState!.validate());
                          }
                          if (_formKey.currentState!.validate()) {
                            vendorDetailsController.addVendorDetailsApi();
                          }
                        },
                        height: 50,
                        width: 200,
                      ),
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
