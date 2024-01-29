import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sabji/presentation/edit_farmer.dart';
import 'package:sabji/presentation/edit_vendor.dart';
import 'package:sabji/view_models/controller/added_vendor_controller.dart';

class AddedVendorView extends StatefulWidget {
  @override
  _AddedVendorViewState createState() => _AddedVendorViewState();
}

class _AddedVendorViewState extends State<AddedVendorView> {
  final AddedVendorController addedVendorController =
      Get.put(AddedVendorController());

  bool isSearchVisible = false;
  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: isSearchVisible ? _buildSearchField() : Text("My Vendors"),
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
          )
        ],
      ),
      body: Obx(
        () => addedVendorController.isLoading.value
            ? Center(child: CircularProgressIndicator())
            : ListView.builder(
                shrinkWrap: true,
                itemCount: addedVendorController.vendors.length,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 5,
                    color: Colors.purple[200],
                    margin: EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 15.0),
                              child: Text(
                                "${addedVendorController.vendors.value[index]['vendorName']}",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                Get.to(() => EditVendorDetailsView(
                                    args: addedVendorController
                                        .vendors.value[index]));
                              },
                              icon: Icon(
                                Icons.edit,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        _buildTableRow("Vendor ID",
                            "${addedVendorController.vendors.value[index]['vendorId']}"),
                        _buildTableRow("Vendor Age",
                            "${addedVendorController.vendors.value[index]['age']}"),
                        _buildTableRow("Vendor Number",
                            "${addedVendorController.vendors.value[index]['vendorNumber']}"),
                        _buildTableRow("Vendor Address",
                            "${addedVendorController.vendors.value[index]['vendorAddress']}"),
                        _buildTableRow("Shop Address",
                            "${addedVendorController.vendors.value[index]['shopAddress']}"),
                        _buildTableRow("Mandi Priority",
                            "${addedVendorController.vendors.value[index]['mandiPriority']}"),
                        _buildTableRow("Vendor Type",
                            "${addedVendorController.vendors.value[index]['vendorType']}"),
                        _buildTableRow("Vegetable Variety",
                            "${addedVendorController.vendors.value[index]['vegetableVariety']}"),
                        _buildTableRow("Mandi Visit",
                            "${addedVendorController.vendors.value[index]['mandiVisit']}"),
                        SizedBox(
                          height: 10,
                        )
                      ],
                    ),
                  );
                },
              ),
      ),
    );
  }

  Widget _buildSearchField() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: searchController,
              decoration: InputDecoration(
                hintText: 'Search by mobile number',
                border: InputBorder.none,
                contentPadding: EdgeInsets.all(10),
              ),
            ),
          ),
          IconButton(
            icon: Icon(Icons.close),
            onPressed: () {
              setState(() {
                isSearchVisible = false;
                searchController.clear();
              });
            },
          ),
        ],
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
            style: TextStyle(color: Colors.white),
          ),
          Spacer(),
          Text("${value}",
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
        ],
      ),
    );
  }
}
