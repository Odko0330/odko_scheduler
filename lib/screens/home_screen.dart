import 'package:flutter/material.dart';

import '../data/sample_data.dart';
import '../widgets/dashboard_sections.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedTab = 0;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final horizontalPadding = width > 700 ? 48.0 : 22.0;
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 900),
            child: CustomScrollView(
              slivers: [
                SliverPadding(
                  padding: EdgeInsets.fromLTRB(horizontalPadding, 18, horizontalPadding, 28),
                  sliver: SliverList.list(children: [
                    _TopBar(onProfileTap: () => _showMessage('Your profile is coming soon.')),
                    const SizedBox(height: 30),
                    const _Greeting(),
                    const SizedBox(height: 24),
                    ImportantTasksCard(count: todayTasks.where((task) => task.important).length),
                    const SizedBox(height: 32),
                    SectionHeading(title: "Today's tasks", action: 'See all', onTap: () => setState(() => selectedTab = 1)),
                    const SizedBox(height: 14),
                    ...todayTasks.map((task) => Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: TaskTile(task: task),
                        )),
                    const SizedBox(height: 24),
                    SectionHeading(title: 'Upcoming deadlines', action: 'View all', onTap: () => setState(() => selectedTab = 2)),
                    const SizedBox(height: 14),
                    ...upcomingDeadlines.map((deadline) => Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: DeadlineTile(deadline: deadline),
                        )),
                    const SizedBox(height: 24),
                    const SectionHeading(title: 'Coming up today'),
                    const SizedBox(height: 14),
                    ...upcomingEvents.map((event) => Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: EventTile(event: event),
                        )),
                    const SizedBox(height: 22),
                    AskNovaButton(onPressed: _showAskNova),
                    const SizedBox(height: 8),
                  ]),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: selectedTab,
        onDestinationSelected: (index) {
          setState(() => selectedTab = index);
          if (index != 0) _showMessage('${['Home', 'Tasks', 'Calendar', 'AI'][index]} is coming soon.');
        },
        backgroundColor: Colors.white,
        indicatorColor: const Color(0xFFE6F0EC),
        height: 72,
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home_outlined), selectedIcon: Icon(Icons.home_rounded), label: 'Home'),
          NavigationDestination(icon: Icon(Icons.check_circle_outline_rounded), label: 'Tasks'),
          NavigationDestination(icon: Icon(Icons.calendar_month_outlined), label: 'Calendar'),
          NavigationDestination(icon: Icon(Icons.auto_awesome_outlined), label: 'AI'),
        ],
      ),
    );
  }

  void _showMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message), behavior: SnackBarBehavior.floating));
  }

  void _showAskNova() {
    showModalBottomSheet<void>(
      context: context,
      showDragHandle: true,
      backgroundColor: const Color(0xFFF7F7F4),
      builder: (context) => Padding(
        padding: const EdgeInsets.fromLTRB(24, 12, 24, 34),
        child: Column(mainAxisSize: MainAxisSize.min, crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text('Ask Nova', style: Theme.of(context).textTheme.titleLarge?.copyWith(fontSize: 22)),
          const SizedBox(height: 8),
          const Text('Your AI assistant will be available in a future version.', style: TextStyle(color: Color(0xFF777D82))),
          const SizedBox(height: 18),
          TextField(
            enabled: false,
            decoration: InputDecoration(
              hintText: 'Ask about your day…',
              filled: true,
              fillColor: Colors.white,
              suffixIcon: const Icon(Icons.arrow_upward_rounded),
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(18), borderSide: BorderSide.none),
            ),
          ),
        ]),
      ),
    );
  }
}

class _TopBar extends StatelessWidget {
  const _TopBar({required this.onProfileTap});
  final VoidCallback onProfileTap;

  @override
  Widget build(BuildContext context) => Row(children: [
        Container(
          width: 36,
          height: 36,
          decoration: BoxDecoration(color: const Color(0xFF367D73), borderRadius: BorderRadius.circular(12)),
          child: const Icon(Icons.auto_awesome_rounded, color: Colors.white, size: 21),
        ),
        const SizedBox(width: 9),
        const Text('nova', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700, letterSpacing: -0.8)),
        const Spacer(),
        IconButton(
          onPressed: onProfileTap,
          icon: const Icon(Icons.account_circle_outlined, size: 27),
          color: const Color(0xFF777D82),
          tooltip: 'Profile',
        ),
      ]);
}

class _Greeting extends StatelessWidget {
  const _Greeting();

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    const weekdays = ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday'];
    const months = ['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December'];
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text('Good evening 👋', style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontSize: 30)),
      const SizedBox(height: 7),
      Text('${weekdays[now.weekday - 1]}, ${months[now.month - 1]} ${now.day}', style: const TextStyle(color: Color(0xFF858A8D), fontSize: 14)),
    ]);
  }
}
