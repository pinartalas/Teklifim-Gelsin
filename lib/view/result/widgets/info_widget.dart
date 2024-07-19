import 'package:flutter/material.dart';

class CustomExpandedColumn extends StatelessWidget {
  final String text1;
  final String text2;

  const CustomExpandedColumn({
    super.key,
    required this.text1,
    required this.text2,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Text(text1,
              style:
                  const TextStyle(fontSize: 14, fontWeight: FontWeight.w400)),
          Text(text2,
              style:
                  const TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
        ],
      ),
    );
  }
}
