import 'package:carro_web/models/user.dart';
import 'package:carro_web/pages/login/login_page.dart';
import 'package:carro_web/utils/nav.dart';
import 'package:flutter/material.dart';

class MenuList extends StatelessWidget {
  Function favorite;
  Function home;
  User user;

  MenuList({this.favorite, this.home, this.user});

  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Drawer(
        child: ListView(
          children: <Widget>[
            user != null ? _header(user) : Container(),
            ListTile(
              leading: Icon(Icons.favorite),
              title: Text('Favoritos'),
              subtitle: Text('Tela de lista de favoritos'),
              trailing: Icon(Icons.arrow_forward),
              onTap: () {
                Navigator.pop(context);
                favorite();
              },
            ),
            ListTile(
              leading: Icon(Icons.list),
              title: Text('Carros'),
              subtitle: Text('Lista de carros'),
              trailing: Icon(Icons.arrow_forward),
              onTap: () {
                Navigator.pop(context);
                home();
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Configurações'),
              subtitle: Text('Configure o App para sua melhor experiência.'),
              trailing: Icon(Icons.arrow_forward),
              onTap: () => Navigator.pop(context),
            ),
            SizedBox(
              height: 50,
            ),
            ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text('Sair'),
              trailing: Icon(Icons.arrow_forward),
              onTap: () => _onClickLogout(context),
            ),
          ],
        ),
      ),
    );
  }

  _header(User user) {
    return UserAccountsDrawerHeader(
          accountName: Text(user.nome),
          accountEmail: Text(user.email),
          currentAccountPicture: CircleAvatar(
            backgroundImage: NetworkImage(
              user.urlFoto
            ),
          ),
        );
  }

  _onClickLogout(BuildContext context) {
    User.clear();
    Navigator.pop(context);
    nav(context, LoginPage(), replace: true);
    return;
  }
}
