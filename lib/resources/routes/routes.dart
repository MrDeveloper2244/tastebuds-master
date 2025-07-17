import 'package:get/get.dart';
import 'package:tastebuds/resources/routes/routes_names.dart';
import 'package:tastebuds/views/bottom_nav_view/bottom_nav_view.dart';
import 'package:tastebuds/views/explore_view.dart/explore_view.dart';
import 'package:tastebuds/views/home_view/home_search_view.dart';
import 'package:tastebuds/views/home_view/home_view.dart';
import 'package:tastebuds/views/login/login_selection_view.dart';
import 'package:tastebuds/views/login/login_view.dart';
import 'package:tastebuds/views/saved_view/saved_view.dart';
import 'package:tastebuds/views/signup/appetite_selection_screen.dart';
import 'package:tastebuds/views/signup/city_selection_screen.dart';
import 'package:tastebuds/views/signup/country_selection_screen.dart';
import 'package:tastebuds/views/signup/create_account_screen.dart';
import 'package:tastebuds/views/signup/enter_digit_screen.dart';
import 'package:tastebuds/views/signup/forget_password_screen.dart';
import 'package:tastebuds/views/signup/loading_screen.dart';
import 'package:tastebuds/views/signup/pallete_share_screen.dart';
import 'package:tastebuds/views/signup/signup_view.dart';
import 'package:tastebuds/views/signup/week_meal_selection.dart';
import 'package:tastebuds/views/splash_view/splash_view.dart';

class AppRoutes {
  static appRoutes() => [
        GetPage(
            name: RouteName.homesearchview,
            page: () => HomeSearchView()),

        GetPage(
            name: RouteName.loginSelectionScreen,
            page: () => LoginSelectionView()),
        GetPage(
            name: RouteName.createAccountScreen,
            page: () => CreateAccountScreen()),
        GetPage(
            name: RouteName.enterDigitScreen, 
            page: () => EnterDigitScreen()),
        GetPage(
            name: RouteName.palleteShareScreen,
            page: () => PalleteShareScreen()),
        GetPage(name: RouteName.splashScreen, page: () => SplashScreen()),
        GetPage(name: RouteName.signupScreen, page: () => SignupScreen()),
        GetPage(name: RouteName.loginScreen, page: () => LoginView()),
        GetPage(name: RouteName.homeScreen, page: () => HomeScreen()),
        GetPage(name: RouteName.bottomNavScreen, page: () => BottomNavScreen()),
        GetPage(name: RouteName.savedScreen, page: () => SavedScreen()),
        GetPage(name: RouteName.exploreScreen, page: () => ExploreScreen()),
        GetPage(
            name: RouteName.loginSelectionScreen,
            page: () => LoginSelectionView()),
        GetPage(
            name: RouteName.createAccountScreen,
            page: () => CreateAccountScreen()),
        GetPage(
            name: RouteName.citySelectionScreen,
            page: () => CitySelectionScreen()),
        GetPage(
            name: RouteName.appetiteSelectionScreen,
            page: () => AppetiteSelectionScreen()),
        GetPage(
            name: RouteName.weekMealSelectionScreen,
            page: () => WeekMealSelectionScreen()),
        GetPage(
            name: RouteName.forgetPasswordScreen,
            page: () => ForgetPasswordView()),
        GetPage(name: RouteName.loadingScreen, page: () => LoadingScreen()),
        // GetPage(
        // name: RouteName.countrySelectionScreen,
        // page: () => CountrySelectionScreen()),
      ];
}
