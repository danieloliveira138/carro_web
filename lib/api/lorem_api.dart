import 'package:carro_web/models/api_response.dart';
import 'package:http/http.dart' as http;

class LoremIpsumApi {

  static const String _baseUrl = 'https://loripsum.net/api';

  static getLoremIpsum() async {
    var response;
    try {

      response = await http.get(_baseUrl);

      print('status code: ${response.statusCode}');

      switch (response.statusCode) {
        case 200:
          String text = response.body;
          text = text.replaceAll('<p>', '');
          text = text.replaceAll('</p>', '');
          return ApiResponse.success(text);
          break;

        default:
          return ApiResponse.error('Server Fail: status code = ${response.statusCode()}');
          break;
      }

    } catch (error, exception) {
      return ApiResponse.error('Request fail: $error\nException: $exception');
    }

  }
}