import 'dart:async';
import 'package:carro_web/api/lorem_api.dart';
import 'package:carro_web/models/car.dart';
import 'package:carro_web/models/favorite.dart';
import 'package:carro_web/models/user.dart';

class CarBloc{
  
  static const String EDIT = 'edit';
  static const String DELETE = 'delete';
  static const String SHARE = 'share';

  StreamController _streamController = StreamController<String>();

  StreamController _streamFavorite = StreamController<bool>();

  Stream<String> get stream => _streamController.stream;

  Stream<bool> get favorite => _streamFavorite.stream;

  loadLoremIpsum() async {
    var response = await LoremIpsumApi.getLoremIpsum();

    print('reponse: ${response.result}');
    print('reponse status: ${response.status}');

    if (response.status){
      _streamController.add(response.result);
    } else {
      _streamController.addError(response.msg);
    }

  }

  void onClickMap() {

  }

  void onClickPopupMenu(String value) {
    switch (value) {
      case EDIT:
        print(value);
        break;
      case SHARE:
        print(value);
        break;
      case DELETE:
        print(value);
        break;

    }
  }

  void onClickVideo() {
  }

  void onClickFavorite(Car car) async {
    User user = await User.loadUser();
    Favorite favorite = Favorite(id: car.id, userId: user.id);

  }

  isCarFavorite(Car car) async {
    User user = await User.loadUser();
  }

  void onClickShare() {
  }

  void dispose() {
    _streamController.close();
    _streamFavorite.close();
  }
}