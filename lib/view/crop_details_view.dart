import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sabji/res/components/text_form_feild.dart';
import 'package:sabji/utils/validator.dart';
import '../res/components/radio_button.dart';
import '../res/components/round_button.dart';
import '../view_models/controller/crop_details_controller.dart';
import 'custom_text.dart';

class CropDetailsView extends StatefulWidget {
  const CropDetailsView({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _CropDetailsView createState() => _CropDetailsView();
}

class _CropDetailsView extends State<CropDetailsView> {
  final cropDetailsController = Get.put(CropDetailsController());

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: Text("crop_details".tr),
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
                Obx(
                  () => SingleChildScrollView(
                      child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Row(
                          children: [
                            const SizedBox(
                              width: 5,
                            ),
                            IconButton(
                              onPressed: () {
                                cropDetailsController.pickMultiImage();
                              },
                              icon: const Icon(Icons.photo),
                              iconSize: 40,
                            ),
                            Text(
                              'add_photos'.tr,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      cropDetailsController.imageFiles.isEmpty
                          ? GridView.builder(
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 15,
                              ),
                              itemCount: 1,
                              primary: false,
                              shrinkWrap: true,
                              itemBuilder: (BuildContext context, int index) {
                                return Container(
                                  // height: 130,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                      border: Border.all(color: Colors.black),
                                      borderRadius: BorderRadius.circular(20)),
                                  child: Center(
                                    child: IconButton(
                                      onPressed: () => cropDetailsController
                                          .pickMultiImage(),
                                      icon: const Icon(
                                        Icons.add,
                                        color: Colors.grey,
                                        size: 15,
                                      ),
                                    ),
                                  ),

                                  //background color of inner container
                                );
                              },
                            )
                          : GridView.builder(
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                              ),
                              itemCount:
                                  cropDetailsController.imageFiles.length,
                              primary: false,
                              shrinkWrap: true,
                              itemBuilder: (BuildContext context, int index) {
                                final item =
                                    cropDetailsController.imageFiles[index];
                                return Stack(
                                  children: [
                                    Container(
                                      width: double.infinity,
                                      margin: const EdgeInsets.all(5),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          child: Image.memory(
                                              const Base64Decoder()
                                                  .convert(item))),
                                    ),
                                    Positioned(
                                      top: 0,
                                      right: 0,
                                      left: 0,
                                      bottom: 0,
                                      child: InkWell(
                                        onTap: () {
                                          //if you want to remove image
                                          cropDetailsController.imageFiles
                                              .removeAt(index);
                                        },
                                        child: Container(
                                          margin: const EdgeInsets.all(60),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(50),
                                            color:
                                                Colors.white.withOpacity(0.5),
                                          ),
                                          child: const Icon(
                                            Icons.delete,
                                            color: Colors.redAccent,
                                            size: 30,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                );
                              },
                            ),
                    ],
                  )),
                ),
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
                            cropDetailsController.addCropDeatilsApi();
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
