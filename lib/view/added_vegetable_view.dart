import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sabji/presentation/edit_veggie.dart';
import 'package:sabji/view_models/controller/added_vegetable_controller.dart';

class AddedVegetableView extends StatefulWidget {
  @override
  _AddedVegetableViewState createState() => _AddedVegetableViewState();
}

class _AddedVegetableViewState extends State<AddedVegetableView> {
  final AddedVegetableController addedVegetableController =
      Get.put(AddedVegetableController());

  bool isSearchVisible = false;
  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "Vegies",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: IconButton(
                icon: Icon(Icons.search, size: 30),
                onPressed: () {
                  setState(() {
                    isSearchVisible = !isSearchVisible;
                  });
                },
              ),
            ),
          ],
        ),
        body: Obx(() => addedVegetableController.isLoading.value
            ? Center(child: CircularProgressIndicator())
            : ListView.builder(
                shrinkWrap: true,
                itemCount: addedVegetableController.vegetables.length,
                itemBuilder: (context, index) {
                  return Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      elevation: 5,
                      color: _getColorBasedOnAvailability(
                          addedVegetableController.vegetables.value[index]
                              ['availability']),
                      child: Padding(
                          padding: const EdgeInsets.all(15),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Align(
                                  alignment: Alignment.topRight,
                                  child: IconButton(
                                    onPressed: () {
                                      Get.to(() => EditVeggies(
                                            args: addedVegetableController
                                                .vegetables.value[index],
                                          ));
                                    },
                                    icon: Icon(Icons.edit),
                                    color: Colors.white,
                                    iconSize: 24,
                                    padding: EdgeInsets.all(8),
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      addedVegetableController.vegetables
                                          .value[index]['vegetableName'],
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                                Divider(
                                  color: Colors.white.withOpacity(0.5),
                                  thickness: 1,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Vegetable ID:",
                                      style: TextStyle(
                                          color: Colors.white.withOpacity(0.7)),
                                    ),
                                    Text(
                                      "${addedVegetableController.vegetables.value[index]['vegId']}",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Time Period:",
                                      style: TextStyle(
                                          color: Colors.white.withOpacity(0.7)),
                                    ),
                                    Text(
                                      addedVegetableController.vegetables
                                          .value[index]['timeperiod'],
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Validity:",
                                      style: TextStyle(
                                          color: Colors.white.withOpacity(0.7)),
                                    ),
                                    Text(
                                      addedVegetableController.vegetables
                                          .value[index]['vegetableValidity'],
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Cold Storage:",
                                      style: TextStyle(
                                          color: Colors.white.withOpacity(0.7)),
                                    ),
                                    Text(
                                      addedVegetableController
                                              .vegetables.value[index]
                                          ['coldStorageRequirement'],
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Availability:",
                                      style: TextStyle(
                                          color: Colors.white.withOpacity(0.7)),
                                    ),
                                    Text(
                                      addedVegetableController.vegetables
                                          .value[index]['availability'],
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ],
                                )
                              ])));
                })));
  }

  Color _getColorBasedOnAvailability(String availability) {
    if (availability == "bulk".tr) {
      return Colors.green; // Use a visually pleasing shade of green
    } else if (availability == "demand".tr) {
      return Colors.orange; // Use a suitable shade of orange
    } else if (availability == "shortage".tr) {
      return Colors.amber; // Use a suitable shade of orange
    } else {
      return Colors.grey; // Use a suitable shade of grey
    }
  }
}
