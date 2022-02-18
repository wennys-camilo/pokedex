class Stats {
  final int baseStat;
  final String stat;
  Stats({
    required this.baseStat,
    required this.stat,
  });

  factory Stats.fromMap(Map<String, dynamic> map) {
    return Stats(
      baseStat: map['base_stat']?.toInt() ?? 0,
      stat: map['stat']['name'] ?? '',
    );
  }

  @override
  String toString() => 'Stats(baseStat: $baseStat, stat: $stat)';
}
