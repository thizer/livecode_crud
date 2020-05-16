class ModelProduto {
  int id;
  String titulo;
  String avatar;
  String createdAt;

  ModelProduto({this.id, this.titulo, this.avatar, this.createdAt});

  ModelProduto.fromJson(Map<String, dynamic> json)
      : id = int.parse(json['id']),
        titulo = json['titulo'],
        avatar = json['avatar'],
        createdAt = json['createdAt'];

  Map<String, dynamic> toJson() => {
        "id": id,
        "titulo": titulo,
        "avatar": avatar,
        "createdAt": createdAt,
      };
}
