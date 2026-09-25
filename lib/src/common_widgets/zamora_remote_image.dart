import 'package:flutter/material.dart';

/// Imágenes editoriales de fuentes libres con un fallback visual institucional.
class ZamoraRemoteImage extends StatelessWidget {
  final String url;
  final double? height;
  final double? width;
  final BoxFit fit;
  final BorderRadius borderRadius;
  final Widget? overlay;

  const ZamoraRemoteImage({
    super.key,
    required this.url,
    this.height,
    this.width,
    this.fit = BoxFit.cover,
    this.borderRadius = BorderRadius.zero,
    this.overlay,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: ClipRRect(
        borderRadius: borderRadius,
        child: Stack(
          fit: StackFit.expand,
          children: [
          Image.network(
            url,
            height: height,
            width: width,
            fit: fit,
            filterQuality: FilterQuality.medium,
            loadingBuilder: (context, child, progress) {
              if (progress == null) return child;
              return Container(
                color: Theme.of(context).colorScheme.surfaceContainerHighest,
                alignment: Alignment.center,
                child: const SizedBox(
                  width: 22,
                  height: 22,
                  child: CircularProgressIndicator(strokeWidth: 2),
                ),
              );
            },
            errorBuilder: (context, error, stackTrace) => Container(
              color: Theme.of(context).colorScheme.surfaceContainerHighest,
              alignment: Alignment.center,
              child: Icon(
                Icons.image_not_supported_outlined,
                size: 42,
                color: Theme.of(context).colorScheme.outline,
              ),
            ),
          ),
            ?overlay,
          ],
        ),
      ),
    );
  }
}
