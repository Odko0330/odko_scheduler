import 'package:flutter/material.dart';

import '../models/dashboard_item.dart';

class SectionHeading extends StatelessWidget {
  const SectionHeading({required this.title, this.action, this.onTap, super.key});

  final String title;
  final String? action;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) => Row(children: [
        Expanded(child: Text(title, style: Theme.of(context).textTheme.titleLarge?.copyWith(fontSize: 18))),
        if (action != null)
          TextButton(
            onPressed: onTap,
            style: TextButton.styleFrom(foregroundColor: const Color(0xFF367D73), padding: EdgeInsets.zero),
            child: Text(action!, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 13)),
          ),
      ]);
}

class ImportantTasksCard extends StatelessWidget {
  const ImportantTasksCard({required this.count, super.key});
  final int count;

  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          gradient: const LinearGradient(colors: [Color(0xFF367D73), Color(0xFF28675E)], begin: Alignment.topLeft, end: Alignment.bottomRight),
          borderRadius: BorderRadius.circular(22),
          boxShadow: [BoxShadow(color: const Color(0xFF367D73).withValues(alpha: 0.18), blurRadius: 20, offset: const Offset(0, 8))],
        ),
        child: Row(children: [
          Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const Text('A little focus goes a long way', style: TextStyle(color: Colors.white70, fontSize: 13)),
            const SizedBox(height: 7),
            Text('$count important ${count == 1 ? 'task' : 'tasks'} today', style: const TextStyle(color: Colors.white, fontSize: 21, fontWeight: FontWeight.w700, letterSpacing: -0.4)),
          ])),
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(color: Colors.white.withValues(alpha: 0.14), shape: BoxShape.circle),
            child: const Icon(Icons.flag_rounded, color: Color(0xFFFFD58A), size: 23),
          ),
        ]),
      );
}

class TaskTile extends StatelessWidget {
  const TaskTile({required this.task, super.key});
  final DashboardTask task;

  @override
  Widget build(BuildContext context) => _SurfaceCard(
        child: Row(children: [
          Container(
            width: 23,
            height: 23,
            decoration: BoxDecoration(border: Border.all(color: const Color(0xFFD6DAD7), width: 1.5), shape: BoxShape.circle),
          ),
          const SizedBox(width: 13),
          Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(task.title, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
            const SizedBox(height: 4),
            Text(task.detail, style: const TextStyle(fontSize: 12, color: Color(0xFF858A8D))),
          ])),
          if (task.important) ...[
            const Icon(Icons.flag_rounded, size: 15, color: Color(0xFFD89C47)),
            const SizedBox(width: 5),
          ],
          Text(task.time, style: const TextStyle(fontSize: 11, color: Color(0xFF858A8D))),
        ]),
      );
}

class DeadlineTile extends StatelessWidget {
  const DeadlineTile({required this.deadline, super.key});
  final DashboardDeadline deadline;

  @override
  Widget build(BuildContext context) => _SurfaceCard(
        child: Row(children: [
          Container(width: 4, height: 42, decoration: BoxDecoration(color: deadline.color, borderRadius: BorderRadius.circular(4))),
          const SizedBox(width: 12),
          Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(deadline.title, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
            const SizedBox(height: 4),
            Text(deadline.course, style: const TextStyle(fontSize: 12, color: Color(0xFF858A8D))),
          ])),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
            decoration: BoxDecoration(color: const Color(0xFFF5F1E8), borderRadius: BorderRadius.circular(9)),
            child: Text(deadline.due, style: const TextStyle(fontSize: 11, color: Color(0xFF916C32), fontWeight: FontWeight.w600)),
          ),
        ]),
      );
}

class EventTile extends StatelessWidget {
  const EventTile({required this.event, super.key});
  final DashboardEvent event;

  @override
  Widget build(BuildContext context) => _SurfaceCard(
        child: Row(children: [
          Container(
            width: 42,
            height: 42,
            decoration: BoxDecoration(color: event.color, borderRadius: BorderRadius.circular(14)),
            child: Icon(event.icon, color: const Color(0xFF535968), size: 21),
          ),
          const SizedBox(width: 12),
          Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(event.title, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
            const SizedBox(height: 4),
            Text(event.detail, style: const TextStyle(fontSize: 12, color: Color(0xFF858A8D))),
          ])),
          Text(event.time, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: Color(0xFF646A6E))),
        ]),
      );
}

class AskNovaButton extends StatelessWidget {
  const AskNovaButton({required this.onPressed, super.key});
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) => SizedBox(
        height: 58,
        child: FilledButton.icon(
          onPressed: onPressed,
          style: FilledButton.styleFrom(
            backgroundColor: const Color(0xFF20252B),
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
          ),
          icon: const Icon(Icons.auto_awesome_rounded, size: 19),
          label: const Text('Ask Nova', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15)),
        ),
      );
}

class _SurfaceCard extends StatelessWidget {
  const _SurfaceCard({required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 14),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(17),
          border: Border.all(color: const Color(0xFFF0F0EC)),
        ),
        child: child,
      );
}
