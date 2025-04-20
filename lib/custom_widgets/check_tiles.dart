import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nexus_ecom/utils/sizes.dart';

import '../utils/colors.dart';

class CheckTile extends StatelessWidget {
  const CheckTile({
    super.key,
    required this.isCheck,
    required this.title,
  });

  final bool isCheck;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: USizes.xs4),
      child: Row(
        children: [
          /// Animated Container
          AnimatedContainer(
              duration: const Duration(microseconds: 800),
              decoration: BoxDecoration(
                  color: isCheck ? Colors.green : Colors.transparent,
                  borderRadius: BorderRadius.circular(50),
                  border: Border.all(
                      color: isCheck ? Colors.transparent : Colors.green)),
              child: Icon(Icons.check,
                  size: 15,
                  color: isCheck ? Colors.white : Colors.grey.shade500)),

          /// Gap
          const SizedBox(height: USizes.sm8),

          /// Text
          Text(title,
              style: GoogleFonts.montserrat(
                textStyle: TextStyle(
                  color: UColors.light,
                  fontSize: USizes.fontSizeMd,
                ),
              )),
        ],
      ),
    );
  }
}
