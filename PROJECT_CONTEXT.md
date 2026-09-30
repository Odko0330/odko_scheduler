# Nova Project Context

## Project goal

Nova is a personal life, study, and productivity assistant, built with Flutter. The long-term direction includes bringing tasks, deadlines, meetings, and events into one place.

## Development preferences

- Keep the project understandable for someone learning Flutter.
- Prefer a simple structure and avoid unnecessary dependencies.
- Build iPhone support first; keep the app straightforward to extend.
- Use sample data until real V1 features are implemented.

## Current stage

**Nova V1 UI foundation.** A responsive dashboard shell has been created with sample tasks, deadlines, and events. It has a bottom navigation bar and an Ask Nova presentation. Navigation destinations beyond Home and the Ask Nova prompt are placeholders. There is no backend, persistence, or AI integration yet.

## Current project structure

- `lib/main.dart` — app entry point, theme, and root widget.
- `lib/screens/home_screen.dart` — home dashboard layout and local UI interactions.
- `lib/data/sample_data.dart` — mock dashboard content.
- `lib/models/dashboard_item.dart` — small data classes for dashboard content.
- `lib/widgets/dashboard_sections.dart` — reusable dashboard cards and rows.

Flutter platform scaffolding was generated for iOS, Android, and web. No additional Dart package dependencies were added.
