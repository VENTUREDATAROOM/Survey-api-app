import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sabji/data/response/status.dart';
import 'package:sabji/presentation/edit_driver.dart';
import 'package:sabji/presentation/edit_veggie.dart';
import '../view_models/controller/added_driver_controller.dart';

class AddedDriverView extends StatelessWidget {
  AddedDriverView({super.key});
  final AddedDriverController addedDriverController =
      Get.put(AddedDriverController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Drivers"),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Icon(Icons.search, size: 30),
          )
        ],
      ),
      body: Obx(
        () => addedDriverController.isLoading.value
            ? Center(child: CircularProgressIndicator())
            : Container(
                padding: const EdgeInsets.all(16),
                child: ListView.builder(
                  itemCount: addedDriverController.drivers.value.length,
                  itemBuilder: (context, index) {
                    return Card(
                      elevation: 5,
                      color: Colors.purple[200],
                      margin: const EdgeInsets.only(bottom: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Align(
                              alignment: Alignment.topRight,
                              child: IconButton(
                                onPressed: () {
                                  Get.to(() => EditDriverDetailsView(
                                        args: addedDriverController
                                            .drivers.value[index],
                                      ));
                                },
                                icon: Icon(Icons.edit),
                                color: Colors.white,
                                iconSize: 24,
                                padding: EdgeInsets.all(8),
                              ),
                            ),
                            ..._buildDriverInfoRows(index),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
      ),
    );
  }

  List<Widget> _buildDriverInfoRows(int index) {
    return [
      _buildTableRow("Driver ID",
          "${addedDriverController.drivers.value[index]['driverId']}"),
      _buildTableRow("Vehicle Driver Name",
          "${addedDriverController.drivers.value[index]['driverName']}"),
      _buildTableRow("Vehicle Owner Name",
          "${addedDriverController.drivers.value[index]['vechileOwnerName']}"),
      _buildTableRow("Vehicle Number",
          "${addedDriverController.drivers.value[index]['dvechileName']}"),
      _buildTableRow("Quantity of Vegetables",
          "${addedDriverController.drivers.value[index]['quantityOfVegetables']}"),
      _buildTableRow("Round Count",
          "${addedDriverController.drivers.value[index]['roundCount']}/${addedDriverController.drivers.value[index]['timesOfRaotation']}"),
      _buildTableRow("Driver Area",
          "${addedDriverController.drivers.value[index]['driverArea']}"),
      _buildTableRow("Driver Number",
          "${addedDriverController.drivers.value[index]['driverNumber']}"),
      _buildTableRow("Driver Alternate Number",
          "${addedDriverController.drivers.value[index]['alternateNumber']}"),
    ];
  }

  Widget _buildTableRow(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        const SizedBox(width: 16),
        Expanded(
          child:
              Text(value, style: TextStyle(fontSize: 16, color: Colors.white)),
        ),
      ],
    );
  }
}
