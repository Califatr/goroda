import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:goroda/colors/custom_colors.dart';

class ButtonWidget extends StatelessWidget {
  final String text;
  final VoidCallback? onTap;

  const ButtonWidget({
    super.key,
    required this.text,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: CustomColors.namefontcolor,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Text(
          text,
          style: GoogleFonts.inter(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
