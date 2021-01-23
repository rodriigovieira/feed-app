import 'package:flutter/material.dart';

class SectionHeader extends StatelessWidget {
  final String label;

  const SectionHeader({
    Key key,
    @required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 8,
        ),
        child: Text(
          "$label",
          style: TextStyle(
            color: Colors.white,
            fontFamily: "Helvetica",
            fontSize: 14,
          ),
        ),
      ),
      color: Colors.blue[700],
    );
  }
}
