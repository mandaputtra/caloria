import 'package:caloria/utils/http.dart';
import 'package:caloria/utils/utils.dart';
import 'package:flutter/material.dart';

class MealExploler extends StatefulWidget {
  const MealExploler({Key? key}) : super(key: key);

  @override
  State<MealExploler> createState() => _MealExplolerState();
}

class _MealExplolerState extends State<MealExploler> {
  final HttpSearchMeal _http = HttpSearchMeal();
  final _debouncer = Debouncer(
    delay: const Duration(milliseconds: 800),
  );

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
                _debouncer.run(() {
                  _http.getMealData(textSearch).then((meals) {
                    print(meals);
                  });
                });
              },
              decoration: const InputDecoration(
                label: Text('Search here'),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Yes'),
            )
          ],
        ),
      ),
    );
  }
}
