// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class rowWidget extends StatelessWidget {
  final String title;
  final String data;
  const rowWidget({
    super.key,
    required this.title,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          width: 10,
        ),
        Text(
          data,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
        ),
      ],
    );
  }
}
