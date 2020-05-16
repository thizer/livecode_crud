import 'package:dio/dio.dart';
import 'package:livecode_crud/model/produto.dart';
import 'package:mobx/mobx.dart';

part 'home_controller.g.dart';

class HomeController = HomeControllerBase with _$HomeController;

abstract class HomeControllerBase with Store {
  Dio _dio;

  String endpoint = 'https://5ebf12f200eabe0016fa3943.mockapi.io/produto';

  @observable
  ObservableList<ModelProduto> data = ObservableList<ModelProduto>();

  HomeControllerBase() {
    _dio = Dio();
  }

  @action
  Future loadData() async {
    // Limpa o conteudo
    data.clear();

    // Busca na API
    var response = await _dio.get(endpoint);

    // Add item por item em formato de model
    for (var item in response.data) {
      data.add(ModelProduto.fromJson(item));
    }
  }

  @action
  Future removeItem(int id) async {
    await _dio.delete(endpoint + '/$id');
  }
}
