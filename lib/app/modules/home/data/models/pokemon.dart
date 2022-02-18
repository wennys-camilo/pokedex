class Pokemon {
  final String name;
  final String url;

  Pokemon({
    required this.name,
    required this.url,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'url': url,
    };
  }

  factory Pokemon.fromMap(Map<String, dynamic> map) {
    return Pokemon(
      name: map['name'] ?? '',
      url: map['url'] ?? '',
    );
  }

  @override
  String toString() => 'Pokemon(name: $name, url: $url)';
}
