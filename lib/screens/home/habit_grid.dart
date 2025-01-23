import 'package:flutter/material.dart';
import '../../widgets/habit_cell.dart';

class HabitGrid extends StatefulWidget {
  const HabitGrid({Key? key}) : super(key: key);

  @override
  State<HabitGrid> createState() => _HabitGridState();
}

class _HabitGridState extends State<HabitGrid> {
  final List<String> _habits = [
    'Morning Workout',
    'Read 30 mins',
    'Meditate',
    'Drink Water',
    'Study 2 hours',
    'Walk 10k steps',
    'Sleep 8 hours',
  ];

  final List<DateTime> _dates = List.generate(
    7,
    (index) => DateTime.now().subtract(Duration(days: 6 - index)),
  );

  Map<String, Map<DateTime, bool>> _habitCompletionStatus = {};

  @override
  void initState() {
    super.initState();
    for (var habit in _habits) {
      _habitCompletionStatus[habit] = {};
      for (var date in _dates) {
        _habitCompletionStatus[habit]![date] = false;
      }
    }
  }

  void _toggleHabit(String habit, DateTime date) {
    setState(() {
      _habitCompletionStatus[habit]![date] = !(_habitCompletionStatus[habit]![date] ?? false);
    });
    // TODO: Update aura points
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Habit Tracker',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 16),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  SizedBox(
                    width: 120,
                    child: Text(
                      'Habits',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ),
                  ...List.generate(
                    _dates.length,
                    (index) => SizedBox(
                      width: 60,
                      child: Text(
                        '${_dates[index].day}/${_dates[index].month}',
                        style: Theme.of(context).textTheme.titleSmall,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: _habits.map((habit) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 120,
                            child: Text(
                              habit,
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ),
                          ...List.generate(
                            _dates.length,
                            (index) => SizedBox(
                              width: 60,
                              child: HabitCell(
                                isCompleted: _habitCompletionStatus[habit]![_dates[index]] ?? false,
                                onTap: () => _toggleHabit(habit, _dates[index]),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
