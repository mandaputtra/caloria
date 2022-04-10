import 'package:caloria/utils/utils.dart';
import 'package:caloria/widgets/bottom_navigation.dart';
import 'package:caloria/widgets/card.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String caloriePerWeek = '';
  String calorieToday = '';

  Future<void> getSummary() async {
    var fetchPerWeek = await getAveragePerWeek();
    var fetchToday = await getTodayCalorie();

    setState(() {
      caloriePerWeek = fetchPerWeek;
      calorieToday = fetchToday;
    });
  }

  @override
  void initState() {
    getSummary();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const BottomNavigation(),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Center(
              child: Text(
                'Caloria',
                style: TextStyle(
                    color: Colors.blue,
                    fontSize: 50,
                    fontFamily: 'Satisfy',
                    fontWeight: FontWeight.w600),
              ),
            ),
            ComposableCard(
                cardTitle: 'Average this week', cardValue: caloriePerWeek),
            ComposableCard(cardTitle: 'Today', cardValue: calorieToday),
          ],
        ),
      ),
    );
  }
}
