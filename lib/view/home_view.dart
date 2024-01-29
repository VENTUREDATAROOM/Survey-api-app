import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sabji/view/crop_details_view.dart';
import 'package:sabji/view/dashboard_view.dart';
import 'package:sabji/view/driver_details_view.dart';
import 'package:sabji/view/farmer_details_view.dart';
import 'package:sabji/view_models/controller/home_controller.dart';

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'vender_details_view.dart';

class HomeView extends StatefulWidget {
  HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int _selectedIndex = 0;

  final HomeController landingPageController = Get.put(HomeController());

  final TextStyle unselectedLabelStyle = TextStyle(
      color: Colors.white.withOpacity(0.5),
      fontWeight: FontWeight.w500,
      fontSize: 12);

  final TextStyle selectedLabelStyle = const TextStyle(
      color: Colors.white, fontWeight: FontWeight.w500, fontSize: 12);

  Widget buildPages() {
    switch (_selectedIndex) {
      case 1:
        return CropDetailsView();
      case 2:
        return DriverDetailsView();

      case 3:
        return FarmerDetailsView();
      case 4:
        return VendorDetailsView();
      case 0:
      default:
        return DashboardView();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildPages(),
      bottomNavigationBar: buildBottomNavigationMenu(context),
    );
  }

  buildBottomNavigationMenu(context) {
    return SizedBox(
      height: 60,
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue.shade200, Colors.purple.shade400],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: CurvedNavigationBar(
          height: 60,
          backgroundColor: Colors.transparent,
          color: Colors.transparent,
          buttonBackgroundColor: Colors.white,
          animationCurve: Curves.easeInOut,
          animationDuration: const Duration(milliseconds: 600),
          items: [
            Icon(
              Icons.home,
              size: 30.0,
            ),
            Icon(
              Icons.ac_unit,
              size: 30.0,
              color: Colors.blueGrey,
            ),
            Icon(
              Icons.fire_truck,
              size: 30.0,
              color: Colors.red,
            ),
            Icon(
              Icons.person,
              size: 30.0,
              color: Colors.green,
            ),
            Icon(
              Icons.shopping_cart,
              size: 30.0,
              color: Colors.amber,
            ),
          ],
          onTap: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
        ),
      ),
    );
  }

  // buildBottomNavigationMenu(context, landingPageController) {
  //   return SizedBox(
  //     height: 60,
  //     child: CurvedNavigationBar(
  //       showUnselectedLabels: true,
  //       showSelectedLabels: true,
  //       onTap: (int index) {
  //         setState(() {
  //           _selectedIndex = index;
  //         });
  //       },
  //       currentIndex: _selectedIndex,
  //       backgroundColor: const Color.fromRGBO(36, 54, 101, 1.0),
  //       unselectedItemColor: Colors.white.withOpacity(0.5),
  //       selectedItemColor: Colors.white,
  //       unselectedLabelStyle: unselectedLabelStyle,
  //       selectedLabelStyle: selectedLabelStyle,
  //       items: [
  //         BottomNavigationBarItem(
  //           icon: Container(
  //             margin: const EdgeInsets.only(bottom: 7),
  // child: const Icon(
  //   Icons.home,
  //   size: 20.0,
  // ),
  //           ),
  //           label: 'Dashboard',
  //           backgroundColor: const Color.fromRGBO(36, 54, 101, 1.0),
  //         ),
  //         BottomNavigationBarItem(
  //           icon: Container(
  //             margin: const EdgeInsets.only(bottom: 7),
  // child: const Icon(
  //   Icons.ac_unit,
  //   size: 20.0,
  // ),
  // ),
  //           label: 'Crop',
  //           backgroundColor: const Color.fromRGBO(36, 54, 101, 1.0),
  //         ),
  //         BottomNavigationBarItem(
  //           icon: Container(
  //             margin: const EdgeInsets.only(bottom: 7),
  // child: const Icon(
  //   Icons.fire_truck,
  //   size: 20.0,
  // ),
  //           ),
  //           label: 'Transport',
  //           backgroundColor: const Color.fromRGBO(36, 54, 101, 1.0),
  //         ),
  //         BottomNavigationBarItem(
  //           icon: Container(
  //             margin: const EdgeInsets.only(bottom: 7),
  // child: const Icon(
  //   Icons.person,
  //   size: 20.0,
  // ),
  //           ),
  //           label: 'Farmer',
  //           backgroundColor: const Color.fromRGBO(36, 54, 101, 1.0),
  //         ),
  //         BottomNavigationBarItem(
  //           icon: Container(
  //             margin: const EdgeInsets.only(bottom: 7),
  // child: const Icon(
  //   Icons.shopping_cart,
  //   size: 20.0,
  // ),
  //           ),
  //           label: 'Vendor',
  //           backgroundColor: const Color.fromRGBO(36, 54, 101, 1.0),
  //         ),
  //       ],
  //     ),
  //   );
  // }
}
