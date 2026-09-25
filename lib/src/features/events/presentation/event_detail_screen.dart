import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../core/theme/app_border_radius.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_typography.dart';
import '../../../common_widgets/zamora_remote_image.dart';

final class EventDetailScreen extends StatelessWidget {
  final String eventId;

  const EventDetailScreen({super.key, required this.eventId});

  @override
  Widget build(BuildContext context) {
    final event = _events[eventId] ?? _events['festival']!;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalle del evento'),
        actions: [
          IconButton(
            tooltip: 'Mis eventos',
            onPressed: () => context.push('/my-events'),
            icon: const Icon(Icons.bookmark_outline_rounded),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(24, 8, 24, 32),
        children: [
          ZamoraRemoteImage(
            url: event.imageUrl,
            height: 230,
            width: double.infinity,
            borderRadius: AppBorderRadius.radiusXxl,
          ),
          const SizedBox(height: 24),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: AppColors.secondaryContainer,
              borderRadius: AppBorderRadius.radiusFull,
            ),
            child: Text(event.category, style: AppTypography.labelMd.copyWith(color: AppColors.onSecondaryContainer)),
          ),
          const SizedBox(height: 12),
          Text(event.title, style: AppTypography.headlineMd),
          const SizedBox(height: 18),
          _InfoRow(icon: Icons.calendar_today_rounded, text: event.date),
          const SizedBox(height: 10),
          _InfoRow(icon: Icons.location_on_rounded, text: event.location),
          const SizedBox(height: 20),
          Text(event.description, style: AppTypography.bodyLg),
          const SizedBox(height: 28),
          FilledButton.icon(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Evento guardado en Mis eventos')),
              );
            },
            icon: const Icon(Icons.bookmark_add_outlined),
            label: const Text('Guardar en mis eventos'),
          ),
          const SizedBox(height: 10),
          OutlinedButton(
            onPressed: () => context.push('/my-events'),
            child: const Text('Ver mis eventos'),
          ),
        ],
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  final IconData icon;
  final String text;

  const _InfoRow({required this.icon, required this.text});

  @override
  Widget build(BuildContext context) => Row(
        children: [
          Icon(icon, size: 20, color: AppColors.primary),
          const SizedBox(width: 10),
          Text(text, style: AppTypography.bodyMd),
        ],
      );
}

class _EventData {
  final String title;
  final String category;
  final String date;
  final String location;
  final String description;
  final String imageUrl;
  final IconData icon;

  const _EventData({
    required this.title,
    required this.category,
    required this.date,
    required this.location,
    required this.description,
    required this.imageUrl,
    required this.icon,
  });
}

const _events = <String, _EventData>{
  'festival': _EventData(
    title: 'Agenda cultural y turística de Zamora',
    category: 'Cultura',
    date: 'Fecha por confirmar',
    location: 'Malecón de Zamora',
    description: 'Consulta actividades culturales, turísticas y comunitarias en los espacios públicos de Zamora.',
    imageUrl: 'https://images.unsplash.com/photo-1492684223066-81342ee5ff30?auto=format&fit=crop&w=1400&q=85',
    icon: Icons.music_note_rounded,
  ),
  'planting': _EventData(
    title: 'Cuidado de parques y jardines',
    category: 'Ambiente',
    date: 'Fecha por confirmar',
    location: 'Plaza Cívica de Zamora',
    description: 'Actividad para recuperar y cuidar los espacios públicos del cantón.',
    imageUrl: 'https://images.unsplash.com/photo-1558904541-efa843a96f01?auto=format&fit=crop&w=1200&q=85',
    icon: Icons.eco_rounded,
  ),
  'run': _EventData(
    title: 'Activación deportiva comunitaria',
    category: 'Deporte',
    date: 'Fecha por confirmar',
    location: 'Complejo Turístico Santa Elena',
    description: 'Encuentro deportivo y recreativo para compartir en uno de los espacios turísticos del cantón.',
    imageUrl: 'https://images.unsplash.com/photo-1517836357463-d25dfeac3438?auto=format&fit=crop&w=1200&q=85',
    icon: Icons.directions_run_rounded,
  ),
  'gallery': _EventData(
    title: 'Feria de emprendimientos locales',
    category: 'Comercio',
    date: 'Fecha por confirmar',
    location: 'Mercado Centro Comercial Reina del Cisne',
    description: 'Espacio para conocer productos, gastronomía y artesanías elaboradas por emprendedores de Zamora.',
    imageUrl: 'https://images.unsplash.com/photo-1488459716781-31db52582fe9?auto=format&fit=crop&w=1200&q=85',
    icon: Icons.palette_rounded,
  ),
};
