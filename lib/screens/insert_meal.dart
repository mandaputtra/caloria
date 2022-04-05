import 'package:caloria/widgets/bottom_navigation.dart';
import 'package:flutter/material.dart';

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
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Card(
                    child: Column(
                      children: const <Widget>[
                        ListTile(
                          title: Text('Tempe x 1'),
                          subtitle: Text('200kkal'),
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
                  onPressed: () {},
                  child: const Text('Search Meal'),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: const Text('Add Meal'),
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
