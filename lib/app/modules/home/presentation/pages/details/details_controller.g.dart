// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'details_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$DetailsController on _DetailsControllerBase, Store {
  final _$loadingAtom = Atom(name: '_DetailsControllerBase.loading');

  @override
  bool get loading {
    _$loadingAtom.reportRead();
    return super.loading;
  }

  @override
  set loading(bool value) {
    _$loadingAtom.reportWrite(value, super.loading, () {
      super.loading = value;
    });
  }

  final _$detailsAtom = Atom(name: '_DetailsControllerBase.details');

  @override
  Details? get details {
    _$detailsAtom.reportRead();
    return super.details;
  }

  @override
  set details(Details? value) {
    _$detailsAtom.reportWrite(value, super.details, () {
      super.details = value;
    });
  }

  final _$failureAtom = Atom(name: '_DetailsControllerBase.failure');

  @override
  Option<Failure>? get failure {
    _$failureAtom.reportRead();
    return super.failure;
  }

  @override
  set failure(Option<Failure>? value) {
    _$failureAtom.reportWrite(value, super.failure, () {
      super.failure = value;
    });
  }

  final _$fetchDetailsAsyncAction =
      AsyncAction('_DetailsControllerBase.fetchDetails');

  @override
  Future<void> fetchDetails({required int id}) {
    return _$fetchDetailsAsyncAction.run(() => super.fetchDetails(id: id));
  }

  final _$fetchDescriptionAsyncAction =
      AsyncAction('_DetailsControllerBase.fetchDescription');

  @override
  Future<void> fetchDescription({required int index}) {
    return _$fetchDescriptionAsyncAction
        .run(() => super.fetchDescription(index: index));
  }

  @override
  String toString() {
    return '''
loading: ${loading},
details: ${details},
failure: ${failure}
    ''';
  }
}
