import 'package:get/state_manager.dart';

class Meal {
  String title;
  int calories;
  int count;

  Meal({required this.title, required this.count, required this.calories});

  update(Meal meal) {
    title = meal.title;
    count = meal.count;
    calories = meal.calories;
  }
}

class InsertMealState extends GetxController {
  RxList<dynamic> meals = [].obs;

  addMeal(Meal meal) {
    if (!meals.contains(meal)) {
      meals.add(meal);
    }
  }

  removeMeal(Meal meal) {
    meals.remove(meal);
  }

  editMeal(Meal meal, String title) {
    meals.firstWhere((element) => element.title == title).update(meal);
  }

  clearInsertMealState() {
    meals.clear();
  }
}
