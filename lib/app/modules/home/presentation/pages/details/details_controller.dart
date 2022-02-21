import 'package:dartz/dartz.dart';
import 'package:mobx/mobx.dart';

import '../../../../../shared/helpers/failure.dart';
import '../../../data/models/details.dart';
import '../../../data/repositories/poke_repository.dart';
part 'details_controller.g.dart';

class DetailsController = _DetailsControllerBase with _$DetailsController;

abstract class _DetailsControllerBase with Store {
  PokeRepository repository;

  _DetailsControllerBase({required this.repository});

  @observable
  bool loading = false;

  @observable
  Details? details;

  @observable
  Option<Failure>? failure;

  @action
  Future<void> fetchDetails({required int id}) async {
    details = null;
    loading = true;
    failure = none();
    final response = await repository.fetchByID(id);
    response.fold((failuresResult) {
      failure = optionOf(failuresResult);
      loading = false;
    }, (response) async {
      details = response;
      await fetchDescription(index: response.id);
      loading = false;
    });
  }

  @action
  Future<void> fetchDescription({required int index}) async {
    loading = true;
    failure = none();
    final response = await repository.fetchDescription(index);
    response.fold((failuresResult) {
      failure = optionOf(failuresResult);
      loading = false;
    }, (response) {
      details!.description = response;
      loading = false;
    });
  }
}
