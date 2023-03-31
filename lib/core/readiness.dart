import 'package:flutter/material.dart';

class ReadinessOption {
  final String value;
  final IconData icon;

  const ReadinessOption({required this.value, required this.icon});
}

enum Readiness {
  inbox,
  anytime,
  waiting,
  sometime,
}

extension ReadinessExtension on Readiness {
  ReadinessOption get option {
    switch (this) {
      case Readiness.inbox:
        return const ReadinessOption(value: 'inbox', icon: Icons.inbox);
      case Readiness.anytime:
        return const ReadinessOption(value: 'anytime', icon: Icons.access_time);
      case Readiness.waiting:
        return const ReadinessOption(value: 'waiting', icon: Icons.timer);
      case Readiness.sometime:
        return const ReadinessOption(
            value: 'sometime', icon: Icons.calendar_today);
    }
  }

  String get stringValue => option.value;
  IconData get icon => option.icon;

  static Readiness fromString(String value) {
    switch (value) {
      case 'anytime':
        return Readiness.anytime;
      case 'waiting':
        return Readiness.waiting;
      case 'sometime':
        return Readiness.sometime;
      case 'inbox':
      default:
        return Readiness.inbox;
    }
  }
}
