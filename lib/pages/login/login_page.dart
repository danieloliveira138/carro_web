import 'package:carro_web/pages/home/home_page.dart';
import 'package:carro_web/pages/login/login_block.dart';
import 'package:carro_web/widgets/app_button.dart';
import 'package:carro_web/widgets/app_textfield.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _bloc = LoginBlock();

  final _loginController = TextEditingController();

  final _passwdController = TextEditingController();

  var _formKey = GlobalKey<FormState>();

  final _focusPasswd = FocusNode();

  @override
  void initState() {
    _bloc.load(context, Home(), true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appbar(),
      body: _body(),
    );
  }

  _appbar() {
    return AppBar(
      title: Text(
        'Carros',
      ),
    );
  }

  _body() {
    return Form(
      key: _formKey,
      child: Container(
        margin: EdgeInsets.all(16),
        child: ListView(
          children: <Widget>[
            AppTextField('Login', 'Digite seu login',
            controller: _loginController,
            validator: _bloc.validateLogin,
            textInputAction: TextInputAction.next,
            nextFocus: _focusPasswd),
            SizedBox(
              height: 16,
            ),
            AppTextField('Senha', 'Digite sua senha',
              obscure: true,
              controller: _passwdController,
              validator: _bloc.validatePasswd,
              keyboardType: TextInputType.number,
              focusNode: _focusPasswd),
            SizedBox(
              height: 24,
            ),
            StreamBuilder<bool>(
              stream: _bloc.stream,
              initialData: false,
              builder: (context, snapshot) {

                return AppButton(
                'Login',
                ( ) => _bloc.onClickLogin(
                  context,
                  _formKey,
                  _loginController,
                  _passwdController,
                ),
                showProgress: snapshot.data ?? false,

                );
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {

    super.dispose();
  }
}
