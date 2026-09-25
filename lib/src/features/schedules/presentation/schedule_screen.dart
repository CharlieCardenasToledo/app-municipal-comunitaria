import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_typography.dart';

final class ScheduleScreen extends StatelessWidget {
  const ScheduleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Horarios y alertas'),
        actions: [
          IconButton(
            tooltip: 'Configurar alertas',
            onPressed: () => context.push('/alert-settings'),
            icon: const Icon(Icons.notifications_active_outlined),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(24, 8, 24, 32),
        children: [
          Text('Servicios de Zamora', style: AppTypography.headlineMd),
          const SizedBox(height: 8),
          Text('Consulta información municipal y activa un recordatorio para tu sector.', style: AppTypography.bodyMd.copyWith(color: AppColors.onSurfaceVariant)),
          const SizedBox(height: 20),
          _ScheduleCard(
            icon: Icons.delete_outline_rounded,
            color: AppColors.secondary,
            title: 'Recolección de residuos',
            next: 'Consulta por sector',
            detail: 'Servicio municipal de manejo de desechos sólidos.',
          ),
          const SizedBox(height: 12),
          _ScheduleCard(
            icon: Icons.recycling_rounded,
            color: AppColors.primary,
            title: 'Reciclaje',
            next: 'Información actualizada',
            detail: 'Recuerda separar papel, plástico y vidrio.',
          ),
          const SizedBox(height: 12),
          _ScheduleCard(
            icon: Icons.water_drop_outlined,
            color: AppColors.tertiary,
            title: 'Mantenimiento de agua',
            next: 'Consulta por sector',
            detail: 'El Municipio gestiona agua potable y saneamiento ambiental.',
          ),
          const SizedBox(height: 24),
          Text('Atención municipal', style: AppTypography.headlineSm),
          const SizedBox(height: 12),
          Card(
            child: ListTile(
              contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              leading: const CircleAvatar(
                backgroundColor: AppColors.primaryFixed,
                child: Icon(Icons.account_balance_rounded, color: AppColors.primary),
              ),
              title: const Text('GAD Municipal de Zamora'),
              subtitle: const Text('Diego de Vaca y 24 de Mayo\n08:00–12:30 · 14:00–17:30\n07 2605 316 · info@zamora.gob.ec'),
              isThreeLine: true,
            ),
          ),
          const SizedBox(height: 24),
          FilledButton.icon(
            onPressed: () => context.push('/maps'),
            icon: const Icon(Icons.map_outlined),
            label: const Text('Ver rutas en el mapa'),
          ),
        ],
      ),
    );
  }
}

class _ScheduleCard extends StatelessWidget {
  final IconData icon;
  final Color color;
  final String title;
  final String next;
  final String detail;

  const _ScheduleCard({required this.icon, required this.color, required this.title, required this.next, required this.detail});

  @override
  Widget build(BuildContext context) => Card(
        child: ListTile(
          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          leading: CircleAvatar(backgroundColor: color.withValues(alpha: 0.12), child: Icon(icon, color: color)),
          title: Text(title, style: AppTypography.titleMd),
          subtitle: Text('$next\n$detail'),
          isThreeLine: true,
        ),
      );
}
