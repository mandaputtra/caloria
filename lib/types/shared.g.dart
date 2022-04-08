// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shared.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Meal _$MealFromJson(Map<String, dynamic> json) => Meal(
      title: json['title'] as String,
      count: json['count'] as int,
      calories: json['calories'] as int,
    );

Map<String, dynamic> _$MealToJson(Meal instance) => <String, dynamic>{
      'title': instance.title,
      'calories': instance.calories,
      'count': instance.count,
    };

DayMeal _$DayMealFromJson(Map<String, dynamic> json) => DayMeal(
      date: DateTime.parse(json['date'] as String),
      meals: (json['meals'] as List<dynamic>?)
              ?.map((e) => Meal.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$DayMealToJson(DayMeal instance) => <String, dynamic>{
      'date': instance.date.toIso8601String(),
      'meals': instance.meals,
    };

ListMeal _$ListMealFromJson(Map<String, dynamic> json) => ListMeal(
      listMeals: (json['list_meals'] as List<dynamic>?)
              ?.map((e) => DayMeal.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$ListMealToJson(ListMeal instance) => <String, dynamic>{
      'list_meals': instance.listMeals,
    };
