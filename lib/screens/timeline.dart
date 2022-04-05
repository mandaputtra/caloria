import 'package:caloria/constants.dart';
import 'package:caloria/widgets/bottom_navigation.dart';
// import 'package:caloria/widgets/timeline.dart';
import 'package:flutter/material.dart';

class TimelineScreen extends StatelessWidget {
  const TimelineScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const BottomNavigation(),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
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
                    children: const <Widget>[
                      Text(
                        '28 February 2021',
                        style: kCardTitleStyle,
                      ),
                      Text(
                        '2000 kkal',
                        style: kCardTitleStyle,
                      ),
                    ],
                  ),
                  // TODO: Solve errors on implementing widget
                  // const Expanded(
                  //   child: TimelineWidget(),
                  // ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
