import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:sabji/presentation/edit_farmer.dart';
import 'package:sabji/view_models/controller/added_farmer_controller.dart';

class AddedFarmersView extends StatelessWidget {
  AddedFarmersView({super.key});
  AddedFarmerController addedFarmerController =
      Get.put(AddedFarmerController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Farmers"),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 19),
            child: Icon(
              Icons.search,
              size: 30,
            ),
          )
        ],
      ),
      body: Obx(
        () => addedFarmerController.isLoading.value
            ? Center(child: CircularProgressIndicator())
            : ListView.builder(
                shrinkWrap: true,
                itemCount: addedFarmerController.farmers.value.length,
                itemBuilder: (context, index) {
                  log("this is to check ${addedFarmerController.farmers.value[index]['farmerName']}");
                  return Card(
                    elevation: 5,
                    color: Colors.purple[200],
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "${addedFarmerController.farmers.value[index]['farmerName']}",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              IconButton(
                                onPressed: () {
                                  // Navigate to edit page
                                  Get.to(() => EditFarmerDetailsView(
                                      args: addedFarmerController
                                          .farmers.value[index]));
                                },
                                icon: Icon(
                                  Icons.edit,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          const SizedBox(height: 10),
                          _buildTableRow("Farmer ID",
                              "${addedFarmerController.farmers.value[index]['farmerId']}"),
                          _buildTableRow("Farmer Number",
                              "${addedFarmerController.farmers.value[index]['phoneNumber']}"),
                          _buildTableRow("Farmer Alternate Number",
                              "${addedFarmerController.farmers.value[index]['alternateNumber']}"),
                          _buildTableRow("Farmer Address",
                              "${addedFarmerController.farmers.value[index]['area']}"),
                          _buildTableRow("Veg Current Carrying",
                              "${addedFarmerController.farmers.value[index]['vegCurntCarrying']}"),
                          _buildTableRow("Veg Quantity",
                              "${addedFarmerController.farmers.value[index]['vegetableQuantity']}"),
                          _buildTableRow("Distance (in Km)",
                              "${addedFarmerController.farmers.value[index]['distanceFromMandi']}"),
                          _buildTableRow("Transport",
                              "${addedFarmerController.farmers.value[index]['transportName']}"),
                          _buildTableRow("Visit Count",
                              "${addedFarmerController.farmers.value[index]['farmerVisitingCount']}/${addedFarmerController.farmers.value[index]['quest1']}"),
                          _buildTableRow("Mandi Name",
                              "${addedFarmerController.farmers.value[index]['nameOfMandi']}"),
                          _buildTableRow("Vegetable Variety",
                              "${addedFarmerController.farmers.value[index]['varietyOfVegetables']}"),
                          _buildTableRow("Commission",
                              "${addedFarmerController.farmers.value[index]['amountOfCommision']}"),
                          SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
      ),
    );
  }

  Widget _buildTableRow(String label, dynamic value) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 3, horizontal: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            "${label} :",
            style: GoogleFonts.notoSansDevanagari(
              textStyle: TextStyle(color: Colors.white),
            ),
          ),
          Spacer(),
          Text(
            "${value}",
            style: GoogleFonts.notoSansDevanagari(
              textStyle: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            // TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ],
      ),
    );
  }
}
