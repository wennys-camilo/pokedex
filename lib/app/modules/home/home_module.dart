import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pokedex/app/modules/home/presentation/pages/details/details_controller.dart';

import 'data/datasources/poke_remote_datasource.dart';
import 'data/repositories/poke_repository.dart';
import 'presentation/pages/details/details_page.dart';
import 'presentation/pages/favorites/favorites_page.dart';
import 'presentation/pages/home/home_page.dart';
import 'presentation/pages/home/home_controller.dart';
import 'presentation/pages/search/search_page.dart';

class HomeModule extends Module {
  @override
  final List<Bind> binds = [
    Bind((i) => PokeRemoteDatasourceImpl(i.get<Dio>())),
    Bind((i) => PokeImpl(i.get())),
    Bind.lazySingleton((i) => HomeController(repository: i.get())),
    Bind.lazySingleton((i) => DetailsController(repository: i.get())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, args) => const HomePage()),
    ChildRoute('/details', child: (_, args) => DetailsPage(id: args.data)),
    ChildRoute('/favorites', child: (_, args) => const FavoritesPage()),
    ChildRoute('/search',
        child: (_, args) => SearchPage(
            details: args.data[0], backgroundColorDark: args.data[1])),
  ];
}
