import 'package:get/get.dart';

class DashboardController extends GetxController{
  RxInt tabIndex = 0.obs;
  RxBool shouldRefreshNavigationPage = false.obs;

  void changeTabIndex(int index) {
    if (index == 0) {
      shouldRefreshNavigationPage.value = true;
    } else {
      shouldRefreshNavigationPage.value = false;
    }
    tabIndex.value = index;
  }

}