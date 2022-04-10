import 'package:caloria/constants.dart';
import 'package:caloria/types/shared.dart';
import 'package:caloria/utils/utils.dart';
import 'package:caloria/widgets/bottom_navigation.dart';
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
        itemBuilder: (context, index) {
          var meal = listMeals[index];
          return Card(
            color: Colors.blue,
            margin:
                const EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        DateFormat(pattern).format(meal.date),
                        style: kCardTitleStyle,
                      ),
                      Text(
                        getTotalMealPerDay(meal.meals),
                        style: kCardTitleStyle,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
