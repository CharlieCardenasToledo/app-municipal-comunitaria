import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_typography.dart';
import '../../../core/theme/app_border_radius.dart';
import '../../../common_widgets/search_bar_widget.dart';
import '../../../common_widgets/gradient_button.dart';
import '../../../common_widgets/glass_chip.dart';
import '../../../common_widgets/zamora_remote_image.dart';

final class MarketplaceScreen extends ConsumerWidget {
  const MarketplaceScreen({super.key});

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
        Text('Comercio de Zamora', style: AppTypography.displayMd),
              const SizedBox(height: 8),
              Text(
          'Encuentra productos, ferias y emprendimientos del cantón Zamora.',
                style: AppTypography.bodyMd.copyWith(
                  color: AppColors.onSurfaceVariant,
                ),
              ),
              const SizedBox(height: 20),
              const SearchBarWidget(hintText: 'Buscar negocios o productos...'),
              const SizedBox(height: 28),
              _buildCategories(context),
              const SizedBox(height: 28),
              _buildBusinessGrid(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAppBar(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 40, height: 40,
          decoration: BoxDecoration(
            borderRadius: AppBorderRadius.radiusFull,
            border: Border.all(color: AppColors.primaryContainer, width: 2),
          ),
          child: ClipRRect(
            borderRadius: AppBorderRadius.radiusFull,
            child: Container(
              color: AppColors.primaryFixed,
              child: const Icon(Icons.person_rounded, color: AppColors.primary),
            ),
          ),
        ),
        const SizedBox(width: 12),
        Text('Zamora Conecta', style: AppTypography.titleLg.copyWith(color: AppColors.primary)),
        const Spacer(),
        IconButton(
          onPressed: () => context.push('/schedules'),
          icon: const Icon(Icons.notifications_outlined),
          color: AppColors.primary,
        ),
      ],
    );
  }

  Widget _buildCategories(BuildContext context) {
    final categories = [
      ('Productos locales', Icons.shopping_basket_rounded),
      ('Feria libre', Icons.storefront_rounded),
      ('Artesanías', Icons.palette_rounded),
      ('Servicios', Icons.more_horiz_rounded),
    ];
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: categories.map((c) {
          return Padding(
            padding: const EdgeInsets.only(right: 12),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              decoration: BoxDecoration(
                color: c.$1 == 'Productos locales'
                    ? AppColors.secondaryContainer
                    : AppColors.surfaceContainerHigh,
                borderRadius: AppBorderRadius.radiusFull,
              ),
              child: Row(
                children: [
                  Icon(c.$2, size: 18, color: c.$1 == 'Productos locales' ? AppColors.onSecondaryContainer : AppColors.onSurface),
                  const SizedBox(width: 8),
                  Text(c.$1, style: AppTypography.labelMd.copyWith(
                    color: c.$1 == 'Productos locales' ? AppColors.onSecondaryContainer : AppColors.onSurface,
                  )),
                ],
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildBusinessGrid(BuildContext context) {
    return Column(
      children: [
        _BusinessCard(
          title: 'Mercado Reina del Cisne',
          category: 'Productos locales',
          rating: '4.8',
          distance: 'Centro de Zamora • mercado municipal',
          imageUrl: 'https://images.unsplash.com/photo-1488459716781-31db52582fe9?auto=format&fit=crop&w=1200&q=85',
          onTap: () => context.push('/marketplace/panaderia'),
        ),
        const SizedBox(height: 16),
        _BusinessCard(
          title: 'Feria Libre de Zamora',
          category: 'Agricultura',
          rating: '4.5',
          distance: 'Cantón Zamora • productores locales',
          imageUrl: 'https://images.unsplash.com/photo-1464226184884-fa280b87c399?auto=format&fit=crop&w=1200&q=85',
          onTap: () => context.push('/marketplace/ferreteria'),
        ),
        const SizedBox(height: 16),
        _BusinessCard(
          title: 'Emprendimientos de Zamora',
          category: 'Artesanías',
          rating: '4.9',
          distance: 'Zamora • productos y servicios locales',
          imageUrl: 'https://images.unsplash.com/photo-1494438639946-1ebd1d20bf85?auto=format&fit=crop&w=1200&q=85',
          onTap: () => context.push('/marketplace/farmacia'),
        ),
      ],
    );
  }
}

class _BusinessCard extends StatelessWidget {
  final String title;
  final String category;
  final String rating;
  final String distance;
  final String imageUrl;
  final VoidCallback onTap;

  const _BusinessCard({
    required this.title,
    required this.category,
    required this.rating,
    required this.distance,
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
                  top: 12, left: 12,
                  child: GlassChip(label: category),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(title, style: AppTypography.titleLg),
                    Row(
                      children: [
                        const Icon(Icons.star_rounded, size: 16, color: AppColors.secondary),
                        const SizedBox(width: 4),
                        Text(rating, style: AppTypography.titleSm.copyWith(color: AppColors.secondary)),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    const Icon(Icons.location_on_rounded, size: 14, color: AppColors.onSurfaceVariant),
                    const SizedBox(width: 4),
                    Text(distance, style: AppTypography.bodySm.copyWith(color: AppColors.onSurfaceVariant)),
                  ],
                ),
                const SizedBox(height: 16),
                GradientButton(
                  label: 'Ver Catálogo',
                  onPressed: onTap,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
