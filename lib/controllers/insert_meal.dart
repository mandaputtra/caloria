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
  var meals = [].obs;

  addMeal(Meal meal) {
    if (!meals.contains(meal)) {
      meals.add(meal);
    }
    meals.refresh();
  }

  removeMeal(Meal meal) {
    meals.remove(meal);
  }

  addCounter(int index) {
    var meal = meals[index];
    var count = meal.count + 1;
    meals[index] =
        Meal(title: meal.title, count: count, calories: meal.calories);
    meals.refresh();
  }

  removeCounter(int index) {
    var meal = meals[index];
    if (meal.count > 1) {
      var count = meal.count - 1;
      meals[index] =
          Meal(title: meal.title, count: count, calories: meal.calories);
      meals.refresh();
    }
  }

  clearInsertMealState() {
    meals.clear();
  }
}
