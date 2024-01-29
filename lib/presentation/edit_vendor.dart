import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sabji/presentation/controller/edit_vendor_controller.dart';
import 'package:sabji/res/components/text_form_feild.dart';
import 'package:sabji/utils/validator.dart';
import 'package:sabji/view/custom_text.dart';
import '../res/components/round_button.dart';

import '../view_models/controller/vendor_details_controller.dart';

class EditVendorDetailsView extends StatefulWidget {
  final Map<String, dynamic> args;
  const EditVendorDetailsView({super.key, required this.args});

  @override
  // ignore: library_private_types_in_public_api
  _EditVendorDetailsView createState() => _EditVendorDetailsView();
}

class _EditVendorDetailsView extends State<EditVendorDetailsView> {
  final vendorDetailsController = Get.put(EditVendorDetailsController());
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    final vendorId = widget.args['vendorId'];
    final vendorName = widget.args['vendorName'];
    final age = widget.args['age'];
    final vendorType = widget.args['vendorType'];
    final vendorNumber = widget.args['vendorNumber'];
    final alternateNumber = widget.args['alternateNumber'];
    final vendorAddress = widget.args['vendorAddress'];
    final shopAddress = widget.args['shopAddress'];
    final mandiPriority = widget.args['mandiPriority'];
    final mandiVisit = widget.args['mandiVisit'];
    final vegetableVariety = widget.args['vegetableVariety'];

    print(vendorId);
    if (vendorId != null) {
      vendorDetailsController.vendorIdController.value.text =
          vendorId.toString();
      print(vendorId);
    }
    if (vendorName != null) {
      vendorDetailsController.vendorNameTextController.value.text =
          vendorName.toString();
      print(vendorName);
    }
    if (age != null) {
      vendorDetailsController.selectAge.value = age.toString();
      print(age);
    }
    if (vendorType != null) {
      vendorDetailsController.selectType.value = vendorType.toString();
      print(vendorType);
    }
    if (vendorNumber != null) {
      vendorDetailsController.vendorNumberTextController.value.text =
          vendorNumber.toString();
      print(vendorNumber);
    }
    if (alternateNumber != null) {
      vendorDetailsController.vendorAlternateNumTextController.value.text =
          alternateNumber.toString();
      print(alternateNumber);
    }
    if (vendorAddress != null) {
      vendorDetailsController.vendorAddressTextController.value.text =
          vendorAddress.toString();
      print(vendorAddress);
    }
    if (shopAddress != null) {
      vendorDetailsController.shopAddressTextController.value.text =
          shopAddress.toString();
      print(shopAddress);
    }
    if (mandiPriority != null) {
      vendorDetailsController.mandiPriorityTextController.value.text =
          mandiPriority.toString();
      print(mandiPriority);
    }
    if (mandiVisit != null) {
      vendorDetailsController.mandiVisitTextController.value.text =
          mandiVisit.toString();
      print(mandiVisit);
    }
    if (vegetableVariety != null) {
      vendorDetailsController.vegetableVarietyTextController.value.text =
          vegetableVariety.toString();
      print(vegetableVariety);
    }
  }

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
                        title: 'Proceed',
                        loading: vendorDetailsController.loading.value,
                        onPress: () {
                          if (kDebugMode) {
                            print(_formKey.currentState!.validate());
                          }
                          if (_formKey.currentState!.validate()) {
                            vendorDetailsController.updateVendorDetailsApi();
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
