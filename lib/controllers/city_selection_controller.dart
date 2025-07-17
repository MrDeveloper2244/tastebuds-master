import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../models/city_model.dart';

class CitySelectionController extends GetxController {
  var cities = <CityModel>[].obs;
  var filteredCities = <CityModel>[].obs;
  var selectedCity = Rxn<CityModel>();
  var searchController = TextEditingController();
  var isLoading = false.obs;
  final FocusNode searchFocus = FocusNode();

  @override
  void onInit() {
    super.onInit();
    fetchCities();
    searchController.addListener(_onSearchChanged);
  }

  void _onSearchChanged() {
    final query = searchController.text.toLowerCase();
    filteredCities.value = cities
        .where((city) => city.name.toLowerCase().contains(query))
        .toList();
  }


  Future<void> fetchCities() async {
    isLoading.value = true;
    const url =
        'GET https://wft-geo-db.p.rapidapi.com/v1/geo/cities?limit=100&offset=0';

    try {
      final response = await http.get(
        Uri.parse(url),
        headers: {
          'X-RapidAPI-Key': '49f82904bcmsh792388e71a0f446p1a39a5jsn8e424a681bd3', // Replace with your own
          'X-RapidAPI-Host': 'wft-geo-db.p.rapidapi.com',
          'Host':'wft-geo-db.p.rapidapi.com'
        },
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final List<dynamic> cityData = data['data'];

        cities.value = cityData.map<CityModel>((city) => CityModel.fromJson(city)).toList();
        filteredCities.assignAll(cities);
      } else {
        Get.snackbar("Error", "Failed to load cities");
      }
    } catch (e) {
      Get.snackbar("Exception", e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  void selectCity(CityModel city) {
    selectedCity.value = city;
    searchController.text = city.name;
    searchFocus.unfocus();
  }
}
