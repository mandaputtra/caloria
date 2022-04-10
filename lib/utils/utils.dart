import 'dart:async';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:caloria/types/shared.dart';

const kListMeal = 'list_meals';

bool getDifferenceInDays(DayMeal el, DateTime now) {
  return el.date.difference(now).inDays == 0;
}

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
  var savedList = prefs.getString(kListMeal);

  DateTime now = DateTime.now();
  if (savedList != null) {
    // previous list
    Map<String, dynamic> decoded = jsonDecode(savedList);
    var listMeal = ListMeal.fromJson(decoded);
    var search = listMeal.listMeals
        .where((element) => getDifferenceInDays(element, now));
    if (search.isNotEmpty) {
      var list = search.toList();
      list[0].meals.addAll(meals);
    } else {
      DayMeal newDayMeal = DayMeal(date: now, meals: meals);
      listMeal.listMeals.add(newDayMeal);
    }
    await prefs.setString(kListMeal, jsonEncode(listMeal));
  } else {
    // new list, only called once
    ListMeal newListMeal = ListMeal(listMeals: []);
    DayMeal newDayMeal = DayMeal(date: now, meals: meals);
    newListMeal.listMeals.add(newDayMeal);
    await prefs.setString(kListMeal, jsonEncode(newListMeal));
  }
}

Future<ListMeal> getAllDayMeals() async {
  final prefs = await SharedPreferences.getInstance();
  var savedList = prefs.getString(kListMeal);
  ListMeal listMeal =
      ListMeal.fromJson(jsonDecode(savedList ?? '{ "list_meals": [] }'));
  return listMeal;
}

String getTotalMealPerDay(List<Meal> listMeal) {
  int sum = listMeal.fold(
      0, (previousValue, meal) => previousValue + (meal.calories * meal.count));
  return '$sum kkal';
}

Future<String> getTodayCalorie() async {
  final prefs = await SharedPreferences.getInstance();
  var savedList = prefs.getString(kListMeal);

  if (savedList != null) {
    DateTime now = DateTime.now();
    Map<String, dynamic> decoded = jsonDecode(savedList);
    var listMeal = ListMeal.fromJson(decoded);
    var search = listMeal.listMeals
        .where((element) => getDifferenceInDays(element, now));
    var list = search.toList();
    return getTotalMealPerDay(list[0].meals);
  } else {
    return 'No meal recorded today';
  }
}
