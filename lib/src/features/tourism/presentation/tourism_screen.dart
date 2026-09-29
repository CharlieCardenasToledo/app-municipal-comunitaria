import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../common_widgets/clay_icon.dart';
import '../../../common_widgets/tonal_card.dart';
import '../../../common_widgets/zamora_remote_image.dart';
import '../../../core/theme/app_border_radius.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_typography.dart';

final class TourismScreen extends StatefulWidget {
  const TourismScreen({super.key});

  @override
  State<TourismScreen> createState() => _TourismScreenState();
}

final class _TourismScreenState extends State<TourismScreen> {
  static const _allCategory = 'Todos';
  String _selectedCategory = _allCategory;

  static const _places = <_TourismPlace>[
    _TourismPlace(title: 'Parque Nacional Podocarpus', category: 'Naturaleza', description: 'Un bosque protegido para caminar, observar aves y descubrir la biodiversidad andino-amazónica.', activity: 'Senderismo · fotografía · aviturismo', assetPath: 'assets/images/tourism/podocarpus.jpg', asset: ClayAssets.toucan),
    _TourismPlace(title: 'Río Bombuscaro', category: 'Agua y cascadas', description: 'Un recorrido de agua y selva, ideal para conectar con el paisaje y observar aves en la mañana.', activity: 'Naturaleza · observación de aves · baño recreativo', assetPath: 'assets/images/tourism/bombuscaro.jpg', asset: ClayAssets.rain),
    _TourismPlace(title: 'Cascada Velo de Novia', category: 'Agua y cascadas', description: 'Una caída de agua de 60 metros con mirador y vegetación tropical en la vía hacia Loja.', activity: 'Caminata · mirador · fotografía', assetPath: 'assets/images/tourism/velo-de-novia.jpg', asset: ClayAssets.rain),
    _TourismPlace(title: 'Cascada La Chismosa', category: 'Agua y cascadas', description: 'Un punto natural de visita dentro del entorno de Podocarpus, entre senderos y bosque nublado.', activity: 'Senderismo · paisaje · fotografía', assetPath: 'assets/images/tourism/cascada-bombuscaro.jpg', asset: ClayAssets.hummingbird),
    _TourismPlace(title: 'Cascada La Poderosa', category: 'Agua y cascadas', description: 'Una alternativa para explorar el paisaje de agua, bosque y senderos del área protegida.', activity: 'Caminata · naturaleza · fotografía', assetPath: 'assets/images/tourism/la-poderosa.jpg', asset: ClayAssets.rain),
    _TourismPlace(title: 'Laguna de los Compadres', category: 'Naturaleza', description: 'Un destino de altura para vivir una experiencia de senderismo y contemplación en el Podocarpus.', activity: 'Trekking · camping · fotografía', assetPath: 'assets/images/tourism/podocarpus.jpg', asset: ClayAssets.toucan),
    _TourismPlace(title: 'Cerro La Yamila', category: 'Miradores y paisaje', description: 'Un punto para apreciar el relieve verde y la transición entre la ciudad y la selva zamorana.', activity: 'Paisaje · fotografía · caminata', assetPath: 'assets/images/tourism/nambija.webp', asset: ClayAssets.ubicacion),
    _TourismPlace(title: 'Balnearios Las Ballenas', category: 'Agua y descanso', description: 'Un espacio de recreación para refrescarse y pasar el día rodeado de naturaleza.', activity: 'Descanso · recreación · naturaleza', assetPath: 'assets/images/tourism/las-ballenas.webp', asset: ClayAssets.rain),
    _TourismPlace(title: 'Complejo Turístico Santa Elena', category: 'Agua y descanso', description: 'Una opción de visita para combinar descanso, recreación y un día de conexión con el entorno.', activity: 'Recreación · descanso · gastronomía', assetPath: 'assets/images/tourism/santa-elena.webp', asset: ClayAssets.feria),
    _TourismPlace(title: 'Malecón de Zamora', category: 'Cultura local', description: 'Un paseo urbano junto al río para conocer la vida cotidiana, el paisaje y los sabores de la ciudad.', activity: 'Paseo · gastronomía · cultura', assetPath: 'assets/images/tourism/malecon.webp', asset: ClayAssets.artesania),
    _TourismPlace(title: 'Catedral de Zamora', category: 'Patrimonio', description: 'Un punto de referencia para recorrer la ciudad y acercarse a su historia y arquitectura.', activity: 'Patrimonio · fotografía · paseo urbano', assetPath: 'assets/images/tourism/catedral.webp', asset: ClayAssets.events),
    _TourismPlace(title: 'Monumento a la Etnia Shuar', category: 'Cultura local', description: 'Una parada para reconocer la identidad amazónica y la presencia de la nacionalidad Shuar en Zamora.', activity: 'Cultura · identidad · fotografía', assetPath: 'assets/images/tourism/monumento-shuar.webp', asset: ClayAssets.artesania),
    _TourismPlace(title: 'El Reloj Más Grande del Mundo', category: 'Iconos de Zamora', description: 'Un símbolo de la ciudad y una parada imprescindible para iniciar un recorrido urbano.', activity: 'Paseo · fotografía · ciudad', assetPath: 'assets/images/tourism/reloj.webp', asset: ClayAssets.destino),
    _TourismPlace(title: 'Plaza Cívica', category: 'Cultura local', description: 'Un espacio de encuentro para conocer el pulso de la ciudad y sus actividades comunitarias.', activity: 'Paseo · eventos · cultura', assetPath: 'assets/images/tourism/plaza-civica.webp', asset: ClayAssets.eventoPersona),
    _TourismPlace(title: 'Monumento a Naya o La Chapetona', category: 'Iconos de Zamora', description: 'Una parada urbana para descubrir personajes y relatos que forman parte de la identidad local.', activity: 'Historia · cultura · fotografía', assetPath: 'assets/images/tourism/monumento-naya.webp', asset: ClayAssets.artesania),
    _TourismPlace(title: 'Puente de La Saquea', category: 'Miradores y paisaje', description: 'Un punto del entorno zamorano para contemplar el paisaje y conectar con las rutas de la provincia.', activity: 'Paisaje · fotografía · recorrido', assetPath: 'assets/images/tourism/la-saquea.webp', asset: ClayAssets.ubicacion),
    _TourismPlace(title: 'Valle de Nambija', category: 'Entorno de Zamora', description: 'Un paisaje de montaña y verde amazónico para ampliar el recorrido por el territorio zamorano.', activity: 'Paisaje · naturaleza · fotografía', assetPath: 'assets/images/tourism/nambija.webp', asset: ClayAssets.toucan),
  ];

  List<String> get _categories => <String>[_allCategory, ..._places.map((place) => place.category).toSet()];

  List<_TourismPlace> get _filteredPlaces => _selectedCategory == _allCategory ? _places : _places.where((place) => place.category == _selectedCategory).toList();

  @override
  Widget build(BuildContext context) {
    final filteredPlaces = _filteredPlaces;
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.fromLTRB(24, 20, 24, 36),
          children: [
            _buildHeader(context),
            const SizedBox(height: 20),
            _buildHero(context),
            const SizedBox(height: 28),
            Text('Explora por categoría', style: AppTypography.titleMd),
            const SizedBox(height: 10),
            SizedBox(
              height: 40,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: _categories.length,
                separatorBuilder: (_, _) => const SizedBox(width: 8),
                itemBuilder: (context, index) {
                  final category = _categories[index];
                  final isSelected = category == _selectedCategory;
                  return FilterChip(
                    label: Text(category),
                    selected: isSelected,
                    onSelected: (_) => setState(() => _selectedCategory = category),
                    selectedColor: AppColors.primaryFixed,
                    checkmarkColor: AppColors.primary,
                    labelStyle: AppTypography.labelSm.copyWith(color: isSelected ? AppColors.primary : AppColors.onSurfaceVariant),
                    side: BorderSide(color: isSelected ? AppColors.primaryFixed : AppColors.outlineVariant),
                    backgroundColor: AppColors.surfaceContainerLowest,
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                  );
                },
              ),
            ),
            const SizedBox(height: 26),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(_selectedCategory == _allCategory ? 'Lugares para descubrir' : _selectedCategory, style: AppTypography.headlineSm),
                      const SizedBox(height: 4),
                      Text('${filteredPlaces.length} destinos para planificar tu salida', style: AppTypography.bodySm.copyWith(color: AppColors.onSurfaceVariant)),
                    ],
                  ),
                ),
                const ClayIcon(asset: ClayAssets.hummingbird, size: 46),
              ],
            ),
            const SizedBox(height: 14),
            ...filteredPlaces.map((place) => Padding(padding: const EdgeInsets.only(bottom: 16), child: _PlaceCard(place: place))),
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
        IconButton(tooltip: 'Volver al inicio', onPressed: () => context.go('/dashboard'), icon: const Icon(Icons.arrow_back_rounded), color: AppColors.primary),
        const SizedBox(width: 4),
        Text('Turismo en Zamora', style: AppTypography.titleLg.copyWith(color: AppColors.primary)),
        const Spacer(),
        const ClayIcon(asset: ClayAssets.toucan, size: 42),
      ],
    );
  }

  Widget _buildHero(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: AppColors.primary, borderRadius: AppBorderRadius.radiusXxl, boxShadow: [BoxShadow(color: AppColors.primary.withValues(alpha: 0.22), blurRadius: 24, offset: const Offset(0, 10))]),
      clipBehavior: Clip.antiAlias,
      child: Stack(
        children: [
          Positioned.fill(child: Opacity(opacity: 0.28, child: ZamoraRemoteImage(url: '', assetPath: 'assets/images/tourism/podocarpus.jpg', fit: BoxFit.cover))),
          Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Tierra de aves y cascadas', style: AppTypography.labelMd.copyWith(color: AppColors.primaryFixed)),
                const SizedBox(height: 8),
                Text('Zamora se descubre caminando', style: AppTypography.displaySm.copyWith(color: AppColors.onPrimary)),
                const SizedBox(height: 10),
                Text('Una guía viva para encontrar naturaleza, cultura y lugares para compartir en la ciudad y sus alrededores.', style: AppTypography.bodyMd.copyWith(color: AppColors.onPrimary.withValues(alpha: 0.88))),
                const SizedBox(height: 18),
                Wrap(spacing: 8, runSpacing: 8, children: const [_HeroTag(label: '17 lugares'), _HeroTag(label: 'Aviturismo'), _HeroTag(label: 'Cascadas')]),
                const SizedBox(height: 20),
                OutlinedButton.icon(onPressed: () => context.push('/tourism/guide'), style: OutlinedButton.styleFrom(foregroundColor: AppColors.onPrimary, side: BorderSide(color: AppColors.onPrimary.withValues(alpha: 0.55))), icon: const Icon(Icons.menu_book_rounded, size: 18), label: const Text('Cómo usar Mi Zamora')),
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
          Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text('Guía rápida para la ciudadanía', style: AppTypography.titleSm), const SizedBox(height: 4), Text('Encuentra un lugar, revisa el mapa y planifica una salida con información clara.', style: AppTypography.bodySm.copyWith(color: AppColors.onSurfaceVariant))])),
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
                ZamoraRemoteImage(url: '', assetPath: place.assetPath, borderRadius: const BorderRadius.vertical(top: Radius.circular(AppBorderRadius.xl))),
                Positioned(top: 12, left: 12, child: Container(padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6), decoration: BoxDecoration(color: AppColors.surfaceContainerLowest.withValues(alpha: 0.88), borderRadius: AppBorderRadius.radiusFull), child: Text(place.category, style: AppTypography.labelSm.copyWith(color: AppColors.primary)))),
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
                Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text(place.title, style: AppTypography.titleMd), const SizedBox(height: 4), Text(place.description, style: AppTypography.bodySm.copyWith(color: AppColors.onSurfaceVariant)), const SizedBox(height: 8), Text(place.activity, style: AppTypography.labelSm.copyWith(color: AppColors.primary))])),
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
            const SizedBox(height: 10),
            Text(place.category, style: AppTypography.labelMd.copyWith(color: AppColors.primary)),
            const SizedBox(height: 10),
            Text(place.description, style: AppTypography.bodyLg),
            const SizedBox(height: 8),
            Text(place.activity, style: AppTypography.labelMd.copyWith(color: AppColors.primary)),
            const SizedBox(height: 20),
            SizedBox(width: double.infinity, child: FilledButton.icon(onPressed: () { Navigator.of(context).pop(); context.push('/maps'); }, icon: const Icon(Icons.map_outlined), label: const Text('Abrir mapa de Zamora'))),
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
  Widget build(BuildContext context) => Container(padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6), decoration: BoxDecoration(color: AppColors.onPrimary.withValues(alpha: 0.14), borderRadius: AppBorderRadius.radiusFull), child: Text(label, style: AppTypography.labelSm.copyWith(color: AppColors.onPrimary)));
}

class _TourismPlace {
  final String title;
  final String category;
  final String description;
  final String activity;
  final String assetPath;
  final String asset;

  const _TourismPlace({required this.title, required this.category, required this.description, required this.activity, required this.assetPath, required this.asset});
}
