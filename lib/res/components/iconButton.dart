import 'package:flutter/material.dart';
import 'package:teklifim_gelsin_task/res/components/color.dart';

class ButtonWithIcon extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final IconData icon;
  const ButtonWithIcon(
      {super.key,
      required this.onPressed,
      required this.text,
      required this.icon});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6),
          side: const BorderSide(color: Colors.grey),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: Colors.grey),
          const SizedBox(width: 8),
          Text(
            text,
            style: const TextStyle(
                color: AppColors.blackColor,
                fontSize: 14,
                fontWeight: FontWeight.w400),
          ),
        ],
      ),
    );
  }
}
