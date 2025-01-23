class Habit {
  final String id;
  final String name;
  final String frequency;
  final String icon;
  final List<bool> weekProgress;

  Habit({
    required this.id,
    required this.name,
    required this.frequency,
    required this.icon,
    required this.weekProgress,
  });
}
