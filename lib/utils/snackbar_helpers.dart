import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:nexus_ecom/utils/colors.dart';

class USnackBarHelpers {

  /// Warning Orange Snack bar
  static warningSnackBar({required title, message = ''}) {
    Get.snackbar(title, message,
        isDismissible: true,
        shouldIconPulse: true,
        colorText: UColors.white,
        backgroundColor: Colors.orange,
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 2),
        margin: const EdgeInsets.all(20),
        icon: Icon(Iconsax.warning_2, color: UColors.white));
  }

  /// Success Green Snack bar
  static successSnackBar({required title, message = '', duration = 2}) {
    Get.snackbar(title, message,
        isDismissible: true,
        shouldIconPulse: true,
        colorText: UColors.white,
        backgroundColor: UColors.primary,
        snackPosition: SnackPosition.BOTTOM,
        duration: Duration(seconds: duration),
        margin: const EdgeInsets.all(10),
        icon: Icon(Iconsax.check, color: UColors.white));
  }

  /// Error Red Snack bar
  static errorSnackBar({required title, message = ''}) {
    Get.snackbar(title, message,
        isDismissible: true,
        shouldIconPulse: true,
        colorText: UColors.white,
        backgroundColor: Colors.red.shade600,
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 2),
        margin: const EdgeInsets.all(20),
        icon: Icon(Iconsax.warning_2, color: UColors.white));
  }
}
