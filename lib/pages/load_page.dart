import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:goroda/colors/custom_colors.dart';
import 'package:goroda/pages/main_page.dart';

class LoadPage extends StatefulWidget {
  const LoadPage({super.key});

  @override
  State<LoadPage> createState() => _LoadPageState();
}

class _LoadPageState extends State<LoadPage> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 2), () {
      // После 2-х секунд перейти на другую страницу
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => const MainPage()),
      );
    });
  }

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
              Image.asset('assets/images/load_img.png'),
              Text(
                'Города и улицы',
                style: GoogleFonts.inter(
                    fontSize: 30,
                    fontWeight: FontWeight.w600,
                    color: CustomColors.mainfontcolor),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
