import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nexus_ecom/utils/colors.dart';
import 'package:nexus_ecom/view/auth/login_screen.dart';
import 'auth/user_auth.dart';
import 'firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  Get.put(AuthService());

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform)
      .then((value) {
    if (kDebugMode) {
      print('Connected =======> Firebase Configured Successfully.');
    }
  }).onError((error, stackTrace) {
    if (kDebugMode) {
      print('Error =======> Firebase is Not Configured Successfully.');
      print('Error =======> $error');
    }
  });

  runApp(const MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Nexus E-COM',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: UColors.primary),
      ),
      home: LoginScreen(),
    );
  }
}
