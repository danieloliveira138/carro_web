import 'package:carro_web/models/entity.dart';

class Favorite extends Entity {
  int id;
  int userId;

  Favorite({this.id, this.userId});

  Favorite.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['userId'];
  }

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['userId'] = this.userId;
    return data;
  }

}