import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:nexus_ecom/controllers/auth/login_controller.dart';
import 'package:nexus_ecom/utils/colors.dart';
import 'package:nexus_ecom/custom_widgets/text_form_field.dart';
import 'package:nexus_ecom/view/auth/sign_up_screen.dart';
import '../../custom_widgets/elevated_button.dart';
import '../../utils/sizes.dart';
import '../../utils/text_style.dart';
import '../../utils/texts.dart';
import '../../utils/validation.dart';
import '../../custom_widgets/heading_section.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final controller = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      ///-----[AppBar]-----
      appBar: AppBar(
        title: Text(UTexts.signInText, style: appBarTextStyles),
        automaticallyImplyLeading: false,
        backgroundColor: UColors.dark,
      ),
      backgroundColor: UColors.secondary,

      ///-----[Body]-----
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Form(
            key: controller.loginFormKey,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  ///-----[Header]-----
                  HeadingSection(
                    heading: UTexts.loginHeadingText,
                    subHeading: UTexts.loginSubHeadingText,
                  ),

                  /// Gap
                  SizedBox(height: USizes.md16),

                  /// Email
                  UTextFormField(
                      controller: controller.email,
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) => UValidator.validateEmail(value),
                      labelText: 'Email',
                      hintText: 'Enter Your Email',
                      prefixIcon: Iconsax.direct_inbox
                  ),

                  /// Password
                  Obx(() =>
                      UTextFormField(
                          controller: controller.password,
                          validator: (value) => UValidator.validatePassword(value),
                          obscureText: controller.isPasswordVisible.value,
                          labelText: 'Password',
                          hintText: 'Enter Your Password',
                          prefixIcon: Iconsax.password_check,
                          suffixIcon: controller.isPasswordVisible.value ? Iconsax.eye : Iconsax.eye_slash
                      )
                  ),

                  /// Gap
                  SizedBox(height: USizes.md16),

                  /// Create Account
                  Obx(() => controller.isLoading.value
                      ? Center(child: CircularProgressIndicator())
                      : UElevatedButton(onPressed: () => controller.login(
                    email: controller.email.text.trim(),
                    password: controller.password.text,
                  ), bgColor: Colors.green.shade800, child: Text(UTexts.loginAccount)),
                  ),

                  /// Gap
                  SizedBox(height: USizes.md16),

                  /// Text
                  GestureDetector(
                    onTap: () => Get.to(() => SignUpScreen()),
                    child: Center(
                      child: Text('don\'t have an Account? Click here to REGISTER', style: TextStyle(
                        color: Colors.deepOrange.shade500,
                        fontSize: 14,)),
                    ),
                  )

                ]),
          ),
        ),
      ),
    );
  }
}
