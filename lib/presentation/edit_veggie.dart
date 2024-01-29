import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sabji/presentation/controller/edit_veggie_controller.dart';
import 'package:sabji/res/components/text_form_feild.dart';
import 'package:sabji/utils/validator.dart';
import 'package:sabji/view/custom_text.dart';
import '../res/components/radio_button.dart';
import '../res/components/round_button.dart';
import '../view_models/controller/crop_details_controller.dart';

class EditVeggies extends StatefulWidget {
  final Map<String, dynamic> args;
  const EditVeggies({super.key, required this.args});

  @override
  State<EditVeggies> createState() => _EditVeggiesState();
}

class _EditVeggiesState extends State<EditVeggies> {
  final cropDetailsController = Get.put(EditCropController());
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    final initialCropId = widget.args['vegId'];
    final initialCropName = widget.args['vegetableName'];
    final initialLife = widget.args['vegetableValidity'];
    final timeperiodString = widget.args['timeperiod'];
    final seasons = timeperiodString.split("-");
    final initialseason1 = seasons[0];
    final initialseason2 = seasons[1];
    final initialsource = widget.args['kahaSetAtiHai'];
    final initialpresence = widget.args['availability'];
    final initialcold = widget.args['coldStorageRequirement'];
    print(initialCropName);
    if (initialCropId != null) {
      cropDetailsController.cropIdController.value.text =
          initialCropId.toString();
      print(initialCropId);
    }
    if (initialCropName != null) {
      cropDetailsController.cropNameController.value.text = initialCropName;
    }
    if (initialLife != null) {
      cropDetailsController.selectedCropValidity.value = initialLife;
    }
    if (initialseason1 != null) {
      cropDetailsController.selectedFromTime.value = initialseason1;
    }
    if (initialseason2 != null) {
      cropDetailsController.selectedToTime.value = initialseason2;
    }
    if (initialsource != null) {
      cropDetailsController.cropSourceController.value.text = initialsource;
    }
    if (initialpresence != null) {
      cropDetailsController.selectMarketPresence.value = initialpresence;
    }
    if (initialcold != null) {
      cropDetailsController.radioPresence.value = initialcold;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: Text("edit_crop_details".tr),
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
                    labelValue: 'crop_name'.tr,
                    hintValue: 'crop_name'.tr,
                    validator: (str) {
                      if (str!.isEmpty) {
                        return Validator.validateName(str ?? "");
                      }
                    },
                    controller: cropDetailsController.cropNameController.value,
                    keyboardType: TextInputType.text,
                    textStyle: Theme.of(context)
                        .textTheme
                        .labelMedium!
                        .copyWith(fontSize: 14.0),
                    validationErrorMsg: 'crop_name'.tr),
                const SizedBox(
                  height: 20,
                ),
                CustomText('life_of_vegetable'.tr, 16.0, FontWeight.normal),
                const SizedBox(
                  height: 10,
                ),
                Obx(() => DropdownButtonFormField(
                      hint: Text('select_validity'.tr),
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
                      value: cropDetailsController.selectedCropValidity.value ==
                              ""
                          ? null
                          : cropDetailsController.selectedCropValidity.value,
                      onChanged: (String? newValue) {
                        cropDetailsController.setCropValidity(newValue);
                      },
                      items: cropDetailsController.cropValidityList
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
                CustomText('vegetable_season'.tr, 16, FontWeight.normal),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(
                        child: Center(
                            child: Obx(() => DropdownButtonFormField(
                                  hint: Text('select_to'.tr),
                                  decoration: const InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.black, width: 1),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.black, width: 1),
                                    ),
                                    filled: true,
                                    fillColor: Colors.white,
                                  ),
                                  dropdownColor: Colors.white,
                                  value: cropDetailsController
                                              .selectedFromTime.value ==
                                          ""
                                      ? null
                                      : cropDetailsController
                                          .selectedFromTime.value,
                                  onChanged: (String? newValue) {
                                    cropDetailsController
                                        .setFromSelected(newValue);
                                  },
                                  items: cropDetailsController
                                      .cropTimePeriodList.value
                                      .map<DropdownMenuItem<String>>(
                                          (String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(
                                        value,
                                        style: const TextStyle(fontSize: 16),
                                      ),
                                    );
                                  }).toList(),
                                )))),
                    const VerticalDivider(width: 10),
                    Expanded(
                        child: Center(
                            child: Obx(() => DropdownButtonFormField(
                                  hint: Text('select_to'.tr),
                                  decoration: const InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.black, width: 1),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.black, width: 1),
                                    ),
                                    filled: true,
                                    fillColor: Colors.white,
                                  ),
                                  dropdownColor: Colors.white,
                                  value: cropDetailsController
                                              .selectedToTime.value ==
                                          ""
                                      ? null
                                      : cropDetailsController
                                          .selectedToTime.value,
                                  onChanged: (String? newValue) {
                                    cropDetailsController
                                        .setToSelected(newValue);
                                  },
                                  items: cropDetailsController
                                      .cropTimePeriodList.value
                                      .map<DropdownMenuItem<String>>(
                                          (String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(
                                        value,
                                        style: const TextStyle(fontSize: 16),
                                      ),
                                    );
                                  }).toList(),
                                )))),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                const SizedBox(
                  height: 10,
                ),
                EditTextUtils().getCustomEditTextArea(
                    obscureText: false,
                    labelValue: 'crop_source'.tr,
                    hintValue: 'crop_source'.tr,
                    validator: (str) {
                      if (str!.isEmpty) {
                        return Validator.validateText(str ?? "");
                      }
                    },
                    controller:
                        cropDetailsController.cropSourceController.value,
                    keyboardType: TextInputType.text,
                    textStyle: Theme.of(context)
                        .textTheme
                        .labelMedium!
                        .copyWith(fontSize: 14.0),
                    validationErrorMsg: 'crop_source'.tr),
                const SizedBox(
                  height: 20,
                ),
                CustomText('presence_in_market'.tr, 16, FontWeight.normal),
                const SizedBox(
                  height: 20,
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
                      value: cropDetailsController.selectMarketPresence.value ==
                              ""
                          ? null
                          : cropDetailsController.selectMarketPresence.value,
                      onChanged: (String? newValue) {
                        cropDetailsController.setMarketPresence(newValue);
                      },
                      items: cropDetailsController.marketPresenceList
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
                CustomText('cold_storage_required'.tr, 16, FontWeight.normal),
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
                      value: cropDetailsController.radioPresence.value == ""
                          ? null
                          : cropDetailsController.radioPresence.value,
                      onChanged: (String? newValue) {
                        cropDetailsController.setColdStorageRequired(newValue);
                      },
                      items: cropDetailsController.radioList
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
                Obx(() => Center(
                      child: RoundButtonWidget(
                        title: 'Submit',
                        loading: cropDetailsController.loading.value,
                        onPress: () {
                          if (kDebugMode) {
                            print(_formKey.currentState!.validate());
                          }
                          if (_formKey.currentState!.validate()) {
                            cropDetailsController.editCropDeatilsApi();
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
