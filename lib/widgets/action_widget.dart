import 'package:flutter/material.dart';

class ActionWidget extends StatelessWidget {
  Icon icon;
  String actionName;
  ActionWidget({Key? key, required this.icon, required this.actionName})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.blue.shade100,
          ),
          child: Center(child: icon),
        ),
        Text(
          actionName,
          maxLines: 2,
          softWrap: true,
          style: TextStyle(fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
