# Zamora Conecta

MVP web del GAD Municipal de Zamora para servicios, participación ciudadana,
comercio local, agenda comunitaria y seguimiento demostrativo del recolector.

## Incluye

- Mapa de Zamora con OpenStreetMap y rutas viales mediante OSRM.
- Seguimiento animado del recolector con destino y tiempo estimado de llegada.
- Reporte de incidentes, servicios municipales y alertas.
- Agenda cultural, turística, ambiental y deportiva.
- Comercio local, ferias y catálogo demostrativo.
- Imágenes editoriales de Unsplash y publicaciones contextualizadas para Zamora.

## Ejecutar localmente

```bash
flutter pub get
flutter run -d chrome
```

El mapa, el cálculo de rutas y las imágenes requieren conexión a internet.

## Publicación

El proyecto se despliega automáticamente en GitHub Pages mediante
`.github/workflows/deploy-pages.yml` cada vez que se actualiza la rama `main`.

## Fuentes

- [GAD Municipal de Zamora](https://zamora.gob.ec/)
- [OpenStreetMap](https://www.openstreetmap.org/)
- [OSRM](https://project-osrm.org/)
- [Unsplash License](https://unsplash.com/license)
