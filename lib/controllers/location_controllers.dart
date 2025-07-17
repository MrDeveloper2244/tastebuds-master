// import 'package:get/get.dart';
// import 'package:geocoding/geocoding.dart';
// import 'package:world_countries/world_countries.dart';

// class LocationController extends GetxController {
//   final Rx<WorldCountry?> selectedCountry = Rx<WorldCountry?>(null);
//   final RxString selectedCity = ''.obs;
//   final RxList<WorldCountry> countries = <WorldCountry>[].obs;
//   final RxList<Placemark> cities = <Placemark>[].obs;
//   final RxBool isLoading = false.obs;

//   @override
//   void onInit() {
//     super.onInit();
//     loadCountries();
//   }

//   Future<void> loadCountries() async {
//     try {
//       isLoading.value = true;
//       final allCountries = await WorldCountries.all();
//       countries.assignAll(allCountries);
//       isLoading.value = false;
//     } catch (e) {
//       isLoading.value = false;
//       Get.snackbar('Error', 'Failed to load countries');
//     }
//   }

//   Future<void> loadCities(String countryName) async {
//     try {
//       isLoading.value = true;
//       final locations = await locationFromAddress(countryName);
//       final placemarks = await placemarkFromCoordinates(
//         locations.first.latitude,
//         locations.first.longitude,
//       );
//       cities.assignAll(placemarks);
//       isLoading.value = false;
//     } catch (e) {
//       isLoading.value = false;
//       Get.snackbar('Error', 'Failed to load cities for $countryName');
//     }
//   }

//   void selectCountry(WorldCountry country) {
//     selectedCountry.value = country;
//     loadCities(country.name.nativeName?.common ?? country.name.common);
//   }

//   void selectCity(String city) {
//     selectedCity.value = city;
//   }

//   void clearSelection() {
//     selectedCountry.value = null;
//     selectedCity.value = '';
//     cities.clear();
//   }
// }