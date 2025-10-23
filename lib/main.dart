//import 'dart:js_interop';

import 'package:evently_app_online/config/theme/theme_manager.dart';
import 'package:evently_app_online/core/prefs_manager/prefs_manager.dart';
import 'package:evently_app_online/core/routes_manager/app_routes.dart';
import 'package:evently_app_online/core/routes_manager/routes_manager.dart';
import 'package:evently_app_online/l10n/app_localizations.dart';
import 'package:evently_app_online/provider/language_provider.dart';
import 'package:evently_app_online/provider/theme_provider.dart';
//import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await PrefsManager.init();/// وظيفتها انها بتعمل inialize لل object
  runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context)=> ThemeProvider()),
        ChangeNotifierProvider(create: (context)=> LanguageProvider())
      ],
      child: const Evently()));
}

class Evently extends StatelessWidget {
  const Evently({super.key});

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ThemeProvider>(context);///كدا انا جبت ال object اللى اتكريت
    var languageProvider = Provider.of<LanguageProvider>(context);///كدا انا جبت ال object اللى اتكريت

    return ScreenUtilInit(
      designSize: Size(393, 841),
      splitScreenMode: true,
      minTextAdapt: true,
      builder: (context, child)=> MaterialApp(
        debugShowCheckedModeBanner: false,
        onGenerateRoute: RoutesManager.router,
        initialRoute: AppRoutes.mainLayout,
        //initialRoute: AppRoutes.register,
        theme: ThemeManager.light,
        darkTheme: ThemeManager.dark,
        themeMode: themeProvider.currentTheme,
        locale: Locale(languageProvider.currentLanguage),
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: [
          Locale("en"), // English
          Locale("ar"), // Spanish
        ],
      ),
    );
  }
}
