import 'package:caloria/constants.dart';
import 'package:caloria/controllers/insert_meal.dart';
import 'package:caloria/widgets/bottom_navigation.dart';
import 'package:caloria/widgets/button.dart';
import 'package:caloria/widgets/meal_explorer.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';

// ignore: use_key_in_widget_constructors
class InsertMealScreen extends StatefulWidget {
  @override
  State<InsertMealScreen> createState() => _InsertMealScreenState();
}

class _InsertMealScreenState extends State<InsertMealScreen> {
  TextEditingController textController = TextEditingController(text: '');

  final InsertMealState mealState = Get.put(InsertMealState());

  @override
  void initState() {
    mealState.addMeal(Meal(title: 'Tempe', count: 1, calories: 200));
    mealState.addMeal(Meal(title: 'Tempe2', count: 1, calories: 200));
    mealState.addMeal(Meal(title: 'Tempe3', count: 1, calories: 200));
    mealState.addMeal(Meal(title: 'Tempe4', count: 1, calories: 200));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const BottomNavigation(),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: Obx(
                () => GridView.builder(
                  itemCount: mealState.meals.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: 1,
                    crossAxisCount: 2,
                  ),
                  itemBuilder: (context, index) {
                    var meal = mealState.meals[index] as Meal;
                    return Card(
                      color: Colors.blue,
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Text(
                              '${meal.title} x ${meal.count}',
                              style: kCardTitleStyle,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.baseline,
                              textBaseline: TextBaseline.alphabetic,
                              children: <Widget>[
                                Text(
                                  '${meal.calories}',
                                  style: kMealCardCalories,
                                ),
                                const Text(
                                  'kkal',
                                  style: kMealCardKkal,
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                RoundIconButton(
                                  icon: Icons.remove,
                                  onPressed: () {},
                                ),
                                RoundIconButton(
                                  icon: Icons.add,
                                  onPressed: () {},
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
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
                  child: const Text('Save Meal'),
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
