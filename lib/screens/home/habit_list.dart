import 'package:flutter/material.dart';
import '../../models/habit.dart';

class HabitList extends StatefulWidget {
  const HabitList({super.key});

  @override
  State<HabitList> createState() => _HabitListState();
}

class _HabitListState extends State<HabitList> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final List<String> _weekDays = ['Fri', 'Sat', 'Sun', 'Mon', 'Tue', 'Wed', 'Thu'];
  
  final List<Habit> _habits = [
    Habit(
      id: '1',
      name: 'Morning Workout',
      frequency: 'Daily',
      icon: '🏃',
      weekProgress: List.generate(7, (index) => index < 3),
    ),
    Habit(
      id: '2',
      name: 'Read for 30 minutes',
      frequency: 'Mon - Tue - Wed - Thu - Fri',
      icon: '📚',
      weekProgress: List.generate(7, (index) => index < 2),
    ),
    Habit(
      id: '3',
      name: 'Meditate Daily',
      frequency: 'Every 2 days',
      icon: '🧘',
      weekProgress: List.generate(7, (index) => index % 2 == 0),
    ),
    Habit(
      id: '4',
      name: 'Drink 8 Glasses of Water',
      frequency: 'Daily',
      icon: '💧',
      weekProgress: List.generate(7, (index) => index < 4),
    ),
    Habit(
      id: '5',
      name: 'Practice a New Language',
      frequency: 'Daily',
      icon: '🗣️',
      weekProgress: List.generate(7, (index) => index < 3),
    ),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Habit List'),
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: 'Active habits'),
            Tab(text: 'Archived habits'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildActiveHabits(),
          const Center(child: Text('No archived habits yet')),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.calendar_today),
              label: const Text('Today'),
            ),
            TextButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.list),
              label: const Text('Habits'),
              style: TextButton.styleFrom(
                foregroundColor: Theme.of(context).colorScheme.primary,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActiveHabits() {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        // Week days row
        Row(
          children: [
            const SizedBox(width: 48), // Space for icon
            ...List.generate(7, (index) {
              return Expanded(
                child: Center(
                  child: Text(
                    _weekDays[index],
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ),
              );
            }),
            const SizedBox(width: 32), // Space for menu
          ],
        ),
        const SizedBox(height: 16),
        // Habits list
        ...List.generate(_habits.length, (index) {
          final habit = _habits[index];
          return _buildHabitItem(habit);
        }),
      ],
    );
  }

  Widget _buildHabitItem(Habit habit) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              SizedBox(
                width: 48,
                child: Text(
                  habit.icon,
                  style: const TextStyle(fontSize: 24),
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      habit.name,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    Text(
                      habit.frequency,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: Theme.of(context).colorScheme.primary,
                          ),
                    ),
                  ],
                ),
              ),
              IconButton(
                icon: const Icon(Icons.more_vert),
                onPressed: () {},
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              const SizedBox(width: 48),
              ...List.generate(7, (index) {
                final isCompleted = habit.weekProgress[index];
                return Expanded(
                  child: Center(
                    child: Container(
                      width: 32,
                      height: 32,
                      margin: const EdgeInsets.symmetric(horizontal: 2),
                      decoration: BoxDecoration(
                        color: isCompleted
                            ? Theme.of(context).colorScheme.primary.withOpacity(0.2)
                            : Colors.grey.withOpacity(0.1),
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: isCompleted
                              ? Theme.of(context).colorScheme.primary
                              : Colors.grey.withOpacity(0.3),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          (index + 2).toString(),
                          style: TextStyle(
                            color: isCompleted
                                ? Theme.of(context).colorScheme.primary
                                : Colors.grey,
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              }),
              const SizedBox(width: 32),
            ],
          ),
          Container(
            height: 2,
            margin: const EdgeInsets.only(left: 48, right: 32, top: 8),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary.withOpacity(0.2),
              borderRadius: BorderRadius.circular(1),
            ),
          ),
        ],
      ),
    );
  }
}
