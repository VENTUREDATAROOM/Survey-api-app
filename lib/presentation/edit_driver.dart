import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sabji/presentation/controller/edit_driver_controller.dart';
import 'package:sabji/res/components/text_form_feild.dart';
import 'package:sabji/utils/validator.dart';
import '../res/components/round_button.dart';

class EditDriverDetailsView extends StatefulWidget {
  final Map<String, dynamic> args;
  const EditDriverDetailsView({super.key, required this.args});
  @override
  // ignore: library_private_types_in_public_api
  _EditDriverDetailsView createState() => _EditDriverDetailsView();
}

class _EditDriverDetailsView extends State<EditDriverDetailsView> {
  final driverDetailsController = Get.put(EditDriverDetailsController());
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    final driverid = widget.args['driverId'];
    final drivername = widget.args['driverName'];
    final vehiclename = widget.args['dvechileName'];
    final quantity = widget.args['quantityOfVegetables'];
    final roundcount = widget.args['roundCount'];
    final timesOfRaotation = widget.args['timesOfRaotation'];
    final areadrive = widget.args['driverArea'];
    final ownername = widget.args['vechileOwnerName'];
    final drivernumber = widget.args['driverNumber'];
    final alternatenum = widget.args['alternateNumber'];
    print(drivername);
    if (driverid != null) {
      driverDetailsController.driverIdTextController.value.text =
          driverid.toString();
      print(driverid);
    }
    if (drivername != null) {
      driverDetailsController.driverNameTextController.value.text =
          drivername.toString();
    }
    if (timesOfRaotation != null) {
      driverDetailsController.selectTrip.value = timesOfRaotation.toString();
    }

    if (vehiclename != null) {
      driverDetailsController.vehicleNameTextController.value.text =
          vehiclename.toString();
    }
    if (quantity != null) {
      driverDetailsController.qtyVegTextController.value.text =
          quantity.toString();
    }
    if (roundcount != null) {
      driverDetailsController.roundTripTextController.value.text =
          roundcount.toString();
    }
    if (areadrive != null) {
      driverDetailsController.driverAreaTextController.value.text =
          areadrive.toString();
    }
    if (ownername != null) {
      driverDetailsController.vehicleOwnerTextController.value.text =
          ownername.toString();
    }
    if (drivernumber != null) {
      driverDetailsController.driverContactTextController.value.text =
          drivernumber.toString();
    }
    if (alternatenum != null) {
      driverDetailsController.driverAlternateNumTextController.value.text =
          alternatenum.toString();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: Text("driver_details".tr),
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
                    labelValue: 'driver_name'.tr,
                    hintValue: 'driver_name'.tr,
                    validator: (str) {
                      if (str!.isEmpty) {
                        return Validator.validateName(str ?? "");
                      }
                    },
                    controller:
                        driverDetailsController.driverNameTextController.value,
                    keyboardType: TextInputType.text,
                    textStyle: Theme.of(context)
                        .textTheme
                        .labelMedium!
                        .copyWith(fontSize: 14.0),
                    validationErrorMsg: 'driver_name'.tr),
                const SizedBox(
                  height: 20,
                ),
                EditTextUtils().getCustomEditTextArea(
                    obscureText: false,
                    labelValue: 'vehicle_number'.tr,
                    hintValue: 'vehicle_number'.tr,
                    validator: (str) {
                      if (str!.isEmpty) {
                        return Validator.validateText(str ?? "");
                      }
                    },
                    controller:
                        driverDetailsController.vehicleNameTextController.value,
                    keyboardType: TextInputType.emailAddress,
                    textStyle: Theme.of(context)
                        .textTheme
                        .labelMedium!
                        .copyWith(fontSize: 14.0),
                    validationErrorMsg: 'vehicle_number'.tr),
                const SizedBox(
                  height: 20,
                ),
                EditTextUtils().getCustomEditTextArea(
                    obscureText: false,
                    labelValue: 'crop_qty'.tr + '(kg)',
                    hintValue: 'crop_qty'.tr + '(kg)',
                    //validator: (str)=>Validator.validateAmountNumber(str??''),
                    validator: (str) {
                      if (str!.isNotEmpty) {
                        return Validator.validateAmountNumber(str ?? "");
                      } else {
                        return "Cannot Empty";
                      }
                    },
                    controller:
                        driverDetailsController.qtyVegTextController.value,
                    keyboardType: TextInputType.number,
                    textStyle: Theme.of(context)
                        .textTheme
                        .labelMedium!
                        .copyWith(fontSize: 14.0),
                    validationErrorMsg: 'crop_qty'.tr),
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
                            value:
                                driverDetailsController.selectTrip.value == ""
                                    ? null
                                    : driverDetailsController.selectTrip.value,
                            onChanged: (String? newValue) {
                              driverDetailsController.selectTrip.value =
                                  newValue!;
                            },
                            items: driverDetailsController.roundTripList
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
                          labelValue: 'round_trip'.tr,
                          hintValue: 'round_trip'.tr,
                          validator: (str) {
                            if (str!.isNotEmpty) {
                              return Validator.validateAmountNumber(str ?? "");
                            } else {
                              return "Round Trip Cannot be Empty";
                            }
                          },
                          controller: driverDetailsController
                              .roundTripTextController.value,
                          keyboardType: TextInputType.number,
                          textStyle: Theme.of(context)
                              .textTheme
                              .labelMedium!
                              .copyWith(fontSize: 14.0),
                          validationErrorMsg: 'round_trip'.tr),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                EditTextUtils().getCustomEditTextArea(
                    obscureText: false,
                    labelValue: 'driver_area'.tr,
                    hintValue: 'driver_area'.tr,
                    validator: (str) {
                      if (str!.isNotEmpty) {
                        return Validator.validateText(str ?? "");
                      } else {
                        return "Driver Area Cannot be Empty";
                      }
                    },
                    controller:
                        driverDetailsController.driverAreaTextController.value,
                    keyboardType: TextInputType.text,
                    textStyle: Theme.of(context)
                        .textTheme
                        .labelMedium!
                        .copyWith(fontSize: 14.0),
                    validationErrorMsg: 'driver_area'.tr),
                const SizedBox(
                  height: 20,
                ),
                EditTextUtils().getCustomEditTextArea(
                    obscureText: false,
                    labelValue: 'owner_name'.tr,
                    hintValue: 'owner_name'.tr,
                    validator: (str) {
                      if (str!.isNotEmpty) {
                        return Validator.validateText(str ?? "");
                      } else {
                        return "Owner Name Cannot be Empty";
                      }
                    },
                    controller: driverDetailsController
                        .vehicleOwnerTextController.value,
                    keyboardType: TextInputType.text,
                    textStyle: Theme.of(context)
                        .textTheme
                        .labelMedium!
                        .copyWith(fontSize: 14.0),
                    validationErrorMsg: 'owner_name'.tr),
                const SizedBox(
                  height: 20,
                ),
                EditTextUtils().getCustomEditTextArea(
                    obscureText: false,
                    labelValue: 'driver_contact'.tr,
                    hintValue: 'driver_contact'.tr,
                    validator: (str) =>
                        Validator.validatePhoneNumber(str ?? ""),
                    controller: driverDetailsController
                        .driverContactTextController.value,
                    keyboardType: TextInputType.number,
                    textStyle: Theme.of(context)
                        .textTheme
                        .labelMedium!
                        .copyWith(fontSize: 14.0),
                    validationErrorMsg: 'driver_contact'.tr),
                const SizedBox(
                  height: 20,
                ),
                EditTextUtils().getCustomEditTextArea(
                    obscureText: false,
                    labelValue: 'driver_alternate_number'.tr,
                    hintValue: 'driver_alternate_number'.tr,
                    validator: (str) =>
                        Validator.validatePhoneNumber(str ?? ""),
                    controller: driverDetailsController
                        .driverAlternateNumTextController.value,
                    keyboardType: TextInputType.number,
                    textStyle: Theme.of(context)
                        .textTheme
                        .labelMedium!
                        .copyWith(fontSize: 14.0),
                    validationErrorMsg: 'driver_alternate_number'.tr),
                const SizedBox(
                  height: 20,
                ),
                Obx(() => Center(
                      child: RoundButtonWidget(
                        title: 'Proceed',
                        loading: driverDetailsController.loading.value,
                        onPress: () {
                          if (kDebugMode) {
                            print(_formKey.currentState!.validate());
                          }
                          if (_formKey.currentState!.validate()) {
                            driverDetailsController.updateDriverDeatilsApi();
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
