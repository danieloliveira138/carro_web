import 'package:carro_web/models/car.dart';
import 'package:carro_web/widgets/drawer_menu.dart';
import 'package:carro_web/widgets/text_error.dart';
import 'package:flutter/material.dart';
import 'car_bloc.dart';

class CarPage extends StatefulWidget {
  Car _car;

  CarPage(this._car);

  @override
  _CarPageState createState() => _CarPageState();
}

class _CarPageState extends State<CarPage> {
  CarBloc _bloc = CarBloc();

  get car => widget._car;

  @override
  void initState() {
    _bloc.loadLoremIpsum();
    _bloc.isCarFavorite(car);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(car.nome ?? ''),
      body: _body(context, car),
      drawer: MenuList(),
    );
  }

  _body(BuildContext context, Car car) {
    return Container(
      child: ListView(
        children: <Widget>[
          _carImage(),
          _carTitle(),
          _carDescription(),
        ],
      ),
    );
  }

  _carTitle() {
    return Container(
      padding: EdgeInsets.only(
        left: 16,
        right: 16,
        top: 16,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Flexible(
            fit: FlexFit.loose,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  widget._car.nome,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  widget._car.tipo,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 16,
                  ),
                )
              ],
            ),
          ),
          Row(
            children: <Widget>[
              StreamBuilder<bool>(
                stream: _bloc.favorite,
                initialData: false,
                builder: (context, snapshot) {
                  return IconButton(
                    icon: Icon(snapshot.data == true ? Icons.favorite : Icons.favorite_border),
                    onPressed: () => _bloc.onClickFavorite(car),
                    iconSize: 44,
                    color: Colors.red,
                  );
                },
              ),
              IconButton(
                icon: Icon(Icons.share),
                onPressed: _bloc.onClickShare,
                iconSize: 44,
              ),
            ],
          )
        ],
      ),
    );
  }

  Container _carImage() {
    return Container(
      margin: EdgeInsets.all(24),
      width: double.infinity,
      child: Image.network(
        car.urlFoto ?? ' ',
        fit: BoxFit.fitWidth,
      ),
    );
  }

  _appBar(String title) {
    return AppBar(
      title: Text(title),
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.place),
          onPressed: _bloc.onClickMap,
        ),
        IconButton(
          icon: Icon(Icons.videocam),
          onPressed: _bloc.onClickVideo,
        ),
        PopupMenuButton<String>(
          onSelected: _bloc.onClickPopupMenu,
          itemBuilder: (context) {
            return [
              PopupMenuItem(
                value: CarBloc.EDIT,
                child: Text('Editar'),
              ),
              PopupMenuItem(
                value: CarBloc.DELETE,
                child: Text('Deletar'),
              ),
              PopupMenuItem(
                value: CarBloc.SHARE,
                child: Text('Share'),
              ),
            ];
          },
        )
      ],
    );
  }

  _carDescription() {
    return Container(
      padding: EdgeInsets.only(
        left: 16,
        right: 16,
      ),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: 24,
          ),
          Text(
            'Descrição ${car.nome}:',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 16,
          ),
          StreamBuilder<String>(
            stream: _bloc.stream,
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (snapshot.hasError) {
                return TextError('Erro ao acessar informações do servidor');
              }

              return Text(snapshot.data ?? ' ');
            },
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    _bloc.dispose();
    super.dispose();
  }
}
