import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:nexus_ecom/auth/user_auth.dart';
import 'package:nexus_ecom/utils/colors.dart';
import 'package:nexus_ecom/utils/text_style.dart';
import '../custom_widgets/elevated_button.dart';
import '../custom_widgets/heading_section.dart';
import '../utils/sizes.dart';
import '../utils/texts.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {

    final AuthService auth = Get.find<AuthService>();

    return Scaffold(
      ///-----[AppBar]-----
      appBar: AppBar(
        title: Text('Nexus E.COM APP', style: appBarTextStyles),
        automaticallyImplyLeading: false,
        backgroundColor: UColors.primary,
        centerTitle: true,
      ),

      ///-----[Body]-----
      backgroundColor: Colors.black12,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ///-----[Header]-----
              HeadingSection(
                heading: UTexts.welcomeText,
                subHeading: UTexts.welcomeBody,
              ),

              /// Gap
              SizedBox(height: USizes.lg24),

              /// Logout Account
                UElevatedButton(
                    onPressed: auth.logoutUserFromApp,
                    bgColor: Colors.green.shade800,
                    child: Text(UTexts.logoutAccount)
              ),

            ],
          ),
        ),
      ),
    );
  }
}
