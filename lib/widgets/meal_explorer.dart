import 'package:caloria/constants.dart';
import 'package:caloria/controllers/insert_meal.dart';
import 'package:caloria/types/shared.dart';
import 'package:caloria/utils/http.dart';
import 'package:caloria/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';

class MealExploler extends StatefulWidget {
  const MealExploler({Key? key}) : super(key: key);

  @override
  State<MealExploler> createState() => _MealExplolerState();
}

class _MealExplolerState extends State<MealExploler> {
  bool _loading = false;
  List<dynamic> _mealItems = [];

  final InsertMealState mealState = Get.find();

  final _debouncer = Debouncer(
    delay: const Duration(milliseconds: 800),
  );

  Widget showLoading() {
    if (_loading) {
      return const CircularProgressIndicator(color: Colors.red);
    } else {
      // ignore: prefer_is_empty
      return Expanded(
        child: ListView.builder(
          itemCount: _mealItems.length,
          itemBuilder: (context, index) {
            final int calorie = _mealItems[index]['calories'];
            final String title = _mealItems[index]['title'];
            return Column(
              children: <Widget>[
                ElevatedButton(
                  onPressed: () {
                    var meal = Meal(title: title, count: 1, calories: calorie);
                    mealState.addMeal(meal);
                    Navigator.of(context).pop();
                  },
                  child: ListTile(
                    title: Text(
                      title,
                      style: kCardTitleStyle,
                    ),
                    subtitle: Text(
                      '$calorie kkal',
                      style: kCardSubTitleStyle,
                    ),
                  ),
                ),
                const SizedBox(height: 5)
              ],
            );
          },
        ),
      );
    }
  }

  @override
  void dispose() {
    _debouncer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      elevation: 0.6,
      backgroundColor: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: <Widget>[
            TextField(
              onChanged: (String textSearch) {
                _debouncer.run(() async {
                  setState(() {
                    _loading = true;
                  });
                  var meals = await getMealData(textSearch);
                  setState(() {
                    _mealItems = meals;
                    _loading = false;
                  });
                  var pr = await getAllDayMeals();
                  print(pr.listMeals.toString());
                });
              },
              decoration: const InputDecoration(
                label: Text('Search here'),
              ),
            ),
            showLoading(),
          ],
        ),
      ),
    );
  }
}
