import 'dart:async';

import 'package:flutter/material.dart';

class CustomLoadingIndicator extends StatefulWidget {
  const CustomLoadingIndicator({
    Key key,
  }) : super(key: key);

  @override
  _CustomLoadingIndicatorState createState() => _CustomLoadingIndicatorState();
}

class _CustomLoadingIndicatorState extends State<CustomLoadingIndicator> {
  List<Color> color = [Colors.grey[700], Colors.grey, Colors.grey];
  Timer timer;

  @override
  void initState() {
    super.initState();

    animateLoadingIndicator();
  }

  void animateLoadingIndicator() {
    int counter = 0;
    const Duration half = Duration(milliseconds: 500);

    Timer.periodic(half, (Timer t) {
      timer = t;

      setState(() {
        color[counter] = Colors.grey;
      });

      if (counter == 2)
        counter = 0;
      else
        counter += 1;

      setState(() {
        color[counter] = Colors.grey[800];
      });
    });
  }

  @override
  void dispose() {
    if (timer != null) {
      timer.cancel();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      decoration: BoxDecoration(
        color: Colors.black12,
        border: Border(
          top: BorderSide(color: Colors.black45, width: .2),
          bottom: BorderSide(color: Colors.black45, width: .2),
        ),
      ),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DotIndicator(color: color[0]),
            DotIndicator(color: color[1]),
            DotIndicator(color: color[2]),
          ],
        ),
      ),
    );
  }
}

class DotIndicator extends StatelessWidget {
  const DotIndicator({
    Key key,
    @required this.color,
  }) : super(key: key);

  final Color color;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 400),
      margin: EdgeInsets.symmetric(horizontal: 3),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: color,
      ),
      height: 12,
      width: 12,
    );
  }
}
