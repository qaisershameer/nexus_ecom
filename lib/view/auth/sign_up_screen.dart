import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:nexus_ecom/utils/colors.dart';
import 'package:nexus_ecom/custom_widgets/text_form_field.dart';
import 'package:nexus_ecom/view/auth/login_screen.dart';
import '../../controllers/auth/sign_up_controller.dart';
import '../../custom_widgets/elevated_button.dart';
import '../../utils/sizes.dart';
import '../../utils/text_style.dart';
import '../../utils/texts.dart';
import '../../utils/validation.dart';
import '../../custom_widgets/check_tiles.dart';
import '../../custom_widgets/heading_section.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});
  final controller = Get.put(SignUpController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      ///-----[AppBar]-----
      appBar: AppBar(
        title: Text(UTexts.registrationText, style: appBarTextStyles),
        automaticallyImplyLeading: false,
        backgroundColor: UColors.dark,
      ),
      backgroundColor: UColors.secondary,

      ///-----[Body]-----
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Form(
            key: controller.signUpFormKey,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  ///-----[Header]-----
                  HeadingSection(
                    heading: UTexts.signUpHeadingText,
                    subHeading: UTexts.signUpSubHeadingText,
                  ),

                  /// Gap
                  SizedBox(height: USizes.md16),

                  /// Name
                  UTextFormField(
                    controller: controller.name,
                    validator: (value) => UValidator.validateEmptyText('First Name', value),
                    labelText: 'Name',
                    hintText: 'Enter Your Name',
                    prefixIcon: Iconsax.user,
                  ),

                  /// Phone Number
                  UTextFormField(
                    controller: controller.phone,
                    keyboardType: TextInputType.phone,
                    validator: (value) => UValidator.validatePhoneNumber(value),
                    labelText: 'Phone',
                    hintText: '+92 334 6013608',
                    prefixIcon: Iconsax.call,
                  ),

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
                  SizedBox(height: USizes.sm8),

                  /// Tiles
                  Obx(() => CheckTile(isCheck: controller.hasOneDigit.value, title: ' Contain One Digit')),
                  Obx(() => CheckTile(isCheck: controller.hasLowerCase.value, title: ' Contain Lower Case')),
                  Obx(() => CheckTile(isCheck: controller.hasUpperCase.value, title: ' Contain Upper Case')),
                  Obx(() => CheckTile(isCheck: controller.isEightCharacter.value, title: ' Contain Eight Characters')),
                  Obx(() => CheckTile(isCheck: controller.hasSymbol.value, title: ' Contain Symbol (~`!@#\$%^&*()_+=/)')),

                  /// Gap
                  SizedBox(height: USizes.md16),

                  /// Create Account
                  Obx(() => controller.isLoading.value
                      ? Center(child: CircularProgressIndicator())
                      : UElevatedButton(onPressed: () => controller.signUp(
                      name: controller.name.text.trim(),
                      phone: controller.phone.text.trim(),
                      email: controller.email.text.trim(),
                      password: controller.password.text,
                    ), bgColor: Colors.green.shade800, child: Text(UTexts.createAccount)),
                  ),

                  /// Gap
                  SizedBox(height: USizes.md16),
                  
                  /// Text
                  GestureDetector(
                    onTap: () => Get.to(() => LoginScreen()),
                    child: Center(
                      child: Text('already have an Account? Click here to LOGIN', style: TextStyle(
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
