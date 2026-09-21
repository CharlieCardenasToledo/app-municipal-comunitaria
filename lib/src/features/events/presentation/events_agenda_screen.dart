import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_typography.dart';
import '../../../core/theme/app_border_radius.dart';
import '../../../common_widgets/search_bar_widget.dart';
import '../../../common_widgets/zamora_remote_image.dart';

final class EventsAgendaScreen extends ConsumerWidget {
  const EventsAgendaScreen({super.key});

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
              const SizedBox(height: 24),
              RichText(
                text: TextSpan(
                  style: AppTypography.displayMd,
                  children: [
                    const TextSpan(text: 'Zamora '),
                    TextSpan(
                      text: 'Vive',
                      style: TextStyle(color: AppColors.primaryContainer),
                    ),
                    const TextSpan(text: ' & participa'),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              const SearchBarWidget(hintText: 'Buscar eventos, talleres o festivales...'),
              const SizedBox(height: 20),
              _buildFilters(context),
              const SizedBox(height: 28),
              _buildFeaturedEvent(context),
              const SizedBox(height: 28),
              _buildEventGrid(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAppBar(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () => context.push('/my-events'),
          icon: const Icon(Icons.menu_rounded),
          color: AppColors.onSurface,
        ),
        const SizedBox(width: 8),
         Text('Agenda de Zamora', style: AppTypography.titleLg),
        const Spacer(),
        Container(
          width: 36, height: 36,
          decoration: BoxDecoration(
            borderRadius: AppBorderRadius.radiusFull,
            border: Border.all(color: AppColors.outlineVariant),
          ),
          child: ClipRRect(
            borderRadius: AppBorderRadius.radiusFull,
            child: Container(color: AppColors.surfaceContainerHigh),
          ),
        ),
      ],
    );
  }

  Widget _buildFilters(BuildContext context) {
    final filters = ['Todos', 'Cultura', 'Deporte', 'Ambiente', 'Comercio'];
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: filters.map((f) {
          final selected = f == 'Todos';
          return Padding(
            padding: const EdgeInsets.only(right: 8),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              decoration: BoxDecoration(
                color: selected ? AppColors.primary : AppColors.surfaceContainerLow,
                borderRadius: AppBorderRadius.radiusFull,
              ),
              child: Text(
                f,
                style: AppTypography.labelMd.copyWith(
                  color: selected ? AppColors.onPrimary : AppColors.onSurfaceVariant,
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildFeaturedEvent(BuildContext context) {
    return Container(
      height: 400,
      decoration: BoxDecoration(
        borderRadius: AppBorderRadius.radiusXxl,
        color: AppColors.inverseSurface,
      ),
      child: Stack(
        alignment: Alignment.bottomLeft,
        children: [
          const ZamoraRemoteImage(
            url: 'https://images.unsplash.com/photo-1492684223066-81342ee5ff30?auto=format&fit=crop&w=1400&q=85',
            width: double.infinity,
            height: 400,
            borderRadius: BorderRadius.all(Radius.circular(28)),
          ),
          Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(28)),
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.transparent, Colors.black87],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                  decoration: BoxDecoration(
                    color: AppColors.tertiaryContainer.withValues(alpha: 0.8),
                    borderRadius: AppBorderRadius.radiusFull,
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(Icons.star_rounded, size: 14, color: AppColors.onTertiaryContainer),
                      const SizedBox(width: 4),
                       Text('AGENDA DESTACADA', style: AppTypography.overline.copyWith(color: AppColors.onTertiaryContainer)),
                    ],
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                   'Agenda cultural\ny turística',
                  style: AppTypography.displaySm.copyWith(color: AppColors.surfaceContainerLowest),
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    const Icon(Icons.calendar_today_rounded, size: 16, color: AppColors.primaryFixed),
                    const SizedBox(width: 6),
                     Text('Fecha por confirmar', style: AppTypography.bodySm.copyWith(color: AppColors.surfaceContainerLowest.withValues(alpha: 0.9))),
                    const SizedBox(width: 16),
                    const Icon(Icons.location_on_rounded, size: 16, color: AppColors.primaryFixed),
                    const SizedBox(width: 6),
                     Text('Malecón de Zamora', style: AppTypography.bodySm.copyWith(color: AppColors.surfaceContainerLowest.withValues(alpha: 0.9))),
                  ],
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () => context.push('/events/festival'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryContainer,
                    foregroundColor: AppColors.onPrimary,
                    shape: RoundedRectangleBorder(borderRadius: AppBorderRadius.radiusFull),
                    padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 14),
                  ),
                  child: const Text('Ver detalle'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEventGrid(BuildContext context) {
    return Column(
      children: [
        _EventCard(
          title: 'Cuidado de parques y jardines',
          category: 'Ambiente',
          date: 'Por confirmar',
          month: '',
          imageUrl: 'https://images.unsplash.com/photo-1558904541-efa843a96f01?auto=format&fit=crop&w=1200&q=85',
          onTap: () => context.push('/events/planting'),
        ),
        const SizedBox(height: 16),
        _EventCard(
          title: 'Activación deportiva comunitaria',
          category: 'Deporte',
          date: 'Por confirmar',
          month: '',
          imageUrl: 'https://images.unsplash.com/photo-1517836357463-d25dfeac3438?auto=format&fit=crop&w=1200&q=85',
          onTap: () => context.push('/events/run'),
        ),
        const SizedBox(height: 16),
        _EventCard(
          title: 'Feria de emprendimientos locales',
          category: 'Comercio',
          date: 'Por confirmar',
          month: '',
          imageUrl: 'https://images.unsplash.com/photo-1488459716781-31db52582fe9?auto=format&fit=crop&w=1200&q=85',
          onTap: () => context.push('/events/gallery'),
        ),
      ],
    );
  }
}

class _EventCard extends StatelessWidget {
  final String title;
  final String category;
  final String date;
  final String month;
  final String imageUrl;
  final VoidCallback onTap;

  const _EventCard({
    required this.title,
    required this.category,
    required this.date,
    required this.month,
    required this.imageUrl,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.surfaceContainerLowest,
        borderRadius: AppBorderRadius.radiusXl,
        boxShadow: [
          BoxShadow(
            color: AppColors.onSurface.withValues(alpha: 0.04),
            blurRadius: 32,
            spreadRadius: -4,
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        borderRadius: AppBorderRadius.radiusXl,
        child: InkWell(
          borderRadius: AppBorderRadius.radiusXl,
          onTap: onTap,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 180,
                decoration: BoxDecoration(
                  color: AppColors.surfaceContainerHigh,
                  borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
                ),
                child: Stack(
                  children: [
                    ZamoraRemoteImage(
                      url: imageUrl,
                      width: double.infinity,
                      height: 180,
                      borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
                    ),
                    Positioned(
                      top: 12, right: 12,
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                        decoration: BoxDecoration(
                          color: AppColors.surfaceContainerLowest.withValues(alpha: 0.9),
                          borderRadius: AppBorderRadius.radiusLg,
                        ),
                        child: Column(
                          children: [
                          Text(date, style: AppTypography.titleLg.copyWith(color: AppColors.primary)),
                            if (month.isNotEmpty)
                              Text(month.toUpperCase(), style: AppTypography.overline.copyWith(color: AppColors.onSurfaceVariant)),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                          decoration: BoxDecoration(
                            color: AppColors.secondaryContainer,
                            borderRadius: AppBorderRadius.radiusSm,
                          ),
                          child: Text(category.toUpperCase(), style: AppTypography.overline.copyWith(color: AppColors.onSecondaryContainer)),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Text(title, style: AppTypography.titleMd),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        const Icon(Icons.place_rounded, size: 14, color: AppColors.outline),
                        const SizedBox(width: 4),
                        Text('Zamora · lugar por confirmar', style: AppTypography.bodySm.copyWith(color: AppColors.outline)),
                        const Spacer(),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                          decoration: BoxDecoration(
                            border: Border.all(color: AppColors.outlineVariant),
                            borderRadius: AppBorderRadius.radiusFull,
                          ),
                          child: Text('Interested', style: AppTypography.labelSm.copyWith(color: AppColors.primary)),
                        ),
                      ],
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
