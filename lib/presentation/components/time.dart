// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:game2048/presentation/misc/theme/theme.dart';

class Time extends StatelessWidget {
  const Time({
    super.key,
    required this.label,
    required this.time,
    this.padding,
  });

  final String label;
  final int time;
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          padding ??
          const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      decoration: BoxDecoration(
        color: ThemeConstants.darkBrown,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        children: [
          Text(
            label.toUpperCase(),
            style: const TextStyle(fontSize: 18.0, color: ThemeConstants.tan),
          ),
          Text(
            '${time ~/ 60}:${(time % 60).toString().padLeft(2, '0')}',
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 18.0,
            ),
          ),
        ],
      ),
    );
  }
}
