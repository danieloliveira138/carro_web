import 'dart:async';
import 'package:carro_web/api/cars_api.dart';
import 'package:carro_web/models/car.dart';
import 'package:carro_web/models/user.dart';
import 'package:carro_web/pages/detail/car_page.dart';
import 'package:carro_web/utils/nav.dart';
import 'package:flutter/material.dart';

class CarsBloc {

  final _streamController = StreamController<List<Car>>();

  get stream => _streamController.stream;

  Future<List<Car>> loadCars(String type, User user) async {

    switch (type) {
      case 'FavoriteDao.FAVORITES':
        return _loadFavoriteCars();
      default:
        return _loadCarsFromApi(type, user);
    }

  }


  void onClickDetails(BuildContext context, CarPage page){
    nav(context, page);
  }

  dispose() {
    _streamController.close();
  }

  Future<List<Car>> _loadFavoriteCars() async {
    User user = await User.loadUser();


//    List<Car> cars = await _carDao.findAllByUser(user.id);
//
//    if (cars == null){
//      _streamController.addError('Nenhum Carro Salvo');
//    } else {
//      _streamController.add(cars);
//    }

    return /*cars ??*/ <Car> [];
  }

  Future<List<Car>> _loadCarsFromApi(type, user) async {
    List<Car> cars;
    try {

      cars = await CarsApi.getListCars(type: type, user: user);

      _streamController.add(cars);

    } catch (error, exception) {

      print('Car list error: $exception');

      _streamController.addError('Erro ao acessar o servidor de dados.');

    }

    return cars;
  }

}