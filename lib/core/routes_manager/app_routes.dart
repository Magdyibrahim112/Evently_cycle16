import 'package:evently_app_online/features/authentication/login/login.dart';
import 'package:evently_app_online/features/authentication/register/register.dart';
import 'package:evently_app_online/features/main_layout/main_layout.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'routes_manager.dart';

class RoutesManager {
  static Route? router(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.register:
        {
          return CupertinoPageRoute(builder: (context) => Register());
        }
      case AppRoutes.login:
        {
          return CupertinoPageRoute(builder: (context) => Login());
        }
      case AppRoutes.mainLayout:
        {
          return CupertinoPageRoute(builder: (context) => MainLayout());
        }
    }
  }
}
