import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widgets/button_widget.dart';

class ErrorStreetPage extends StatelessWidget {
  final Function()? callback;
  const ErrorStreetPage({super.key, this.callback});

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
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  children: [
                    const SizedBox(width: double.infinity),
                    Image.asset('assets/images/error_street_img.png'),
                    const SizedBox(height: 24),
                    Text(
                      'Без улиц можно потеряться',
                      style: GoogleFonts.inter(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: const Color.fromRGBO(53, 65, 83, 1)),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Не смогли загрузить список улиц, спросите у кого‑нибудь как пройти.',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.inter(
                          height: 1.5,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: const Color.fromRGBO(102, 112, 133, 1)),
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
