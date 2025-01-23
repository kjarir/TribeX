import 'package:flutter/material.dart';

class HabitCell extends StatelessWidget {
  final bool isCompleted;
  final VoidCallback onTap;

  const HabitCell({
    Key? key,
    required this.isCompleted,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          color: isCompleted
              ? Theme.of(context).colorScheme.primary.withOpacity(0.2)
              : Colors.grey[100],
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: isCompleted
                ? Theme.of(context).colorScheme.primary
                : Colors.grey[300]!,
            width: 2,
          ),
        ),
        child: Center(
          child: isCompleted
              ? Icon(
                  Icons.check_circle,
                  color: Theme.of(context).colorScheme.primary,
                  size: 24,
                )
              : null,
        ),
      ),
    );
  }
}
