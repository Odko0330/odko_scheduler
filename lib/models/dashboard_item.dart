import 'package:flutter/material.dart';

class DashboardTask {
  const DashboardTask({
    required this.title,
    required this.detail,
    required this.time,
    this.important = false,
  });

  final String title;
  final String detail;
  final String time;
  final bool important;
}

class DashboardDeadline {
  const DashboardDeadline({
    required this.title,
    required this.course,
    required this.due,
    required this.color,
  });

  final String title;
  final String course;
  final String due;
  final Color color;
}

class DashboardEvent {
  const DashboardEvent({
    required this.title,
    required this.detail,
    required this.time,
    required this.icon,
    required this.color,
  });

  final String title;
  final String detail;
  final String time;
  final IconData icon;
  final Color color;
}
