class Species {
  final String name;
  final String url;
  Species({
    required this.name,
    required this.url,
  });

  factory Species.fromMap(Map<String, dynamic> map) {
    return Species(
      name: map['name'] ?? '',
      url: map['url'] ?? '',
    );
  }

  @override
  String toString() => 'Species(name: $name, url: $url)';
}
