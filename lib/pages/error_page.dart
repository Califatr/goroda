import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:goroda/colors/custom_colors.dart';

import '../widgets/button_widget.dart';

class ErrorPage extends StatelessWidget {
  final Function()? callback;
  const ErrorPage({super.key, this.callback});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 120),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(width: double.infinity),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  children: [
                    Image.asset('assets/images/error_img.png'),
                    const SizedBox(height: 24),
                    Text(
                      'Оглядитесь...',
                      style: GoogleFonts.inter(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: CustomColors.mainfontcolor),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Нет ни городов, ни улиц. Очевидно, что‑то сломалось и мы уже это чиним.',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.inter(
                          height: 1.5,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: CustomColors.bluegray),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 126, left: 16, right: 16),
                child: ButtonWidget(text: 'Попробовать снова', onTap: callback),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
