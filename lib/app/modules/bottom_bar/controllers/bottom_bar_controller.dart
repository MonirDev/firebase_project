import 'package:get/get.dart';

class BottomBarController extends GetxController {
  var currentIndex = 0.obs;

  onItemTapped(int index) {
    currentIndex.value = index;
  }
}
