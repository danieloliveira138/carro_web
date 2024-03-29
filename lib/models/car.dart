import 'package:carro_web/models/entity.dart';

class Car extends Entity{
  int id;
  String nome;
  String tipo;
  String descricao;
  String urlFoto;
  String urlVideo;
  String latitude;
  String longitude;

  Car({this.id, this.nome, this.tipo, this.descricao, this.urlFoto,
      this.urlVideo, this.latitude, this.longitude});

  Car.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nome = json['nome'];
    tipo = json['tipo'];
    descricao = json['descricao'];
    urlFoto = json['urlFoto'];
    urlVideo = json['urlVideo'];
    latitude = json['latitude'];
    longitude = json['longitude'];
  }

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nome'] = this.nome;
    data['tipo'] = this.tipo;
    data['descricao'] = this.descricao;
    data['urlFoto'] = this.urlFoto;
    data['urlVideo'] = this.urlVideo;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    return data;
  }

  @override
  String toString() {
    return 'Car{id: $id, nome: $nome, tipo: $tipo, descricao: $descricao,'
        ' urlFoto: $urlFoto, urlVideo: $urlVideo, latitude: $latitude,'
        ' longitude: $longitude}';
  }
}
