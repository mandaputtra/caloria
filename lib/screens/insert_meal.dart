import 'package:caloria/constants.dart';
import 'package:caloria/controllers/insert_meal.dart';
import 'package:caloria/widgets/bottom_navigation.dart';
import 'package:caloria/widgets/meal_explorer.dart';
import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';

// ignore: use_key_in_widget_constructors
class InsertMealScreen extends StatefulWidget {
  @override
  State<InsertMealScreen> createState() => _InsertMealScreenState();
}

class _InsertMealScreenState extends State<InsertMealScreen> {
  TextEditingController textController = TextEditingController(text: '');

  InsertMealState mealState = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const BottomNavigation(),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: ListView.builder(
                itemCount: mealState.meals.length,
                itemBuilder: (context, index) {
                  var meal = mealState.meals[index] as Meal;
                  return Card(
                    child: Column(
                      children: <Widget>[
                        ListTile(
                          title: Text(
                            meal.title,
                            style: kCardTitleStyle,
                          ),
                          subtitle: Text(
                            meal.calories.toString(),
                            style: kCardSubTitleStyle,
                          ),
                        )
                      ],
                    ),
                    color: Colors.blue,
                  );
                },
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                ElevatedButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return const MealExploler();
                      },
                    );
                  },
                  child: const Text('Search Meal'),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: Text('Save Meal ${mealState.meals.length}'),
                ),
              ],
            ),
            const SizedBox(
              height: 10.0,
            ),
          ],
        ),
      ),
    );
  }
}
