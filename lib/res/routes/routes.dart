import 'package:get/get.dart';
import 'package:sabji/res/routes/routes_name.dart';
import 'package:sabji/view/added_driver_view.dart';
import 'package:sabji/view/added_farmers_view.dart';
import 'package:sabji/view/added_vendor_view.dart';
import 'package:sabji/view/home_view.dart';
import 'package:sabji/view/language_screen.dart';
import 'package:sabji/view/login_view.dart';
import 'package:sabji/view/registration_view.dart';
import 'package:sabji/view/splash_screen.dart';

import '../../view/added_vegetable_view.dart';
import '../components/internet_exception_view.dart';

class AppRoutes {
  static appRoutes() => [
        GetPage(
            name: RouteName.splashScreen,
            page: () => const SplashScreen(),
            transitionDuration: const Duration(milliseconds: 200),
            transition: Transition.leftToRight),
        GetPage(
            name: RouteName.languageScreen,
            page: () => const LanguageScreen(),
            transitionDuration: const Duration(milliseconds: 200),
            transition: Transition.leftToRight),
        GetPage(
            name: RouteName.loginView,
            page: () => const LoginView(),
            transitionDuration: const Duration(milliseconds: 200),
            transition: Transition.leftToRight),
        GetPage(
            name: RouteName.registrationView,
            page: () => const RegistrationView(),
            transitionDuration: const Duration(milliseconds: 200),
            transition: Transition.leftToRight),
        GetPage(
            name: RouteName.homeView,
            page: () => HomeView(),
            transitionDuration: const Duration(milliseconds: 200),
            transition: Transition.leftToRight),
        GetPage(
            name: RouteName.internetExceptionView,
            page: () => InternetExceptionWidget(
                  onPress: () {},
                ),
            transitionDuration: const Duration(milliseconds: 200),
            transition: Transition.leftToRight),
        GetPage(
          name: RouteName.vegcard,
          page: () => AddedVegetableView(),
          transitionDuration: const Duration(milliseconds: 200),
          transition: Transition.leftToRight,
        ),
        GetPage(
          name: RouteName.drivercard,
          page: () => AddedDriverView(),
          transitionDuration: const Duration(milliseconds: 200),
          transition: Transition.leftToRight,
        ),
        GetPage(
          name: RouteName.farmercard,
          page: () => AddedFarmersView(),
          transitionDuration: const Duration(milliseconds: 200),
          transition: Transition.leftToRight,
        ),
        GetPage(
          name: RouteName.vendorcard,
          page: () => AddedVendorView(),
          transitionDuration: const Duration(milliseconds: 200),
          transition: Transition.leftToRight,
        ),
      ];
}
