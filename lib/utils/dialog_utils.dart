import 'package:expense_manager/service/route_service.dart';
import 'package:expense_manager/utils/color_const.dart';
import 'package:expense_manager/utils/text_styles.dart';
import 'package:flutter/material.dart';

Future<void> showErrorDialog(String msg) {
  return showDialog(
    context: navigationKey.currentContext!,
    builder: (context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: Text(
          msg,
          style: AppTextStyles.medium(fontSize: 14),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('Okay'),
          ),
        ],
      );
    },
  );
}

Future<void> showconfirmDialog(String msg, Function function) {
  return showDialog(
    context: navigationKey.currentContext!,
    builder: (context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: Text(
          msg,
          style: AppTextStyles.medium(fontSize: 16),
        ),
        actions: [
          TextButton(
            onPressed: () {
              function;
            },
            child: const Text('Okay'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('Cancel'),
          ),
        ],
      );
    },
  );
}

class DialogUtils {
  static bool isLoading = false;

  static void showLoader() {
    isLoading = true;
    showDialog(
      context: navigationKey.currentContext!,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return const Center(
          child: CircularProgressIndicator(
            color: ColorConst.fontColorBlack,
          ),
        );
      },
    );
  }

  static void hideLoader() {
    if (isLoading) {
      isLoading = false;
      RouteManager.pop();
    }
  }
}
