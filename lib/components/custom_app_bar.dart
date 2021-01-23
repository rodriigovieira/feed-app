import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  final String title;
  final Size preferredSize;

  CustomAppBar({Key key, @required this.title})
      : preferredSize = Size.fromHeight(kToolbarHeight),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      actions: [
        IconButton(
          icon: new Image.asset("assets/ic_menu.png"),
          onPressed: () {
            Scaffold.of(context).openEndDrawer();
          },
        ),
      ],
      title: Text(
        "$title",
        style: TextStyle(color: Color(0xff4A90E2)),
      ),
      centerTitle: true,
      backgroundColor: Colors.white,
      elevation: 0,
    );
  }
}
