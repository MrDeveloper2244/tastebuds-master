import 'package:get/get.dart';

class BottomNavController extends GetxController {
  RxInt selectedIndex = 0.obs;
  // final BackgroundLocationServicex locationService =
  //     BackgroundLocationServicex();

  void changeIndex(int index) {
    selectedIndex.value = index;
    }
  
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    // locationService.startBackgroundTracking();
  }
}
