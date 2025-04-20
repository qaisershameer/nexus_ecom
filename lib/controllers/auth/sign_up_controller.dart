import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:nexus_ecom/auth/user_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:nexus_ecom/view/home_screen.dart';
import '../../utils/snackbar_helpers.dart';

class SignUpController extends GetxController{
  static SignUpController get instance => Get.find();

  /// Variables
  final signUpFormKey = GlobalKey<FormState>();
  RxBool isLoading = false.obs;
  RxBool isPasswordVisible = false.obs;

  RxBool obscureStatus = true.obs;
  RxBool isEightCharacter = false.obs;
  RxBool hasSymbol = false.obs;
  RxBool hasOneDigit = false.obs;
  RxBool hasLowerCase = false.obs;
  RxBool hasUpperCase = false.obs;

  final name = TextEditingController();
  final phone = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();

  /// For Password Validators Display
  RegExp symbolRegEx = RegExp(r'[~`!@#\$%^&*()_+=]');
  RegExp numericRegEx = RegExp(r'[0-9]');
  RegExp upperRegEx = RegExp(r'[A-Z]');
  RegExp lowerRegEx = RegExp(r'[a-z]');

  @override
  void onInit() {
    super.onInit();

    // Add listener to password field
    password.addListener(() {
      passwordValidator(password.text);
    });
  }

  void passwordValidator(String password) {

      hasSymbol.value = false;
      if (symbolRegEx.hasMatch(password)) {
        hasSymbol.value = true;
      }

      isEightCharacter.value = false;
      if (password.length >= 8) {
        isEightCharacter.value = true;
      }

      hasOneDigit.value = false;
      if (numericRegEx.hasMatch(password)) {
        hasOneDigit.value = true;
      }

      hasLowerCase.value = false;
      if (lowerRegEx.hasMatch(password)) {
        hasLowerCase.value = true;
      }

      hasUpperCase.value = false;
      if (upperRegEx.hasMatch(password)) {
        hasUpperCase.value = true;
      }

  }

  String? validator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is require';
    }
    passwordValidator(value);
    if (!isEightCharacter.value ||
        !hasSymbol.value ||
        !hasOneDigit.value ||
        !hasLowerCase.value ||
        !hasUpperCase.value) {
      return 'Password does not match the Password Criteria';
    }
    return null;
  }

  void signUp({
    required String name,
    required String phone,
    required String email,
    required String password
  }) async {
    try {
      // Start Loading
      isLoading.value = true;

      // Password Validation for Check Tiles
      // passwordValidator(password);

      // Form Validation
      if (!signUpFormKey.currentState!.validate()) {
        isLoading.value = false;
        return;
      }

      // Call the Auth-Service Function
      User? user = await AuthService.signUpUserToApp(
          userEmail: email, userPassword: password);

      if (user != null) {

        // Stop Loading
        isLoading.value = false;

        // print(user.uid);

        // Getx SnackBar
        Get.snackbar('Success', 'You have been registered successfully');

        // Self SnackBar
        USnackBarHelpers.successSnackBar(title: 'SignUp Firebase', message: 'You have been registered successfully');

        // Sign In Screen
        Get.to(() => HomeScreen());

      // Error User Sign Up
      } else {

        // Stop Loading
        isLoading.value = false;

        // Getx SnackBar
        Get.snackbar('SignUp Failed', 'Unable to create account, try again later');

        // Self SnackBar
        USnackBarHelpers.errorSnackBar(title: 'SignUp Failed', message: 'Unable to create account, try again later');
      }
    } catch (e) {

      // Stop Loading
      isLoading.value = false;

      // GetX Error SnackBar Message
      Get.snackbar('Signup Error', e.toString());

      // Self SnackBar Error Message
      USnackBarHelpers.errorSnackBar(title: 'Signup Error', message: e.toString());

    }
  }
}
