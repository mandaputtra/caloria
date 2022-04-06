import 'package:flutter/material.dart';
import 'package:timelines/timelines.dart';

enum _TimelineStatus {
  done,
  sync,
  inProgress,
  todo,
}

class _EmptyContents extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 10.0),
      height: 10.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(2.0),
        color: const Color(0xffe6e7e9),
      ),
    );
  }
}

const kTileHeight = 50.0;

class TimelineWidget extends StatelessWidget {
  const TimelineWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const data = _TimelineStatus.values;

    return Flexible(
      child: Timeline.tileBuilder(
        theme: TimelineThemeData(
          nodePosition: 0,
          connectorTheme: const ConnectorThemeData(
            thickness: 3.0,
            color: Color(0xffd3d3d3),
          ),
          indicatorTheme: const IndicatorThemeData(
            size: 15.0,
          ),
        ),
        padding: const EdgeInsets.symmetric(vertical: 20.0),
        builder: TimelineTileBuilder.connected(
          contentsBuilder: (_, __) => _EmptyContents(),
          connectorBuilder: (_, index, __) {
            if (index == 0) {
              return const SolidLineConnector(color: Color(0xff6ad192));
            } else {
              return const SolidLineConnector();
            }
          },
          indicatorBuilder: (_, index) {
            switch (data[index]) {
              case _TimelineStatus.done:
                return const DotIndicator(
                  color: Color(0xff6ad192),
                  child: Icon(
                    Icons.check,
                    color: Colors.white,
                    size: 10.0,
                  ),
                );
              case _TimelineStatus.sync:
                return const DotIndicator(
                  color: Color(0xff193fcc),
                  child: Icon(
                    Icons.sync,
                    size: 10.0,
                    color: Colors.white,
                  ),
                );
              case _TimelineStatus.inProgress:
                return const OutlinedDotIndicator(
                  color: Color(0xffa7842a),
                  borderWidth: 2.0,
                  backgroundColor: Color(0xffebcb62),
                );
              case _TimelineStatus.todo:
              default:
                return const OutlinedDotIndicator(
                  color: Color(0xffbabdc0),
                  backgroundColor: Color(0xffe6e7e9),
                );
            }
          },
          itemExtentBuilder: (_, __) => kTileHeight,
          itemCount: data.length,
        ),
      ),
    );
  }
}
