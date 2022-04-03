import 'package:caloria/widgets/bottom_navigation.dart';
import 'package:caloria/widgets/card.dart';
import 'package:flutter/material.dart';

// ignore: use_key_in_widget_constructors
class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigation(),
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
                cardTitle: 'Average this week', cardValue: '2.000 kkal'),
            ComposableCard(cardTitle: 'Today', cardValue: '2.000 kkal'),
          ],
        ),
      ),
    );
  }
}
