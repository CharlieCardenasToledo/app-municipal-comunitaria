import 'package:flutter/material.dart';

/// Shared 3D icon language used across Mi Zamora.
///
/// The asset is intentionally passed by the caller so each module can keep
/// its own visual cue while all icons share the same rendering rules.
class ClayIcon extends StatelessWidget {
  final String asset;
  final double size;
  final EdgeInsetsGeometry padding;
  final BoxFit fit;

  const ClayIcon({
    super.key,
    required this.asset,
    this.size = 24,
    this.padding = EdgeInsets.zero,
    this.fit = BoxFit.contain,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Image.asset(
        asset,
        width: size,
        height: size,
        fit: fit,
        filterQuality: FilterQuality.high,
        semanticLabel: 'Icono ilustrado',
      ),
    );
  }
}

abstract final class ClayAssets {
  static const avatar = 'assets/images/amazonia-avatar-clay.png';
  static const alerts = 'assets/images/amazonia-alertas-clay.png';
  static const commerce = 'assets/images/amazonia-comercio-clay.png';
  static const events = 'assets/images/amazonia-eventos-clay.png';
  static const parking = 'assets/images/amazonia-estacionamiento-clay.png';
  static const payments = 'assets/images/amazonia-pagos-clay.png';
  static const report = 'assets/images/amazonia-reportar-clay.png';
  static const routes = 'assets/images/amazonia-rutas-clay.png';
  static const hummingbird = 'assets/images/amazonia-colibri-clay.png';
  static const toucan = 'assets/images/amazonia-tucan-clay.png';
}
