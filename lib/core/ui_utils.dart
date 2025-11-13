import 'package:evently_app_online/core/resources/colors_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class UIUtils {
  static void showLoading(BuildContext context, {bool isDismissible = true}) {
    showDialog(
      barrierDismissible: isDismissible,

      /// عشان وهو بيكريت لما تدوس على اى حاجة ميطلعش
      context: context,
      builder: (context) => PopScope(
        canPop: isDismissible,
        child: CupertinoAlertDialog(
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [Center(child: CircularProgressIndicator())],
          ),
        ),
      ),
    );
  }

  static void hideDialog(BuildContext context) {
    Navigator.pop(context);
  }

  static showMessage(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (context) => CupertinoAlertDialog(
        content: Text(message, style: TextStyle(color: ColorsManager.black1C)),
      ),
    );
  }

  static void showToastMessage(String message, Color bgColor){
    Fluttertoast.showToast(
        msg: message,
        gravity: ToastGravity.BOTTOM,
        //timeInSecForIosWeb: 1,
        backgroundColor: bgColor,
        textColor: Colors.white,
        fontSize: 16.0
    );
  }
}
