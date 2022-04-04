import 'package:caloria/controllers/navigation.dart';
import 'package:caloria/screens/home.dart';
import 'package:caloria/screens/insert_meal.dart';
import 'package:caloria/screens/timeline.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({Key? key}) : super(key: key);

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  final NavigationState navigation = Get.find();

  bool isCurrentRoutes(int target, int value, int currentIndex) {
    return value == target && currentIndex != target;
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.blue,
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.white.withOpacity(.60),
      selectedFontSize: 14,
      unselectedFontSize: 14,
      currentIndex: navigation.page.toInt(),
      onTap: (value) {
        int currentIndex = navigation.page.toInt();
        if (isCurrentRoutes(0, value, currentIndex)) {
          Get.to(() => HomeScreen());
        }
        if (isCurrentRoutes(1, value, currentIndex)) {
          Get.to(() => const TimelineScreen());
        }

        if (isCurrentRoutes(2, value, currentIndex)) {
          Get.to(() => const InsertMealScreen());
        }
        navigation.changeIndex(value);
      },
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          label: 'Home',
          icon: Icon(Icons.home),
        ),
        BottomNavigationBarItem(
          label: 'Timeline',
          icon: Icon(Icons.menu_book),
        ),
        BottomNavigationBarItem(
          label: 'Add Meal',
          icon: Icon(Icons.restaurant_menu),
        ),
      ],
    );
  }
}
