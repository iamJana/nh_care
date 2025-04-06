import 'package:flutter/material.dart';

class SectionWidget extends StatelessWidget {
  final Icon icon;
  final String name;

  const SectionWidget({Key? key, required this.icon, required this.name})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width / 3 - 20;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: EdgeInsets.all(12),
          height: width,
          width: width,
          decoration: BoxDecoration(
            color: Colors.blue.shade100,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                name,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              icon,
            ],
          ),
        ),
        SizedBox(height: 8),
      ],
    );
  }
}
