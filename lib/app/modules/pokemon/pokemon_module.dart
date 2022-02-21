import 'package:flutter_modular/flutter_modular.dart';
import 'domain/usescases/fetch_all_pokemons_favorites_usecase_impl.dart';
import 'external/datasources/pokemon_local_datasource_impl.dart';
import 'presentation/pages/pokemon_favorites/pokemon_favorites_controller.dart';
import 'presentation/pages/pokemon/pokemon_controller.dart';
import 'presentation/pages/pokemon_details/pokemon_details_controller.dart';
import 'presentation/pages/pokemon_details/pokemon_details_page.dart';
import 'domain/usescases/fetch_all_pokemons_usecase_impl.dart';
import 'domain/usescases/fetch_pokemon_by_id_usecase_impl.dart';
import 'domain/usescases/fetch_pokemon_by_name_usecase_impl.dart';
import 'domain/usescases/fetch_pokemon_details_by_url_usecase_impl.dart';
import 'external/datasources/pokemon_remote_datasource_impl.dart';
import 'infra/repositories/pokemon_repository_impl.dart';
import 'presentation/pages/pokemon/pokemon_page.dart';
import 'presentation/pages/pokemon_favorites/pokemon_favorites_page.dart';

class PokemonModule extends Module {
  @override
  final List<Bind> binds = [
    Bind((i) => PokemonRemoteDatasourceImpl(i.get())),
    Bind((i) => PokemonLocalDatasourceImpl(i.get())),
    Bind((i) => PokemonRepositoryImpl(i.get(), i.get())),
    Bind((i) => FetchAllPokemonsUsecaseImpl(i.get())),
    Bind((i) => FetchPokemonByNameUsecaseImpl(i.get())),
    Bind((i) => FetchPokemonDetailsByUrlUsecaseImpl(i.get())),
    Bind((i) => FetchAllPokemonsUsecaseImpl(i.get())),
    Bind((i) => FetchPokemonByIdUsecaseImpl(i.get())),
    Bind((i) => FetchAllPokemonsFavoritesUsecaseImpl(i.get())),
    Bind((i) => PokemonController(i.get())),
    Bind((i) => PokemonDetailsController(i.get(), i.get())),
    Bind((i) => PokemonFavoritesController(i.get(), i.get())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (context, args) => const PokemonPage()),
    ChildRoute('/details',
        child: (context, args) => PokemonDetailsPage(url: args.data)),
    ChildRoute('/favorites',
        child: (context, args) => const PokemonFavoritesPage()),
  ];
}
