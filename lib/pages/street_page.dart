import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:goroda/colors/custom_colors.dart';
import 'package:goroda/models/street_model.dart';
import 'package:goroda/pages/empty_page.dart';
import 'package:goroda/pages/error_street_page.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class StreetPage extends StatefulWidget {
  const StreetPage({
    super.key,
    required this.cityId,
  });
  final String cityId;

  @override
  State<StreetPage> createState() => _StreetPageState();
}

class _StreetPageState extends State<StreetPage> {
  Future<List<Street>> fetchCities() async {
    Uri url = Uri.parse(
        'https://649befbd0480757192372825.mockapi.io/api/v1/cities/${widget.cityId}/streets');
    Response response = await http.get(url);

    List<Street> streets = [];

    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      for (var street in data) {
        streets.add(Street.fromJson(street));
      }
      return streets;
    } else if (response.statusCode == 404) {
      throw Exception('Страница не найдена');
    } else {
      throw Exception('Ошибка сервера');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
        elevation: 0.0,
        backgroundColor: Colors.white,
        title: Text(
          'Улицы города',
          style: GoogleFonts.inter(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: CustomColors.namefontcolor),
        ),
      ),
      body: FutureBuilder<List<Street>>(
        future: fetchCities(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return ErrorStreetPage(callback: (() {
              setState(() {});
            }));
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(
                color: Colors.black,
                backgroundColor: Color.fromRGBO(242, 243, 245, 1),
                strokeWidth: 3,
              ),
            );
          }

          if (snapshot.hasData && snapshot.data!.isNotEmpty) {
            return ListView.builder(
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(
                      top: 12, bottom: 12, left: 16, right: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      const SizedBox(height: 12),
                      Text(
                        snapshot.data![index].name,
                        style: GoogleFonts.inter(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            color: CustomColors.namefontcolor),
                      ),
                      Text(
                        snapshot.data![index].address,
                        style: GoogleFonts.inter(
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                            color: CustomColors.bluegray),
                      ),
                    ],
                  ),
                );
              },
              itemCount: snapshot.data!.length,
            );
          } else {
            return EmptyPage(callback: (() {
              setState(() {});
            })); // Отображение экрана ошибки
          }
        },
      ),
    );
  }
}
