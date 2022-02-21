import '../../domain/entities/stats.dart';

class StatsMapper {
  Stats to(Map<String, dynamic> map) {
    return Stats(
      baseStat: map['base_stat']?.toInt() ?? 0,
      stat: map['stat']['name'] ?? '',
    );
  }
}
