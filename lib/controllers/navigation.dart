import 'package:get/state_manager.dart';

class NavigationState extends GetxController {
  var page = 0.obs;
  changeIndex(int newValue) => page.value = newValue;
}
