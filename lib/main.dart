import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:sabji/res/localization/languages.dart';
import 'package:sabji/res/routes/routes.dart';
import 'package:sabji/utils/shared_preference.dart';
import 'package:sabji/view/splash_screen.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/cupertino.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Future.wait([
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]),
    PreferenceUtils.init()
  ]).then((value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String savedLanguage = prefs.getString('language') ?? "en";
    runApp(MyApp(
      initialLanguage: savedLanguage,
    ));
  });
}

class MyApp extends StatelessWidget {
  final String initialLanguage;
  const MyApp({super.key, required this.initialLanguage});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      debugShowCheckedModeBanner: false,
      title: 'Sabji Survey',
      translations: Languages(),
      locale: Locale(initialLanguage, ""),
      fallbackLocale: Locale("en", "US"),
      supportedLocales: [
        Locale("en", "US"),
        Locale("hi", "IN"),
      ],
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: SplashScreen(),
      getPages: AppRoutes.appRoutes(),
    );
  }
}
