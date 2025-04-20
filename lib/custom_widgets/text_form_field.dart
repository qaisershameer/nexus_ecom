import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../utils/colors.dart';

class UTextFormField extends StatelessWidget {
  const UTextFormField({
    super.key,
    required this.labelText,
    required this.hintText,
    this.prefixIcon,
    this.suffixIcon,
    this.validator,
    this.onSaved,
    this.controller,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.maxLines = 1,
  });

  final String labelText;
  final String hintText;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final String? Function(String?)? validator;
  final void Function(String?)? onSaved;
  final TextEditingController? controller;
  final TextInputType keyboardType;
  final bool obscureText;
  final int maxLines;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(

        style: GoogleFonts.montserrat(textStyle: TextStyle(color: Colors.white, fontSize: 16)),
        cursorColor: UColors.primary,
        keyboardType: keyboardType,
        obscureText: obscureText,
        controller: controller,
        validator: validator,
        maxLines: maxLines,
        onSaved: onSaved,

        decoration: InputDecoration(

          labelText: labelText,
          labelStyle: GoogleFonts.montserrat(textStyle: TextStyle(color: UColors.light, fontSize: 16)),

          hintText: hintText,
          hintStyle: GoogleFonts.montserrat(textStyle: TextStyle(color: UColors.light, fontSize: 16)),

          prefixIcon: prefixIcon != null ? Icon(prefixIcon, color: UColors.grey500) : null,
          suffixIcon: suffixIcon != null ? Icon(suffixIcon, color: UColors.grey500) : null,

          // filled: false,
          // fillColor: const Color(0xFF003366).withAlpha(25),
          // contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),

          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide(color: UColors.deepOrange, width: 3)),

          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide(color: UColors.deepOrange, width: 3)),
          ),

        ),



    );
  }
}
