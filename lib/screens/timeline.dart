import 'package:caloria/constants.dart';
import 'package:caloria/types/shared.dart';
import 'package:caloria/utils/utils.dart';
import 'package:caloria/widgets/bottom_navigation.dart';
import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

String pattern = 'dd MMM, yyyy';

class TimelineScreen extends StatefulWidget {
  const TimelineScreen({Key? key}) : super(key: key);

  @override
  State<TimelineScreen> createState() => _TimelineScreenState();
}

class _TimelineScreenState extends State<TimelineScreen> {
  List<DayMeal> listMeals = [];

  Future<void> getAllListMeal() async {
    var meals = await getAllDayMeals();
    setState(() {
      listMeals = meals.listMeals;
    });
  }

  @override
  void initState() {
    getAllListMeal();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const BottomNavigation(),
      body: ListView.builder(
        itemCount: listMeals.length,
        itemBuilder: (context, listMealIndex) {
          var dayMeal = listMeals[listMealIndex];
          return ExpansionTileCard(
            initialPadding: const EdgeInsets.all(10),
            finalPadding: const EdgeInsets.all(10),
            title: Text(
              DateFormat(pattern).format(dayMeal.date),
              style: kCardTitleStyle,
            ),
            subtitle: Text(
              '${getTotalCalories(dayMeal.meals)} kkal',
              style: kCardTitleStyle,
            ),
            baseColor: Colors.blue,
            expandedColor: Colors.blue,
            children: [
              const Divider(
                thickness: 1.0,
                height: 1.0,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16.0,
                    vertical: 8.0,
                  ),
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: dayMeal.meals.length,
                    itemBuilder: (context, dayMealIndex) {
                      var meal = dayMeal.meals[dayMealIndex];
                      return ListTile(
                        title: Text(
                          '${meal.title} - ${meal.calories * meal.count} kkal',
                          style: kCardTitleStyle,
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
