import 'dart:async';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:caloria/types/shared.dart';

class Debouncer {
  final Duration delay;
  Timer? _timer;

  Debouncer({required this.delay});

  run(void Function() action) {
    _timer?.cancel();
    _timer = Timer(delay, action);
  }

  dispose() {
    _timer?.cancel();
  }
}

Future<void> saveDayMeal(List<Meal> meals) async {
  final prefs = await SharedPreferences.getInstance();
  var savedList = prefs.getString('list_meal');

  DateTime now = DateTime.now();
  if (savedList != null) {
    // previous list
    Map<String, dynamic> decoded = jsonDecode(savedList);
    var listMeal = ListMeal.fromJson(decoded);
    var search = listMeal.listMeals.where((element) => element.date == now);
    if (search.isNotEmpty) {
      listMeal.listMeals
          .firstWhere((element) => element.date == now)
          .meals
          .addAll(meals);
    } else {
      DayMeal newDayMeal = DayMeal(date: now, meals: meals);
      listMeal.listMeals.add(newDayMeal);
    }
    await prefs.setString('list_meal', jsonEncode(listMeal));
  } else {
    // new list, only called once
    ListMeal newListMeal = ListMeal(listMeals: []);
    DayMeal newDayMeal = DayMeal(date: now, meals: meals);
    newListMeal.listMeals.add(newDayMeal);
    await prefs.setString('list_meal', jsonEncode(newListMeal));
  }
}

Future<ListMeal> getAllDayMeals() async {
  final prefs = await SharedPreferences.getInstance();
  var savedList = prefs.getString('list_meal');
  return ListMeal.fromJson(jsonDecode(savedList ?? '{ "list_meals": [] }'));
}
