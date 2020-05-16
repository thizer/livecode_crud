// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeController on HomeControllerBase, Store {
  final _$dataAtom = Atom(name: 'HomeControllerBase.data');

  @override
  ObservableList<ModelProduto> get data {
    _$dataAtom.reportRead();
    return super.data;
  }

  @override
  set data(ObservableList<ModelProduto> value) {
    _$dataAtom.reportWrite(value, super.data, () {
      super.data = value;
    });
  }

  final _$loadDataAsyncAction = AsyncAction('HomeControllerBase.loadData');

  @override
  Future<dynamic> loadData() {
    return _$loadDataAsyncAction.run(() => super.loadData());
  }

  final _$removeItemAsyncAction = AsyncAction('HomeControllerBase.removeItem');

  @override
  Future<dynamic> removeItem(int id) {
    return _$removeItemAsyncAction.run(() => super.removeItem(id));
  }

  @override
  String toString() {
    return '''
data: ${data}
    ''';
  }
}
