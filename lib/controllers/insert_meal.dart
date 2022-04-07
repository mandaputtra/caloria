import 'package:caloria/types/shared.dart';
import 'package:get/state_manager.dart';

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
