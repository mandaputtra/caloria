import 'package:caloria/widgets/bottom_navigation.dart';
import 'package:flutter/material.dart';

class InsertMealScreen extends StatelessWidget {
  const InsertMealScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigation(),
    );
  }
}
