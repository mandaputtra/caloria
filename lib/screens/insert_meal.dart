import 'package:caloria/constants.dart';
import 'package:caloria/widgets/bottom_navigation.dart';
import 'package:caloria/widgets/meal_explorer.dart';
import 'package:flutter/material.dart';

// ignore: use_key_in_widget_constructors
class InsertMealScreen extends StatefulWidget {
  @override
  State<InsertMealScreen> createState() => _InsertMealScreenState();
}

class _InsertMealScreenState extends State<InsertMealScreen> {
  TextEditingController textController = TextEditingController(text: '');

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
                itemCount: 100,
                itemBuilder: (context, index) {
                  return Card(
                    child: Column(
                      children: <Widget>[
                        ListTile(
                          title: Text(
                            'Tempe x $index',
                            style: kCardTitleStyle,
                          ),
                          subtitle: const Text(
                            '200kkal',
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
