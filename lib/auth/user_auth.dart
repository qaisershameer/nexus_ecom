import 'package:get/get.dart';
import 'package:flutter/foundation.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../custom_widgets/my_toast.dart';
import '../utils/snackbar_helpers.dart';
import '../view/auth/login_screen.dart';

class AuthService {
  static final FirebaseAuth auth = FirebaseAuth.instance;


  /// [Firebase SignUp]
  static Future<User?> signUpUserToApp({required String userEmail, required String userPassword}) async {
    try {
      /// Success Then Return User
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
          email: userEmail, password: userPassword);
      return userCredential.user;

      /// Failure Firebase Return Code Matching
    } on FirebaseAuthException catch (ae) {
      if (ae.code == 'email-already-in-use') {
        showToast(message: 'This email already in use, try different');
      }
      if (ae.code == 'weak-password') {
        showToast(message: 'Enter a strong password');
      }

      /// Error Response
    } catch (e) {
      if (kDebugMode) {
        print('User-Auth Error Occurred in signUpUserToApp: $e');
      }
      showToast(message: 'Something went wrong while signup. try again later.');
    }

    return null;
  }

  /// [Firebase Login]
  static Future<User?> loginUserToApp(      {required String userEmail, required String userPassword}) async {
    try {
      /// Success Then Return User
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
          email: userEmail, password: userPassword);
      return userCredential.user;

      /// Failure Firebase Return Code Matching
    } on FirebaseAuthException catch (ae) {
      if (ae.code == 'wrong-password') {
        // showToast(message: 'You entered a wrong password');
        USnackBarHelpers.errorSnackBar(
            title: 'SignIn Error', message: 'You entered wrong password');
      }
      if (ae.code == 'user-disabled') {
        showToast(message: 'User Disabled: Contact Admin');
      }
      if (ae.code == 'invalid-email') {
        showToast(message: 'Enter a valid registered email');
      }
      if (ae.code == 'user-not-found') {
        showToast(message: 'Enter a valid user email');
      }
      if (ae.code == 'INVALID_LOGIN_CREDENTIALS' ||
          ae.code == 'invalid-credential') {
        showToast(message: 'Enter a valid user credentials');
      }

      /// Error Response
    } catch (e) {
      if (kDebugMode) {
        print('User-Auth Error Occurred in LoginUserToApp: $e');
      }
      showToast(message: 'Something went wrong while login. try again later.');
    }

    return null;
  }

  /// [Firebase Logout]
  Future<void> logoutUserFromApp() async {
    /// try to logout via email-authentication from App
    try {
      // try to Sign out email
      await FirebaseAuth.instance.signOut();
      USnackBarHelpers.successSnackBar(title: 'Logout', message: 'You have been logged out from the App.');
      Get.offAll(() => LoginScreen());

      /// Error Response
    } catch (e) {
      if (kDebugMode) {
        print('User-Auth Error Occurred while LogoutUserFromApp: $e');
      }
      showToast(message: 'Something went wrong while login. try again later.');
      USnackBarHelpers.errorSnackBar(title: 'Logout Error', message: 'Try again later');
    }
  }
}
