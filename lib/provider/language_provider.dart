import 'package:evently_app_online/core/prefs_manager/prefs_manager.dart';
import 'package:flutter/material.dart';

class LanguageProvider extends ChangeNotifier {
  String currentLanguage = PrefsManager.getSavedLanguage() ?? "en";
  void changAppLanguage(String newLang) {
    if (currentLanguage == newLang) return;
    currentLanguage = newLang;
    PrefsManager.saveLanguage(currentLanguage);
    notifyListeners();/// تخلى ال app يحصلو update باللغة الجديدة
  }

  bool get isEnglish => currentLanguage == "en";
}
