import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_typography.dart';
import '../../../core/theme/app_border_radius.dart';
import '../../../common_widgets/glass_chip.dart';
import '../../../common_widgets/tonal_card.dart';
import '../../../common_widgets/zamora_remote_image.dart';

final class DashboardScreen extends ConsumerWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(24, 24, 24, 100),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildAppBar(context),
              const SizedBox(height: 32),
              _buildWelcomeSection(context),
              const SizedBox(height: 20),
              _buildEmergencyAlert(context),
              const SizedBox(height: 28),
              _buildQuickAccessGrid(context),
              const SizedBox(height: 32),
              _buildNewsSection(context),
              const SizedBox(height: 32),
              _buildWeatherCard(context),
            ],
          ),
        ),
      ),
    );
  }

  // ─── Top App Bar ──────────────────────────────────────────
  Widget _buildAppBar(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            borderRadius: AppBorderRadius.radiusFull,
            border: Border.all(color: AppColors.primaryFixedDim, width: 2),
          ),
          child: ClipRRect(
            borderRadius: AppBorderRadius.radiusFull,
            child: Container(
              color: AppColors.surfaceContainerHigh,
              child: const Icon(Icons.person_rounded, color: AppColors.primary),
            ),
          ),
        ),
        const SizedBox(width: 12),
        Text(
          'Zamora Conecta',
          style: AppTypography.titleLg.copyWith(
            color: AppColors.primary,
          ),
        ),
        const Spacer(),
        IconButton(
          onPressed: () => context.push('/schedules'),
          icon: const Icon(Icons.notifications_outlined),
          color: AppColors.primary,
        ),
      ],
    );
  }

  // ─── Welcome Section ──────────────────────────────────────
  Widget _buildWelcomeSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'DASHBOARD CIUDADANO',
          style: AppTypography.labelSm.copyWith(
            color: AppColors.primary,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          'Hola, vecina/o',
          style: AppTypography.displayMd,
        ),
        const SizedBox(height: 4),
        Text(
          'Consulta servicios, actividades y novedades de tu cantón.',
          style: AppTypography.bodyMd.copyWith(
            color: AppColors.onSurfaceVariant,
          ),
        ),
      ],
    );
  }

  // ─── Emergency Alert ──────────────────────────────────────
  Widget _buildEmergencyAlert(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.errorContainer.withValues(alpha: 0.4),
        borderRadius: AppBorderRadius.radiusXl,
        border: const Border(
          left: BorderSide(color: AppColors.error, width: 4),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: AppColors.error,
              borderRadius: AppBorderRadius.radiusFull,
            ),
            child: const Icon(
              Icons.warning_rounded,
              color: AppColors.onError,
              size: 20,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Aviso municipal',
                  style: AppTypography.titleSm.copyWith(
                    color: AppColors.onErrorContainer,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Consulta horarios y alertas del GAD Municipal de Zamora para tu sector.',
                  style: AppTypography.bodySm.copyWith(
                    color: AppColors.onErrorContainer.withValues(alpha: 0.9),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ─── Quick Access Bento Grid ─────────────────────────────
  Widget _buildQuickAccessGrid(BuildContext context) {
    final items = [
      ('Reportar\nIncidente', Icons.campaign_rounded, AppColors.primary, '/incidents'),
      ('Marketplace', Icons.storefront_rounded, AppColors.secondary, '/marketplace'),
      ('Rutas de\nresiduos', Icons.delete_rounded, AppColors.tertiary, '/maps'),
      ('Eventos', Icons.calendar_today_rounded, AppColors.primaryContainer, '/events'),
    ];

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: 1.0,
      ),
      itemCount: items.length,
      itemBuilder: (context, index) {
        final (label, icon, color, path) = items[index];
        return _QuickAccessTile(
          label: label,
          icon: icon,
          color: color,
          onTap: () => context.go(path),
        );
      },
    );
  }

  // ─── News Section ──────────────────────────────────────────
  Widget _buildNewsSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              'Novedades de Zamora',
              style: AppTypography.headlineSm,
            ),
            const Spacer(),
            TextButton(
              onPressed: () => context.go('/events'),
              child: Text(
                'Ver todas',
                style: AppTypography.labelMd.copyWith(
                  color: AppColors.tertiary,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        _NewsCard(
          title: 'La Amazonía celebra la identidad',
          description:
              'El Festival de la Chonta y el Ayampaco reunió gastronomía, tradición y orgullo amazónico.',
          chipLabel: 'Cultura local',
          chipColor: AppColors.tertiaryContainer,
          chipTextColor: AppColors.onTertiaryContainer,
          timeAgo: '06 jun 2026 · Agenda Cultural Nacional',
          imageUrl: 'https://images.unsplash.com/photo-1473448912268-2022ce9509d8?auto=format&fit=crop&w=1200&q=85',
          source: 'Agenda Cultural Nacional',
        ),
        const SizedBox(height: 16),
        _NewsCard(
          title: 'La Casa de la Cultura conmemora 45 años',
          description:
              'El núcleo provincial presentó su informe de gestión y nuevos acuerdos de cooperación cultural.',
          chipLabel: 'Actualidad',
          chipColor: AppColors.secondaryContainer,
          chipTextColor: AppColors.onSecondaryContainer,
          timeAgo: '15 sep 2026 · InfoZamora',
          imageUrl: 'https://images.unsplash.com/photo-1531058020387-3be344556be6?auto=format&fit=crop&w=1200&q=85',
          source: 'InfoZamora',
        ),
        const SizedBox(height: 16),
        _NewsCard(
          title: 'Café y desarrollo en Zamora Chinchipe',
          description:
              'Una mirada a la producción local y a las historias que conectan a productores con nuevos mercados.',
          chipLabel: 'Producción',
          chipColor: AppColors.primaryContainer,
          chipTextColor: AppColors.onPrimaryContainer,
          timeAgo: '20 sep 2026 · Chinchipe Hoy',
          imageUrl: 'https://images.unsplash.com/photo-1495474472287-4d71bcdd2085?auto=format&fit=crop&w=1200&q=85',
          source: 'Chinchipe Hoy',
        ),
      ],
    );
  }

  // ─── Weather Card ──────────────────────────────────────────
  Widget _buildWeatherCard(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        borderRadius: AppBorderRadius.radiusXl,
        gradient: const LinearGradient(
          colors: [AppColors.primary, AppColors.primaryContainer],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.primary.withValues(alpha: 0.1),
            blurRadius: 24,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'ZAMORA · AMAZONÍA SUR',
                  style: AppTypography.labelSm.copyWith(
                    color: AppColors.onPrimary.withValues(alpha: 0.8),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Clima tropical lluvioso',
                  style: AppTypography.displaySm.copyWith(
                    color: AppColors.onPrimary,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Revisa las condiciones antes de visitar cascadas y balnearios.',
                  style: AppTypography.bodySm.copyWith(
                    color: AppColors.onPrimary.withValues(alpha: 0.8),
                  ),
                ),
              ],
            ),
          ),
          Column(
            children: [
              const Icon(
                Icons.light_mode_rounded,
                color: AppColors.onPrimary,
                size: 48,
              ),
              const SizedBox(height: 8),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                decoration: BoxDecoration(
                  borderRadius: AppBorderRadius.radiusFull,
                  border: Border.all(
                    color: AppColors.onPrimary.withValues(alpha: 0.3),
                  ),
                ),
                child: Text(
                  'Ver servicios',
                  style: AppTypography.buttonText.copyWith(
                    color: AppColors.onPrimary,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// ─── Quick Access Tile ──────────────────────────────────────
class _QuickAccessTile extends StatelessWidget {
  final String label;
  final IconData icon;
  final Color color;
  final VoidCallback onTap;

  const _QuickAccessTile({
    required this.label,
    required this.icon,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return TonalCard(
      onTap: onTap,
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: color.withValues(alpha: 0.1),
              borderRadius: AppBorderRadius.radiusFull,
            ),
            child: Icon(icon, color: color, size: 28),
          ),
          const SizedBox(height: 12),
          Text(
            label,
            textAlign: TextAlign.center,
            style: AppTypography.titleSm.copyWith(
              color: AppColors.onSurface,
            ),
          ),
        ],
      ),
    );
  }
}

// ─── News Card ──────────────────────────────────────────────
class _NewsCard extends StatelessWidget {
  final String title;
  final String description;
  final String chipLabel;
  final Color chipColor;
  final Color chipTextColor;
  final String timeAgo;
  final String imageUrl;
  final String source;

  const _NewsCard({
    required this.title,
    required this.description,
    required this.chipLabel,
    required this.chipColor,
    required this.chipTextColor,
    required this.timeAgo,
    required this.imageUrl,
    required this.source,
  });

  @override
  Widget build(BuildContext context) {
    return TonalCard(
      padding: EdgeInsets.zero,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ZamoraRemoteImage(
            url: imageUrl,
            height: 156,
            width: double.infinity,
            borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GlassChip(
                  label: chipLabel,
                  backgroundColor: chipColor,
                  textColor: chipTextColor,
                ),
                const SizedBox(height: 12),
                Text(title, style: AppTypography.titleLg),
                const SizedBox(height: 8),
                Text(
                  description,
                  style: AppTypography.bodyMd.copyWith(color: AppColors.onSurfaceVariant),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    const Icon(Icons.schedule_rounded, size: 14, color: AppColors.outline),
                    const SizedBox(width: 6),
                    Expanded(
                      child: Text(timeAgo, style: AppTypography.bodySm.copyWith(color: AppColors.outline)),
                    ),
                  ],
                ),
                const SizedBox(height: 6),
                Text('Fuente: $source', style: AppTypography.labelSm.copyWith(color: AppColors.primary)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
