import 'dart:async';
import 'package:carro_web/models/user.dart';

class HomeBloc {
  final StreamController _streamController = StreamController<int>();
  User user;
  get stream => _streamController.stream;

  favoriteScaffold() => _streamController.add(1);

  homeScaffold(User user) {
    this.user = user;
    _streamController.add(-1);  
  }

  dispose() {
    _streamController.close();
  }
}