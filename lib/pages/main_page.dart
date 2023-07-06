import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:goroda/colors/custom_colors.dart';
import 'package:goroda/models/city_model.dart';
import 'package:goroda/pages/error_page.dart';
import 'package:goroda/pages/street_page.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  Future<List<City>> fetchCities() async {
    Uri url =
        Uri.parse('https://649befbd0480757192372825.mockapi.io/api/v1/cities');
    http.Response response = await http.get(url);

    List<City> cities = [];

    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      for (var city in data) {
        cities.add(City.fromJson(city));
      }
    }

    return cities;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: Padding(
          padding: const EdgeInsets.only(left: 8.0, top: 8, bottom: 8),
          child: Text(
            'Города',
            style: GoogleFonts.inter(
                fontSize: 32,
                fontWeight: FontWeight.w600,
                color: const Color.fromRGBO(13, 20, 33, 1)),
          ),
        ),
      ),
      body: FutureBuilder<List<City>>(
        future: fetchCities(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return ErrorPage(callback: (() {
              setState(() {});
            })); // Отображение экрана ошибки
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
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => StreetPage(
                          cityId: snapshot.data![index].id,
                        ),
                      ),
                    );
                  },
                  child: Container(
                    padding:
                        const EdgeInsets.only(left: 16, right: 16, bottom: 16),
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: const Color.fromRGBO(190, 192, 196, 1),
                            width: 1),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(16)),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: 32, bottom: 32, left: 16, right: 16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.network(snapshot.data![index].image),
                            ),
                            const SizedBox(height: 16),
                            Text(
                              snapshot.data![index].name,
                              style: GoogleFonts.inter(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black),
                            ),
                            Text(
                              '${snapshot.data![index].countPeople} человек',
                              style: GoogleFonts.inter(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black),
                            ),
                            const SizedBox(width: double.infinity, height: 8),
                            Text(
                              'Широта ${snapshot.data![index].lat}°',
                              style: GoogleFonts.inter(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black),
                            ),
                            Text(
                              'Долгота ${snapshot.data![index].long}°',
                              style: GoogleFonts.inter(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black),
                            ),
                            const SizedBox(width: double.infinity, height: 8),
                            Text(
                              'Фото сделано ${DateFormat('dd MMMM y', 'ru').format(snapshot.data![index].pictureDate)}',
                              style: GoogleFonts.inter(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: CustomColors.bluegray),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
              itemCount: snapshot.data!.length,
            );
          } else {
            return ErrorPage(callback: (() {
              setState(() {});
            }));
          }
        },
      ),
    );
  }
}
