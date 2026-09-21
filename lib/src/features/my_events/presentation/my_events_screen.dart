import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_typography.dart';

final class MyEventsScreen extends StatelessWidget {
  const MyEventsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Mis eventos')),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(24, 8, 24, 32),
        children: [
          Text('Tu agenda ciudadana', style: AppTypography.headlineMd),
          const SizedBox(height: 8),
          Text('Aquí aparecerán los eventos que guardes.', style: AppTypography.bodyMd.copyWith(color: AppColors.onSurfaceVariant)),
          const SizedBox(height: 20),
          Card(
            child: ListTile(
              contentPadding: const EdgeInsets.all(16),
              leading: const CircleAvatar(
                backgroundColor: AppColors.primaryFixed,
                child: Icon(Icons.music_note_rounded, color: AppColors.primary),
              ),
              title: Text('Agenda cultural y turística de Zamora', style: AppTypography.titleMd),
              subtitle: const Text('Malecón de Zamora · fecha por confirmar'),
              trailing: IconButton(
                tooltip: 'Abrir detalle',
                onPressed: () => context.push('/events/festival'),
                icon: const Icon(Icons.chevron_right_rounded),
              ),
            ),
          ),
          const SizedBox(height: 24),
          OutlinedButton.icon(
            onPressed: () => context.go('/events'),
            icon: const Icon(Icons.calendar_month_outlined),
            label: const Text('Explorar eventos'),
          ),
        ],
      ),
    );
  }
}
