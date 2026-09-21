import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_typography.dart';
import '../../../core/theme/app_border_radius.dart';

final class IncidentsScreen extends StatefulWidget {
  const IncidentsScreen({super.key});

  @override
  State<IncidentsScreen> createState() => _IncidentsScreenState();
}

class _IncidentsScreenState extends State<IncidentsScreen> {
  String selectedCategory = 'Baches';
  final descriptionController = TextEditingController();

  @override
  void dispose() {
    descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(24, 24, 24, 100),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  IconButton(
                    onPressed: () => context.go('/dashboard'),
                    icon: const Icon(Icons.arrow_back_rounded),
                    color: AppColors.primary,
                  ),
                  const SizedBox(width: 8),
                  Text('Reportar incidencia', style: AppTypography.titleLg.copyWith(color: AppColors.primary)),
                ],
              ),
              const SizedBox(height: 20),
              Text('PARTICIPACIÓN CIUDADANA', style: AppTypography.labelSm.copyWith(color: AppColors.tertiary)),
              const SizedBox(height: 4),
              Text('Crea un nuevo reporte', style: AppTypography.displayMd),
              const SizedBox(height: 8),
              Text('Ayúdanos a mejorar nuestra ciudad. Tu reporte será canalizado a la dependencia correspondiente.', style: AppTypography.bodyMd.copyWith(color: AppColors.onSurfaceVariant)),
              const SizedBox(height: 28),
              Text('¿Qué quieres reportar?', style: AppTypography.headlineSm.copyWith(color: AppColors.primary)),
              const SizedBox(height: 16),
              Wrap(
                spacing: 10,
                runSpacing: 10,
                children: [
                  _CategoryTile(label: 'Baches', icon: Icons.construction_rounded, selected: selectedCategory == 'Baches', onTap: () => setState(() => selectedCategory = 'Baches')),
                  _CategoryTile(label: 'Alumbrado', icon: Icons.lightbulb_outline, selected: selectedCategory == 'Alumbrado', onTap: () => setState(() => selectedCategory = 'Alumbrado')),
                  _CategoryTile(label: 'Residuos', icon: Icons.delete_outline, selected: selectedCategory == 'Residuos', onTap: () => setState(() => selectedCategory = 'Residuos')),
                ],
              ),
              const SizedBox(height: 28),
              Text('Descripción del problema', style: AppTypography.headlineSm.copyWith(color: AppColors.primary)),
              const SizedBox(height: 12),
              TextField(
                controller: descriptionController,
                maxLines: 4,
                decoration: const InputDecoration(hintText: 'Describe brevemente lo que está sucediendo...'),
              ),
              const SizedBox(height: 28),
              Row(
                children: [
                  Text('Evidencia fotográfica', style: AppTypography.headlineSm.copyWith(color: AppColors.primary)),
                  const Spacer(),
                  Text('Máximo 3 fotos', style: AppTypography.bodySm.copyWith(color: AppColors.onSurfaceVariant)),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  _PhotoTile(icon: Icons.image_not_supported_rounded),
                  const SizedBox(width: 12),
                  _PhotoTile(icon: Icons.add_a_photo_rounded, label: 'AÑADIR'),
                ],
              ),
              const SizedBox(height: 28),
              Text('Ubicación exacta', style: AppTypography.headlineSm.copyWith(color: AppColors.primary)),
              const SizedBox(height: 12),
              Container(
                height: 180,
                decoration: BoxDecoration(color: AppColors.surfaceContainerHigh, borderRadius: AppBorderRadius.radiusXl),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    const Icon(Icons.map_rounded, size: 64, color: AppColors.outlineVariant),
                    const Icon(Icons.location_on_rounded, size: 40, color: AppColors.tertiary),
                    Positioned(
                      bottom: 12,
                      left: 12,
                      right: 12,
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(color: AppColors.surfaceContainerLowest.withValues(alpha: 0.9), borderRadius: AppBorderRadius.radiusMd),
                        child: const Row(
                          children: [
                            Icon(Icons.my_location_rounded, size: 14, color: AppColors.primary),
                            SizedBox(width: 8),
                    Expanded(child: Text('Diego de Vaca y 24 de Mayo, Zamora', overflow: TextOverflow.ellipsis)),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 28),
              SizedBox(
                width: double.infinity,
                child: FilledButton.icon(
                  onPressed: _submitReport,
                  icon: const Icon(Icons.send_rounded),
                  label: const Text('Enviar reporte'),
                ),
              ),
              const SizedBox(height: 12),
              Center(child: Text('La información se usa solo para canalizar tu solicitud.', textAlign: TextAlign.center, style: AppTypography.bodySm.copyWith(color: AppColors.onSurfaceVariant))),
            ],
          ),
        ),
      ),
    );
  }

  void _submitReport() {
    showDialog<void>(
      context: context,
      builder: (context) => AlertDialog(
        icon: const Icon(Icons.check_circle_outline_rounded, color: AppColors.secondary, size: 42),
        title: const Text('Reporte enviado'),
        content: Text('El GAD Municipal de Zamora recibió tu reporte de $selectedCategory. El número de seguimiento es #ZM-1042.'),
        actions: [
          FilledButton(
            onPressed: () {
              Navigator.of(context).pop();
              context.go('/dashboard');
            },
            child: const Text('Volver al inicio'),
          ),
        ],
      ),
    );
  }
}

class _CategoryTile extends StatelessWidget {
  final String label;
  final IconData icon;
  final bool selected;
  final VoidCallback onTap;

  const _CategoryTile({required this.label, required this.icon, required this.selected, required this.onTap});

  @override
  Widget build(BuildContext context) => InkWell(
        onTap: onTap,
        borderRadius: AppBorderRadius.radiusXl,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          decoration: BoxDecoration(
            color: selected ? AppColors.surfaceContainerLowest : AppColors.surfaceContainerLow,
            borderRadius: AppBorderRadius.radiusXl,
            border: selected ? Border.all(color: AppColors.primary, width: 2) : null,
          ),
          child: Column(
            children: [
              Icon(icon, color: selected ? AppColors.primary : AppColors.onSurfaceVariant, size: 24),
              const SizedBox(height: 8),
              Text(label, style: AppTypography.labelSm.copyWith(color: selected ? AppColors.primary : AppColors.onSurfaceVariant)),
            ],
          ),
        ),
      );
}

class _PhotoTile extends StatelessWidget {
  final IconData icon;
  final String? label;

  const _PhotoTile({required this.icon, this.label});

  @override
  Widget build(BuildContext context) => Container(
        width: 96,
        height: 96,
        decoration: BoxDecoration(
          color: label == null ? AppColors.surfaceContainerHighest : null,
          border: label != null ? Border.all(color: AppColors.outlineVariant, width: 2) : null,
          borderRadius: AppBorderRadius.radiusXl,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: AppColors.outline),
            if (label != null) ...[
              const SizedBox(height: 4),
              Text(label!, style: const TextStyle(fontSize: 10, fontWeight: FontWeight.w700, color: AppColors.outline)),
            ],
          ],
        ),
      );
}
