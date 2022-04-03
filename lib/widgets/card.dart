import 'package:caloria/constants.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ComposableCard extends StatefulWidget {
  // ignore: use_key_in_widget_constructors
  ComposableCard({this.cardValue = '', required this.cardTitle});

  String cardValue;
  final String cardTitle;

  @override
  State<ComposableCard> createState() => _ComposableCardState();
}

class _ComposableCardState extends State<ComposableCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Card(
        margin: const EdgeInsets.all(5),
        color: Colors.blue,
        elevation: 1,
        child: Padding(
          padding:
              const EdgeInsets.only(top: 15, left: 10, right: 10, bottom: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                widget.cardTitle,
                style: kCardTitleStyle,
              ),
              const SizedBox(height: 10),
              Text(widget.cardValue, style: kCardSubTitleStyle),
            ],
          ),
        ),
      ),
    );
  }
}
