import 'dart:convert';

class Meal {
  String title;
  int calories;
  int count;

  Meal({required this.title, required this.count, required this.calories});

  Map toJson() => {'title': title, 'calories': calories, 'count': count};
}

class DayMeal {
  DateTime date;
  List<Meal> meals;

  DayMeal({required this.date, required this.meals});

  Map toJson() => {'date': date, 'meals': jsonEncode(meals)};
}
