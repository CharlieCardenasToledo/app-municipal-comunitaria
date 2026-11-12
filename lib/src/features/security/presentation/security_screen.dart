import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_typography.dart';
import '../../../core/theme/app_border_radius.dart';
import '../../../common_widgets/tonal_card.dart';

/// Números nacionales de emergencia de Ecuador.
const _ecu911 = '911';
const _delito = '1800335486'; // 1800-DELITO (Policía Nacional)

final class SecurityScreen extends StatelessWidget {
  const SecurityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(24, 24, 24, 48),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  IconButton(
                    onPressed: () => context.canPop() ? context.pop() : context.go('/dashboard'),
                    icon: const Icon(Icons.arrow_back_rounded),
                    color: AppColors.primary,
                  ),
                  const SizedBox(width: 8),
                  Text('Seguridad ciudadana', style: AppTypography.titleLg.copyWith(color: AppColors.primary)),
                ],
              ),
              const SizedBox(height: 20),
              Text('EMERGENCIAS', style: AppTypography.labelSm.copyWith(color: AppColors.error)),
              const SizedBox(height: 8),
              _CallCard(
                title: 'ECU 911',
                subtitle: 'Emergencias: Policía, ambulancia y bomberos. Gratis, 24 horas.',
                number: _ecu911,
                display: '911',
                color: AppColors.error,
                primary: true,
              ),
              const SizedBox(height: 12),
              _CallCard(
                title: '1800 DELITO',
                subtitle: 'Denuncias y consultas de la Policía Nacional.',
                number: _delito,
                display: '1800 335 486',
                color: AppColors.secondary,
              ),
              const SizedBox(height: 28),
              Text('Reporta una novedad', style: AppTypography.headlineSm.copyWith(color: AppColors.primary)),
              const SizedBox(height: 4),
              Text(
                'No es una emergencia en curso. Avisa al GAD y puedes hacerlo de forma anónima.',
                style: AppTypography.bodySm.copyWith(color: AppColors.onSurfaceVariant),
              ),
              const SizedBox(height: 14),
              Wrap(
                spacing: 10,
                runSpacing: 10,
                children: [
                  _ReportChip(label: 'Persona sospechosa', icon: Icons.visibility_rounded, category: 'Sospechoso'),
                  _ReportChip(label: 'Robo o hurto', icon: Icons.lock_open_rounded, category: 'Robo'),
                  _ReportChip(label: 'Violencia', icon: Icons.front_hand_rounded, category: 'Violencia'),
                  _ReportChip(label: 'Alumbrado inseguro', icon: Icons.lightbulb_rounded, category: 'Alumbrado'),
                ],
              ),
              const SizedBox(height: 28),
              Text('Consejos de prevención', style: AppTypography.headlineSm.copyWith(color: AppColors.primary)),
              const SizedBox(height: 12),
              const _TipTile(icon: Icons.groups_rounded, text: 'Conoce a tus vecinos y acuerden avisarse ante movimientos extraños.'),
              const _TipTile(icon: Icons.phone_android_rounded, text: 'En la calle, evita exhibir el celular y comparte tu ubicación con alguien de confianza.'),
              const _TipTile(icon: Icons.home_rounded, text: 'Antes de salir, verifica puertas y ventanas y deja luces encendidas en el exterior.'),
              const _TipTile(icon: Icons.record_voice_over_rounded, text: 'Si vas a llamar al 911, indica: qué ocurre, dónde estás y cuántas personas hay involucradas.'),
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(color: AppColors.surfaceContainerLow, borderRadius: AppBorderRadius.radiusXl),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Icon(Icons.info_outline_rounded, size: 20, color: AppColors.outline),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        'Esta app no reemplaza al ECU 911. Ante un peligro inmediato, llama siempre al 911.',
                        style: AppTypography.bodySm.copyWith(color: AppColors.onSurfaceVariant),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// Pide confirmación y marca el número, para evitar llamadas accidentales.
Future<void> callEmergency(BuildContext context, {required String name, required String number, required String display}) async {
  final confirmed = await showDialog<bool>(
    context: context,
    builder: (ctx) => AlertDialog(
      icon: const Icon(Icons.phone_in_talk_rounded, color: AppColors.error, size: 36),
      title: Text('¿Llamar a $name?'),
      content: Text('Se abrirá el marcador de tu teléfono con el número $display.'),
      actions: [
        TextButton(onPressed: () => Navigator.of(ctx).pop(false), child: const Text('Cancelar')),
        FilledButton(
          style: FilledButton.styleFrom(backgroundColor: AppColors.error),
          onPressed: () => Navigator.of(ctx).pop(true),
          child: const Text('Llamar'),
        ),
      ],
    ),
  );
  if (confirmed != true || !context.mounted) return;
  final opened = await launchUrl(Uri(scheme: 'tel', path: number));
  if (!opened && context.mounted) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('No se pudo abrir el marcador. Llama manualmente al $display.')),
    );
  }
}

class _CallCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String number;
  final String display;
  final Color color;
  final bool primary;

  const _CallCard({
    required this.title,
    required this.subtitle,
    required this.number,
    required this.display,
    required this.color,
    this.primary = false,
  });

  @override
  Widget build(BuildContext context) {
    return TonalCard(
      padding: const EdgeInsets.all(18),
      color: primary ? AppColors.errorContainer.withValues(alpha: 0.5) : null,
      onTap: () => callEmergency(context, name: title, number: number, display: display),
      child: Row(
        children: [
          Container(
            width: primary ? 56 : 48,
            height: primary ? 56 : 48,
            decoration: BoxDecoration(color: color, shape: BoxShape.circle),
            child: const Icon(Icons.call_rounded, color: Colors.white),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('$title · $display', style: AppTypography.titleMd.copyWith(color: AppColors.onSurface)),
                const SizedBox(height: 2),
                Text(subtitle, style: AppTypography.bodySm.copyWith(color: AppColors.onSurfaceVariant)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ReportChip extends StatelessWidget {
  final String label;
  final IconData icon;
  final String category;

  const _ReportChip({required this.label, required this.icon, required this.category});

  @override
  Widget build(BuildContext context) {
    return ActionChip(
      avatar: Icon(icon, size: 18, color: AppColors.primary),
      label: Text(label),
      onPressed: () => context.push('/incidents?category=$category'),
    );
  }
}

class _TipTile extends StatelessWidget {
  final IconData icon;
  final String text;

  const _TipTile({required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(color: AppColors.primaryFixed, borderRadius: AppBorderRadius.radiusFull),
            child: Icon(icon, size: 18, color: AppColors.primary),
          ),
          const SizedBox(width: 12),
          Expanded(child: Padding(padding: const EdgeInsets.only(top: 6), child: Text(text, style: AppTypography.bodyMd))),
        ],
      ),
    );
  }
}
