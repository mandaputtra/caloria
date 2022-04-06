import 'package:caloria/constants.dart';
import 'package:caloria/utils/http.dart';
import 'package:caloria/utils/utils.dart';
import 'package:flutter/material.dart';

class MealExploler extends StatefulWidget {
  const MealExploler({Key? key}) : super(key: key);

  @override
  State<MealExploler> createState() => _MealExplolerState();
}

class _MealExplolerState extends State<MealExploler> {
  bool _loading = false;
  List<dynamic> _mealItems = [];

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
            return Card(
              color: Colors.blue,
              child: Column(
                children: <Widget>[
                  ListTile(
                    title: Text(
                      title,
                      style: kCardTitleStyle,
                    ),
                    subtitle: Text(
                      '$calorie kkal',
                      style: kCardSubTitleStyle,
                    ),
                  )
                ],
              ),
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
