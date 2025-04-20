import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nexus_ecom/utils/sizes.dart';
import '../utils/device_helpers.dart';

class UElevatedButton extends StatelessWidget {
  const UElevatedButton({
    super.key,
    required this.onPressed,
    required this.child,
    required this.bgColor,
  });

  final VoidCallback onPressed;
  final Widget child;
  final Color bgColor;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: UDeviceHelper.getScreenWidth(context),
        child: ElevatedButton(
            onPressed: onPressed,
            style: ElevatedButton.styleFrom(
              backgroundColor: bgColor,
              foregroundColor: Colors.white,
              textStyle: GoogleFonts.montserrat(fontSize: USizes.fontSizeMd),
            ),
            child: child));
  }
}
