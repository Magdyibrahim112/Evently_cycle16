import 'package:flutter/material.dart';

class LanguageProvider extends ChangeNotifier {
  String currentLanguage = "en";
  void changAppLanguage(String newLang) {
    if (currentLanguage == newLang) return;
    currentLanguage == newLang;
    notifyListeners();
  }

  bool get isEnglish => currentLanguage == "en";
}
