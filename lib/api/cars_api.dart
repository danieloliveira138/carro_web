import 'package:carro_web/models/car.dart';
import 'package:carro_web/models/user.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class CarsApi {

  static const String baseUrl = 'https://carros-springboot.herokuapp.com/api/v2/carros';

  static const String CLASSICOS = '/tipo/classicos';

  static const String LUXO = '/tipo/luxo';

  static const String ESPORTIVOS = '/tipo/esportivos';

  static getListCars({type, User user}) async {

    Map<String, String> headers = {
      "Content-Type": "application/json",
      "Authorization": "Bearer ${user.token}"
    };

    try {

      String url = type != null ? baseUrl + type : baseUrl;

      var response = await http.get(url, headers: headers);

      List mapResponse = json.decode(response.body);

      print("Request $url");

      return mapResponse.map<Car>((map) => Car.fromJson(map)).toList();

    } catch (error, exception) {

      print("Deu pau: $exception");

      return error;

    }

  }

  static Future<List<Car>> mockListCar() async {

    await Future.delayed(Duration(seconds: 2));

    return [
      Car(
          nome: 'Ferrari 250 GTO',
          urlFoto:
          'http://www.livroandroid.com.br/livro/carros/classicos/Ferrari_250_GTO.png',
          tipo: "classicos"),
      Car(
          nome: 'Chevrolet Bel-Air',
          urlFoto:
              'http://www.livroandroid.com.br/livro/carros/classicos/Chevrolet_BelAir.png',
          tipo: "classicos"),
      Car(
          nome: 'Chevrolet Impala Coupe',
          urlFoto:
              'http://www.livroandroid.com.br/livro/carros/classicos/Chevrolet_Impala_Coupe.png',
          tipo: "classicos"),
      Car(
          nome: 'Cadillac Deville Convertible',
          urlFoto:
              'http://www.livroandroid.com.br/livro/carros/classicos/Cadillac_Deville_Convertible.png',
          tipo: "classicos"),
      Car(
          nome: 'Chevrolet Bel-Air',
          urlFoto:
          'http://www.livroandroid.com.br/livro/carros/classicos/Chevrolet_BelAir.png',
          tipo: "classicos"),
      Car(
          nome: 'Chevrolet Impala Coupe',
          urlFoto:
          'http://www.livroandroid.com.br/livro/carros/classicos/Chevrolet_Impala_Coupe.png',
          tipo: "classicos"),
      Car(
          nome: 'Cadillac Deville Convertible',
          urlFoto:
          'http://www.livroandroid.com.br/livro/carros/classicos/Cadillac_Deville_Convertible.png',
          tipo: "classicos"),
      Car(
          nome: 'Chevrolet Bel-Air',
          urlFoto:
          'http://www.livroandroid.com.br/livro/carros/classicos/Chevrolet_BelAir.png',
          tipo: "classicos"),
      Car(
          nome: 'Chevrolet Impala Coupe',
          urlFoto:
          'http://www.livroandroid.com.br/livro/carros/classicos/Chevrolet_Impala_Coupe.png',
          tipo: "classicos"),
      Car(
          nome: 'Cadillac Deville Convertible',
          urlFoto:
          'http://www.livroandroid.com.br/livro/carros/classicos/Cadillac_Deville_Convertible.png',
          tipo: "classicos"),
      Car(
          nome: 'Chevrolet Bel-Air',
          urlFoto:
          'http://www.livroandroid.com.br/livro/carros/classicos/Chevrolet_BelAir.png',
          tipo: "classicos"),
      Car(
          nome: 'Chevrolet Impala Coupe',
          urlFoto:
          'http://www.livroandroid.com.br/livro/carros/classicos/Chevrolet_Impala_Coupe.png',
          tipo: "classicos"),
      Car(
          nome: 'Cadillac Deville Convertible',
          urlFoto:
          'http://www.livroandroid.com.br/livro/carros/classicos/Cadillac_Deville_Convertible.png',
          tipo: "classicos"),
    ];
  }
}
