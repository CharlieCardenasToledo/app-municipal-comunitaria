import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../common_widgets/clay_icon.dart';
import '../../../common_widgets/tonal_card.dart';
import '../../../common_widgets/zamora_remote_image.dart';
import '../../../core/theme/app_border_radius.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_typography.dart';

final class TourismScreen extends StatelessWidget {
  const TourismScreen({super.key});

  static const _places = <_TourismPlace>[
    _TourismPlace(
      title: 'Parque Nacional Podocarpus',
      category: 'Naturaleza y biodiversidad',
      description: 'Bosques nublados, senderos y un refugio para observar aves y especies endémicas.',
      activity: 'Senderismo · fotografía · aviturismo',
      imageUrl: 'https://images.unsplash.com/photo-1441974231531-c6227db76b6e?auto=format&fit=crop&w=1200&q=85',
      asset: ClayAssets.toucan,
    ),
    _TourismPlace(
      title: 'Río Bombuscaro',
      category: 'Agua y descanso',
      description: 'Aguas claras y riberas verdes para conectar con el paisaje amazónico.',
      activity: 'Naturaleza · observación de aves',
      imageUrl: 'https://images.unsplash.com/photo-1437482078695-73f5ca6c96e2?auto=format&fit=crop&w=1200&q=85',
      asset: ClayAssets.rain,
    ),
    _TourismPlace(
      title: 'Cascada Velo de Novia',
      category: 'Aventura cercana',
      description: 'Una caída de agua rodeada de vegetación tropical para disfrutar con respeto al entorno.',
      activity: 'Caminata · fotografía · baño recreativo',
      imageUrl: 'https://images.unsplash.com/photo-1432405972618-c60b0225b8f9?auto=format&fit=crop&w=1200&q=85',
      asset: ClayAssets.rain,
    ),
    _TourismPlace(
      title: 'Malecón y ciudad',
      category: 'Cultura local',
      description: 'Un recorrido para conocer la vida de Zamora, su río, gastronomía y espacios de encuentro.',
      activity: 'Paseo · gastronomía · cultura',
      imageUrl: 'https://images.unsplash.com/photo-1517457373958-b7bdd4587205?auto=format&fit=crop&w=1200&q=85',
      asset: ClayAssets.artesania,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.fromLTRB(24, 20, 24, 36),
          children: [
            _buildHeader(context),
            const SizedBox(height: 20),
            _buildHero(context),
            const SizedBox(height: 28),
            Text('Rutas para descubrir', style: AppTypography.headlineSm),
            const SizedBox(height: 12),
            ..._places.map((place) => Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: _PlaceCard(place: place),
                )),
            const SizedBox(height: 8),
            _buildGuideCard(context),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Row(
      children: [
        IconButton(
          tooltip: 'Volver al inicio',
          onPressed: () => context.go('/dashboard'),
          icon: const Icon(Icons.arrow_back_rounded),
          color: AppColors.primary,
        ),
        const SizedBox(width: 4),
        Text('Turismo en Zamora', style: AppTypography.titleLg.copyWith(color: AppColors.primary)),
        const Spacer(),
        const ClayIcon(asset: ClayAssets.toucan, size: 42),
      ],
    );
  }

  Widget _buildHero(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: AppBorderRadius.radiusXxl,
        boxShadow: [
          BoxShadow(color: AppColors.primary.withValues(alpha: 0.22), blurRadius: 24, offset: const Offset(0, 10)),
        ],
      ),
      clipBehavior: Clip.antiAlias,
      child: Stack(
        children: [
          Positioned.fill(
            child: Opacity(
              opacity: 0.28,
              child: ZamoraRemoteImage(
                url: 'https://images.unsplash.com/photo-1511497584788-876760111969?auto=format&fit=crop&w=1200&q=85',
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Tierra de aves y cascadas', style: AppTypography.labelMd.copyWith(color: AppColors.primaryFixed)),
                const SizedBox(height: 8),
                Text('Zamora se descubre caminando', style: AppTypography.displaySm.copyWith(color: AppColors.onPrimary)),
                const SizedBox(height: 10),
                Text(
                  'Naturaleza, cultura y sabores locales en una sola guía para tu próxima salida.',
                  style: AppTypography.bodyMd.copyWith(color: AppColors.onPrimary.withValues(alpha: 0.88)),
                ),
                const SizedBox(height: 18),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: const [
                    _HeroTag(label: 'Podocarpus'),
                    _HeroTag(label: 'Aviturismo'),
                    _HeroTag(label: 'Cascadas'),
                  ],
                ),
                const SizedBox(height: 20),
                OutlinedButton.icon(
                  onPressed: () => context.push('/tourism/guide'),
                  style: OutlinedButton.styleFrom(
                    foregroundColor: AppColors.onPrimary,
                    side: BorderSide(color: AppColors.onPrimary.withValues(alpha: 0.55)),
                  ),
                  icon: const Icon(Icons.menu_book_rounded, size: 18),
                  label: const Text('Cómo usar Mi Zamora'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildGuideCard(BuildContext context) {
    return TonalCard(
      color: AppColors.secondaryContainer.withValues(alpha: 0.72),
      onTap: () => context.push('/tourism/guide'),
      child: Row(
        children: [
          const ClayIcon(asset: ClayAssets.toucan, size: 52),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Guía rápida para la ciudadanía', style: AppTypography.titleSm),
                const SizedBox(height: 4),
                Text('Aprende a encontrar lugares, planificar una salida y compartir un reporte.', style: AppTypography.bodySm.copyWith(color: AppColors.onSurfaceVariant)),
              ],
            ),
          ),
          const Icon(Icons.chevron_right_rounded, color: AppColors.secondary),
        ],
      ),
    );
  }
}

final class _PlaceCard extends StatelessWidget {
  final _TourismPlace place;

  const _PlaceCard({required this.place});

  @override
  Widget build(BuildContext context) {
    return TonalCard(
      padding: EdgeInsets.zero,
      onTap: () => _showPlaceDetails(context),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 156,
            width: double.infinity,
            child: Stack(
              fit: StackFit.expand,
              children: [
                ZamoraRemoteImage(
                  url: place.imageUrl,
                  borderRadius: const BorderRadius.vertical(top: Radius.circular(AppBorderRadius.xl)),
                ),
                Positioned(
                  top: 12,
                  left: 12,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                    decoration: BoxDecoration(color: AppColors.surfaceContainerLowest.withValues(alpha: 0.88), borderRadius: AppBorderRadius.radiusFull),
                    child: Text(place.category, style: AppTypography.labelSm.copyWith(color: AppColors.primary)),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 14, 16, 16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClayIcon(asset: place.asset, size: 46),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(place.title, style: AppTypography.titleMd),
                      const SizedBox(height: 4),
                      Text(place.description, style: AppTypography.bodySm.copyWith(color: AppColors.onSurfaceVariant)),
                      const SizedBox(height: 8),
                      Text(place.activity, style: AppTypography.labelSm.copyWith(color: AppColors.primary)),
                    ],
                  ),
                ),
                const Icon(Icons.chevron_right_rounded, color: AppColors.outline),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _showPlaceDetails(BuildContext context) {
    showModalBottomSheet<void>(
      context: context,
      showDragHandle: true,
      builder: (context) => Padding(
        padding: const EdgeInsets.fromLTRB(24, 4, 24, 28),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(children: [ClayIcon(asset: place.asset, size: 56), const SizedBox(width: 12), Expanded(child: Text(place.title, style: AppTypography.headlineSm))]),
            const SizedBox(height: 14),
            Text(place.description, style: AppTypography.bodyLg),
            const SizedBox(height: 8),
            Text(place.activity, style: AppTypography.labelMd.copyWith(color: AppColors.primary)),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: FilledButton.icon(
                onPressed: () {
                  Navigator.of(context).pop();
                  context.push('/maps');
                },
                icon: const Icon(Icons.map_outlined),
                label: const Text('Abrir mapa de Zamora'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _HeroTag extends StatelessWidget {
  final String label;

  const _HeroTag({required this.label});

  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
        decoration: BoxDecoration(color: AppColors.onPrimary.withValues(alpha: 0.14), borderRadius: AppBorderRadius.radiusFull),
        child: Text(label, style: AppTypography.labelSm.copyWith(color: AppColors.onPrimary)),
      );
}

class _TourismPlace {
  final String title;
  final String category;
  final String description;
  final String activity;
  final String imageUrl;
  final String asset;

  const _TourismPlace({required this.title, required this.category, required this.description, required this.activity, required this.imageUrl, required this.asset});
}
