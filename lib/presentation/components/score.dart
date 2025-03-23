import 'package:flutter/material.dart';
import 'package:game2048/presentation/misc/theme/theme.dart';

class Score extends StatelessWidget {
  const Score({
    super.key,
    required this.label,
    required this.score,
    this.padding,
  });

  final String label;
  final String score;
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
            score,
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
