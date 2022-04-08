import 'package:json_annotation/json_annotation.dart';

part 'shared.g.dart';

@JsonSerializable()
class Meal {
  String title;
  int calories;
  int count;

  Meal({required this.title, required this.count, required this.calories});

  factory Meal.fromJson(Map<String, dynamic> json) => _$MealFromJson(json);

  Map<String, dynamic> toJson() => _$MealToJson(this);
}

@JsonSerializable()
class DayMeal {
  DateTime date;

  @JsonKey(name: 'meals', defaultValue: <Meal>[])
  List<Meal> meals;

  DayMeal({required this.date, required this.meals});

  factory DayMeal.fromJson(Map<String, dynamic> json) =>
      _$DayMealFromJson(json);

  Map<String, dynamic> toJson() => _$DayMealToJson(this);
}

@JsonSerializable()
class ListMeal {
  @JsonKey(name: 'list_meals', defaultValue: <DayMeal>[])
  List<DayMeal> listMeals;

  ListMeal({
    required this.listMeals,
  });

  factory ListMeal.fromJson(Map<String, dynamic> json) =>
      _$ListMealFromJson(json);

  Map<String, dynamic> toJson() => _$ListMealToJson(this);
}
