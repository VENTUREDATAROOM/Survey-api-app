import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sabji/utils/shared_preference.dart';
import 'package:sabji/view/login_view.dart';
import 'package:sabji/view_models/controller/dashboard_controller.dart';
import 'package:sabji/view_models/controller/profile_contrroller.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../res/routes/routes_name.dart';
import 'custom_text.dart';

class DashboardView extends StatefulWidget {
  DashboardView({super.key});

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  final dashboardViewModelController = Get.put(DashboardController());
  final profileViewController = Get.put(ProfileController());
  @override
  void initState() {
    super.initState();
    dashboardViewModelController.refreshData();
  }

  Future<void> saveLanguagePreference(String languageCode) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('language', languageCode);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: Text("survey_profile".tr),
        leading: Builder(
          builder: (context) => IconButton(
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              icon: Icon(Icons.menu)),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Center(child: Text('Select Language')),
                      actions: [
                        TextButton(
                          onPressed: () async {
                            await saveLanguagePreference("en");
                            Get.updateLocale(Locale("en", "US"));

                            Navigator.of(context).pop(); // Close the popup
                          },
                          child: Text('English'),
                        ),
                        SizedBox(
                          width: 80,
                        ),
                        TextButton(
                          onPressed: () async {
                            await saveLanguagePreference("hi");
                            Get.updateLocale(Locale("hi", "IN"));
                            Navigator.of(context).pop(); // Close the popup
                          },
                          child: Text('Hindi'),
                        ),
                      ],
                    );
                  },
                );
              }, // Removed the extra comma here
              child: Icon(Icons.settings),
            ),
          )
        ],
      ),
      drawer: Drawer(
        backgroundColor: Colors.grey[600],
        child: Obx(
          () => Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 50, left: 10),
                child: Text(
                  "Profile",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 20,
                ),
                child: Center(
                  child: CircleAvatar(
                    radius: 50,
                    backgroundImage: NetworkImage(
                        'https://play-lh.googleusercontent.com/rfI3uL_Ran-zRSksf44GhSfAOhFB8yzgTNRZCi52sbuc0yw9z2xiJfCsajdHP6QeOB4=w2560-h1440-rw',
                        scale: 50),
                    backgroundColor: Colors.grey[400],
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.all(25.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Name :",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 10,
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(
                              10.0), // Optional: Add padding for better appearance
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(
                                10.0), // Adjust the radius as needed
                          ),
                          child: Text(
                            "${profileViewController.name}",
                            style: TextStyle(
                              color: Colors.black,
                              // fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Date of Birth :",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 10,
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(
                              10.0), // Optional: Add padding for better appearance
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(
                                10.0), // Adjust the radius as needed
                          ),
                          child: Text(
                            "${profileViewController.dob}",
                            style: TextStyle(
                                color: Colors.black,
                                // fontWeight: FontWeight.bold,
                                fontSize: 14),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Email :",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 10,
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(
                              10.0), // Optional: Add padding for better appearance
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(
                                10.0), // Adjust the radius as needed
                          ),
                          child: Text(
                            "${profileViewController.email}",
                            style: TextStyle(
                                color: Colors.black,
                                // fontWeight: FontWeight.bold,
                                fontSize: 14),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Mobile No. :",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 10,
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(
                              10.0), // Optional: Add padding for better appearance
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(
                                10.0), // Adjust the radius as needed
                          ),
                          child: Text(
                            "${profileViewController.mobileno}",
                            style: TextStyle(
                                color: Colors.black,
                                // fontWeight: FontWeight.bold,
                                fontSize: 14),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Aadhar No. :",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 10,
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(
                              10.0), // Optional: Add padding for better appearance
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(
                                10.0), // Adjust the radius as needed
                          ),
                          child: Text(
                            "${profileViewController.aadharnum}",
                            style: TextStyle(
                                color: Colors.black,
                                // fontWeight: FontWeight.bold,
                                fontSize: 14),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
              Spacer(),
              Padding(
                padding: const EdgeInsets.only(bottom: 50, right: 20),
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: ElevatedButton(
                    onPressed: () {
                      // logoutController.getlogout();
                      PreferenceUtils.clearPreferences();
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(builder: (_) => LoginView()),
                          (route) => false);
                    },
                    child: const Text('Logout'),
                    style: ElevatedButton.styleFrom(
                        elevation: 0, backgroundColor: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: Obx(() => SizedBox.expand(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  InkWell(
                    onTap: () {
                      Get.toNamed(RouteName.vegcard);
                    },
                    child: SizedBox(
                      height: 150,
                      width: 200,
                      child: Card(
                        elevation: 20,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: Center(
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 10,
                              ),
                              CustomText(
                                  dashboardViewModelController.cropCount.value
                                      .toString(),
                                  28,
                                  FontWeight.bold),
                              const SizedBox(
                                height: 10,
                              ),
                              CustomText("vegetable".tr, 28, FontWeight.bold),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    onTap: () {
                      Get.toNamed(RouteName.drivercard);
                    },
                    child: SizedBox(
                      height: 150,
                      width: 200,
                      child: Card(
                        elevation: 20,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: Center(
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 10,
                              ),
                              CustomText(
                                  dashboardViewModelController.driverCount.value
                                      .toString(),
                                  28,
                                  FontWeight.bold),
                              const SizedBox(
                                height: 10,
                              ),
                              CustomText('driver'.tr, 28, FontWeight.bold),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    onTap: () {
                      Get.toNamed(RouteName.farmercard);
                    },
                    child: SizedBox(
                      height: 150,
                      width: 200,
                      child: Card(
                        elevation: 20,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: Center(
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 10,
                              ),
                              CustomText(
                                  dashboardViewModelController.farmerCount.value
                                      .toString(),
                                  28,
                                  FontWeight.bold),
                              const SizedBox(
                                height: 10,
                              ),
                              CustomText('farmer'.tr, 28, FontWeight.bold),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    onTap: () {
                      Get.toNamed(RouteName.vendorcard);
                      print(dashboardViewModelController.vendorCount.value);
                    },
                    child: SizedBox(
                      height: 150,
                      width: 200,
                      child: Card(
                        elevation: 20,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: Center(
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 10,
                              ),
                              CustomText(
                                  dashboardViewModelController.vendorCount.value
                                      .toString(),
                                  28,
                                  FontWeight.bold),
                              const SizedBox(
                                height: 10,
                              ),
                              CustomText('vendor'.tr, 28, FontWeight.bold),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
