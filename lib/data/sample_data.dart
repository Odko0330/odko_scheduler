import 'package:flutter/material.dart';

import '../models/dashboard_item.dart';

const todayTasks = [
  DashboardTask(title: 'Review lecture notes', detail: 'Biology · Chapter 04', time: '9:30 AM', important: true),
  DashboardTask(title: 'Finish project outline', detail: 'Design project', time: '11:00 AM'),
  DashboardTask(title: 'Read 20 pages', detail: 'Deep Work · Chapter 2', time: '4:00 PM'),
];

const upcomingDeadlines = [
  DashboardDeadline(title: 'Research paper draft', course: 'Psychology 101', due: 'Tomorrow', color: Color(0xFFE8B86D)),
  DashboardDeadline(title: 'Problem set 06', course: 'Calculus II', due: 'In 3 days', color: Color(0xFF8FA9D1)),
];

const upcomingEvents = [
  DashboardEvent(title: 'Study group', detail: 'Library · Room 204', time: '2:30 PM', icon: Icons.groups_2_outlined, color: Color(0xFFE9E3F4)),
  DashboardEvent(title: 'Project check-in', detail: 'Design team · Online', time: '5:00 PM', icon: Icons.video_camera_front_outlined, color: Color(0xFFDCEBE6)),
];
