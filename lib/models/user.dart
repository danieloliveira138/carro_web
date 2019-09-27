import 'dart:convert' as converter;

// import 'package:carro_web/utils/shared_preferences.dart';

class User {
  int id;
  String login;
  String nome;
  String email;
  String urlFoto;
  String token;
  List<String> roles;

  static const String USER_SAVED = 'user_saved_prefs';

  User.fromJson(Map<String, dynamic> map)
      : id = map['id'],
        login = map['login'],
        nome = map['nome'],
        email = map['email'],
        urlFoto = map['urlFoto'],
        token = map['token'],
        roles = map['roles'] != null ?
            map['roles'].map<String>((role) => role.toString()).toList() : null;

  User(
    this.id,
    this.login,
    this.nome,
    this.email,
    this.urlFoto,
    this.token,
    this.roles,
  );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['login'] = this.login;
    data['nome'] = this.nome;
    data['email'] = this.email;
    data['urlFoto'] = this.urlFoto;
    data['token'] = this.token;
    data['roles'] = this.roles;
    return data;
  }

  save() async {
    Map map = toJson();
    String json = converter.json.encode(map);
    // SharedPrefs.setPrefString(USER_SAVED, json);
  }

  static clear() async {
    // return SharedPrefs.setPrefString(USER_SAVED, "");
  }

  static Future<User> loadUser() async {
    // String json = await SharedPrefs.getPrefString(USER_SAVED);
    // Map map = converter.json.decode(json);
    // User user = User.fromJson(map);
    // return user;
  }

  @override
  String toString() {
    return 'Usuario{id: $id, login: $login, nome: $nome, email: $email, '
        'urlFoto: $urlFoto, token: $token, roles: $roles}';
  }

}
