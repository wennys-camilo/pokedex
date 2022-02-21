abstract class PokemonLocalDatasource {
  Future<void> insert(String value);

  Future<bool> exists(String value);

  Future<List<String>> getAll();

  Future<void> remove(String value);
}
