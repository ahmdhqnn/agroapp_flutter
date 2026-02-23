class FieldModel {
  final String name;
  final String locationName;
  final String address;
  final String status;
  final double lat;
  final double lon;
  final double alt;

  const FieldModel({
    required this.name,
    required this.locationName,
    required this.address,
    required this.status,
    required this.lat,
    required this.lon,
    required this.alt,
  });
}

class FieldIndicator {
  final String title;
  final String subtitle;
  final String value;
  final String unit;

  const FieldIndicator({
    required this.title,
    required this.subtitle,
    required this.value,
    required this.unit,
  });
}
