import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:nexus_ecom/auth/user_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:nexus_ecom/view/home_screen.dart';
import '../../utils/snackbar_helpers.dart';

class LoginController extends GetxController{
  static LoginController get instance => Get.find();

  /// Variables
  final loginFormKey = GlobalKey<FormState>();
  RxBool isLoading = false.obs;
  RxBool isPasswordVisible = false.obs;

  RxBool obscureStatus = true.obs;
  final email = TextEditingController();
  final password = TextEditingController();

  void login({
    required String email,
    required String password
  }) async {
    try {
      // Start Loading
      isLoading.value = true;

      // Form Validation
      if (!loginFormKey.currentState!.validate()) {
        isLoading.value = false;
        return;
      }

      // Call the Auth-Service Function
      User? user = await AuthService.loginUserToApp(userEmail: email, userPassword: password);

      if (user != null) {

        // Stop Loading
        isLoading.value = false;

        // print(user.uid);

        // Getx SnackBar
        Get.snackbar('Success', 'You have been logged-in successfully');

        // Self SnackBar
        USnackBarHelpers.successSnackBar(title: 'Login Firebase', message: 'You have been logged-in successfully');

        // Sign In Screen
        Get.to(() => HomeScreen());

        // Error User Sign Up
      } else {

        // Stop Loading
        isLoading.value = false;

        // Getx SnackBar
        Get.snackbar('Login Failed', 'Unable to login, try again later');

        // Self SnackBar
        USnackBarHelpers.errorSnackBar(title: 'Login Failed', message: 'Unable to login, try again later');
      }
    } catch (e) {

      // Stop Loading
      isLoading.value = false;

      // GetX Error SnackBar Message
      Get.snackbar('Login Error', e.toString());

      // Self SnackBar Error Message
      USnackBarHelpers.errorSnackBar(title: 'Login Error', message: e.toString());

    }
  }

}
