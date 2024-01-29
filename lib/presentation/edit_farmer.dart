import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sabji/presentation/controller/edit_farmer_controller.dart';
import 'package:sabji/res/components/text_form_feild.dart';
import 'package:sabji/utils/validator.dart';
import '../res/components/round_button.dart';

class EditFarmerDetailsView extends StatefulWidget {
  final Map<String, dynamic> args;
  const EditFarmerDetailsView({super.key, required this.args});

  @override
  // ignore: library_private_types_in_public_api
  _EditFarmerDetailsView createState() => _EditFarmerDetailsView();
}

class _EditFarmerDetailsView extends State<EditFarmerDetailsView> {
  final farmerDetailsController = Get.put(EditFarmerDetailsController());
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    final farmerId = widget.args['farmerId'];
    final farmerName = widget.args['farmerName'];
    final phoneNumber = widget.args['phoneNumber'];
    final alternateNumber = widget.args['alternateNumber'];
    final area = widget.args['area'];
    final vegCurntCarrying = widget.args['vegCurntCarrying'];
    final vegetableQuantity = widget.args['vegetableQuantity'];
    final distanceFromMandi = widget.args['distanceFromMandi'];
    final transportName = widget.args['transportName'];
    final farmerVisitingCount = widget.args['farmerVisitingCount'];
    final sellingArea = widget.args['sellingArea'];
    final nameOfMandi = widget.args['nameOfMandi'];
    final varietyOfVegetables = widget.args['varietyOfVegetables'];
    final amountOfCommision = widget.args['amountOfCommision'];
    final quest1 = widget.args['quest1'];
    print(farmerId);
    if (farmerId != null) {
      farmerDetailsController.farmerIdTextController.value.text =
          farmerId.toString();
      print(farmerId);
    }
    if (farmerName != null) {
      farmerDetailsController.farmerNameTextController.value.text =
          farmerName.toString();
      print(farmerName);
    }
    if (phoneNumber != null) {
      farmerDetailsController.phoneNumberTextController.value.text =
          phoneNumber.toString();
      print(phoneNumber);
    }
    if (alternateNumber != null) {
      farmerDetailsController.alternateNumberTextController.value.text =
          alternateNumber.toString();
      print(alternateNumber);
    }
    if (area != null) {
      farmerDetailsController.areaTextController.value.text = area.toString();
      print(area);
    }
    if (vegCurntCarrying != null) {
      farmerDetailsController.vagCarryingTextController.value.text =
          vegCurntCarrying.toString();
      print(vegCurntCarrying);
    }
    if (vegetableQuantity != null) {
      farmerDetailsController.vegQuantityTextController.value.text =
          vegetableQuantity.toString();
      print(vegetableQuantity);
    }
    if (distanceFromMandi != null) {
      farmerDetailsController.mandiDistanceTextController.value.text =
          distanceFromMandi.toString();
      print(distanceFromMandi);
    }
    if (transportName != null) {
      farmerDetailsController.transportNameTextController.value.text =
          transportName.toString();
      print(transportName);
    }
    if (farmerVisitingCount != null) {
      farmerDetailsController.farmerVisitingTextController.value.text =
          farmerVisitingCount.toString();
      print(farmerVisitingCount);
    }
    if (sellingArea != null) {
      farmerDetailsController.sellingAreaTextController.value.text =
          sellingArea.toString();
      print(sellingArea);
    }
    if (nameOfMandi != null) {
      farmerDetailsController.mandiNameTextController.value.text =
          nameOfMandi.toString();
      print(nameOfMandi);
    }
    if (varietyOfVegetables != null) {
      farmerDetailsController.vagVarietyTextController.value.text =
          varietyOfVegetables.toString();
      print(varietyOfVegetables);
    }
    if (amountOfCommision != null) {
      farmerDetailsController.commissionTextController.value.text =
          amountOfCommision.toString();
      print(amountOfCommision);
    }
    if (quest1 != null) {
      farmerDetailsController.selectPeriod.value = quest1.toString();
      print(quest1);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: Text("Edit Farmer Details"),
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
                    labelValue: 'farmer_name'.tr,
                    hintValue: 'farmer_name'.tr,
                    validator: (str) {
                      if (str!.isEmpty) {
                        return Validator.validateName(str ?? "");
                      }
                    },
                    controller:
                        farmerDetailsController.farmerNameTextController.value,
                    keyboardType: TextInputType.text,
                    textStyle: Theme.of(context)
                        .textTheme
                        .labelMedium!
                        .copyWith(fontSize: 14.0),
                    validationErrorMsg: 'farmer_name'.tr),
                const SizedBox(
                  height: 20,
                ),
                EditTextUtils().getCustomEditTextArea(
                    obscureText: false,
                    labelValue: 'farmer_contact'.tr,
                    hintValue: 'farmer_contact'.tr,
                    validator: (str) =>
                        Validator.validatePhoneNumber(str ?? ""),
                    controller:
                        farmerDetailsController.phoneNumberTextController.value,
                    keyboardType: TextInputType.number,
                    textStyle: Theme.of(context)
                        .textTheme
                        .labelMedium!
                        .copyWith(fontSize: 14.0),
                    validationErrorMsg: 'farmer_contact'.tr),
                const SizedBox(
                  height: 20,
                ),
                EditTextUtils().getCustomEditTextArea(
                    obscureText: false,
                    labelValue: 'farmer_alternate_number'.tr,
                    hintValue: 'farmer_alternate_number'.tr,
                    validator: (str) =>
                        Validator.validatePhoneNumber(str ?? ""),
                    controller: farmerDetailsController
                        .alternateNumberTextController.value,
                    keyboardType: TextInputType.number,
                    textStyle: Theme.of(context)
                        .textTheme
                        .labelMedium!
                        .copyWith(fontSize: 14.0),
                    validationErrorMsg: 'farmer_alternate_number'.tr),
                const SizedBox(
                  height: 20,
                ),
                EditTextUtils().getCustomEditTextArea(
                    obscureText: false,
                    labelValue: 'farmer_area'.tr,
                    hintValue: 'farmer_area'.tr,
                    validator: (str) {
                      if (str!.isEmpty) {
                        return Validator.validateText(str ?? "");
                      }
                    },
                    controller:
                        farmerDetailsController.areaTextController.value,
                    keyboardType: TextInputType.text,
                    textStyle: Theme.of(context)
                        .textTheme
                        .labelMedium!
                        .copyWith(fontSize: 14.0),
                    validationErrorMsg: 'farmer_area'.tr),
                const SizedBox(
                  height: 20,
                ),
                EditTextUtils().getCustomEditTextArea(
                    obscureText: false,
                    labelValue: 'crop_carrying_qty'.tr,
                    hintValue: 'crop_carrying_qty'.tr,
                    validator: (str) {
                      if (str!.isNotEmpty) {
                        return Validator.validateAmountNumber(str ?? "");
                      } else {
                        return "Qty Cannot be Empty";
                      }
                    },
                    controller:
                        farmerDetailsController.vagCarryingTextController.value,
                    keyboardType: TextInputType.number,
                    textStyle: Theme.of(context)
                        .textTheme
                        .labelMedium!
                        .copyWith(fontSize: 14.0),
                    validationErrorMsg: 'crop_carrying_qty'.tr),
                const SizedBox(
                  height: 20,
                ),
                EditTextUtils().getCustomEditTextArea(
                    obscureText: false,
                    labelValue: 'crop_qty_produce'.tr,
                    hintValue: 'crop_qty_produce'.tr,
                    validator: (str) {
                      if (str!.isNotEmpty) {
                        return Validator.validateAmountNumber(str ?? "");
                      } else {
                        return "Qty Cannot be Empty";
                      }
                    },
                    controller:
                        farmerDetailsController.vegQuantityTextController.value,
                    keyboardType: TextInputType.number,
                    textStyle: Theme.of(context)
                        .textTheme
                        .labelMedium!
                        .copyWith(fontSize: 14.0),
                    validationErrorMsg: 'crop_qty_produce'.tr),
                const SizedBox(
                  height: 20,
                ),
                EditTextUtils().getCustomEditTextArea(
                    obscureText: false,
                    labelValue: 'mandi_distance'.tr + '(km)',
                    hintValue: 'mandi_distance'.tr + '(km)',
                    validator: (str) {
                      if (str!.isNotEmpty) {
                        return Validator.validateAmountNumber(str ?? "");
                      } else {
                        return "Distance Cannot be Empty";
                      }
                    },
                    controller: farmerDetailsController
                        .mandiDistanceTextController.value,
                    keyboardType: TextInputType.number,
                    textStyle: Theme.of(context)
                        .textTheme
                        .labelMedium!
                        .copyWith(fontSize: 14.0),
                    validationErrorMsg: 'mandi_distance'.tr),
                const SizedBox(
                  height: 20,
                ),
                EditTextUtils().getCustomEditTextArea(
                    obscureText: false,
                    labelValue: 'transport_name'.tr,
                    hintValue: 'transport_name'.tr,
                    validator: (str) {
                      if (str!.isEmpty) {
                        return Validator.validateName(str ?? "");
                      }
                    },
                    controller: farmerDetailsController
                        .transportNameTextController.value,
                    keyboardType: TextInputType.text,
                    textStyle: Theme.of(context)
                        .textTheme
                        .labelMedium!
                        .copyWith(fontSize: 14.0),
                    validationErrorMsg: 'transport_name'.tr),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Obx(() => DropdownButtonFormField<String>(
                            hint: Text('select_validity'.tr),
                            decoration: const InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.black, width: 1),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.black, width: 1),
                              ),
                              filled: true,
                              fillColor: Colors.white,
                            ),
                            dropdownColor: Colors.white,
                            value: farmerDetailsController.selectPeriod.value ==
                                    ""
                                ? null
                                : farmerDetailsController.selectPeriod.value,
                            onChanged: (String? newValue) {
                              farmerDetailsController.setperiodtrip(newValue);
                            },
                            items: farmerDetailsController.farmerVisitList
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
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: EditTextUtils().getCustomEditTextArea(
                          obscureText: false,
                          labelValue: 'farmer_visit'.tr,
                          hintValue: 'farmer_visit'.tr,
                          validator: (str) {
                            if (str!.isNotEmpty) {
                              return Validator.validateAmountNumber(str ?? "");
                            } else {
                              return "Qty Cannot be Empty";
                            }
                          },
                          controller: farmerDetailsController
                              .farmerVisitingTextController.value,
                          keyboardType: TextInputType.number,
                          textStyle: Theme.of(context)
                              .textTheme
                              .labelMedium!
                              .copyWith(fontSize: 14.0),
                          validationErrorMsg: 'farmer_visit'.tr),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                EditTextUtils().getCustomEditTextArea(
                    obscureText: false,
                    labelValue: 'selling_area'.tr,
                    hintValue: 'selling_area'.tr,
                    validator: (str) {
                      if (str!.isEmpty) {
                        return Validator.validateText(str ?? "");
                      }
                    },
                    controller:
                        farmerDetailsController.sellingAreaTextController.value,
                    keyboardType: TextInputType.text,
                    textStyle: Theme.of(context)
                        .textTheme
                        .labelMedium!
                        .copyWith(fontSize: 14.0),
                    validationErrorMsg: 'selling_area'.tr),
                const SizedBox(
                  height: 20,
                ),
                EditTextUtils().getCustomEditTextArea(
                    obscureText: false,
                    labelValue: 'mandi_name'.tr,
                    hintValue: 'mandi_name'.tr,
                    validator: (str) {
                      if (str!.isEmpty) {
                        return Validator.validateName(str ?? "");
                      }
                    },
                    controller:
                        farmerDetailsController.mandiNameTextController.value,
                    keyboardType: TextInputType.text,
                    textStyle: Theme.of(context)
                        .textTheme
                        .labelMedium!
                        .copyWith(fontSize: 14.0),
                    validationErrorMsg: 'mandi_name'.tr),
                const SizedBox(
                  height: 20,
                ),
                EditTextUtils().getCustomEditTextArea(
                    obscureText: false,
                    labelValue: 'crop_variety'.tr,
                    hintValue: 'crop_variety'.tr,
                    validator: (str) {
                      if (str!.isEmpty) {
                        return Validator.validateText(str ?? "");
                      }
                    },
                    controller:
                        farmerDetailsController.vagVarietyTextController.value,
                    keyboardType: TextInputType.text,
                    textStyle: Theme.of(context)
                        .textTheme
                        .labelMedium!
                        .copyWith(fontSize: 14.0),
                    validationErrorMsg: 'crop_variety'.tr),
                const SizedBox(
                  height: 20,
                ),
                EditTextUtils().getCustomEditTextArea(
                    obscureText: false,
                    labelValue: 'commission_amount'.tr,
                    hintValue: 'commission_amount'.tr,
                    validator: (str) {
                      if (str!.isNotEmpty) {
                        return Validator.validateText(str ?? "");
                      } else {
                        return "Cannot be Empty";
                      }
                    },
                    controller:
                        farmerDetailsController.commissionTextController.value,
                    keyboardType: TextInputType.emailAddress,
                    textStyle: Theme.of(context)
                        .textTheme
                        .labelMedium!
                        .copyWith(fontSize: 14.0),
                    validationErrorMsg: 'commission_amount'.tr),
                const SizedBox(
                  height: 20,
                ),
                Obx(() => Center(
                      child: RoundButtonWidget(
                        title: 'Proceed',
                        loading: farmerDetailsController.loading.value,
                        onPress: () {
                          if (kDebugMode) {
                            print(_formKey.currentState!.validate());
                          }
                          if (_formKey.currentState!.validate()) {
                            farmerDetailsController.updateFarmerDeatilsApi();
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
