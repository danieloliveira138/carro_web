import 'package:carro_web/pages/home/cars_listview.dart';
import 'package:carro_web/widgets/drawer_menu.dart';
import 'package:flutter/material.dart';
import 'package:carro_web/models/user.dart';
import 'home_bloc.dart';

// ignore: must_be_immutable
class Home extends StatefulWidget {
  
  User user;
  Home({this.user});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin<Home> {
  TabController _tabController;
  get user => widget.user;

  HomeBloc _bloc = HomeBloc();

  static const String TAB_INDEX = 'tab_index';

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<int>(
      stream: _bloc.stream,
      initialData: -1,
      builder: (context, snapshot) {
        print(user.toString());
        return Scaffold(
          appBar: _appBar(snapshot.data),
          body: _body(snapshot.data),
          drawer: MenuList(
            favorite: () => _bloc.favoriteScaffold(),
            home: () => _bloc.homeScaffold(user),
            user: user,
          ),
        );
      },
    );
  }

  _appBar(int opt) {
    switch (opt) {
      case 1:
        return AppBar(
          title: Text('Favoritos'),
        );
        break;

      case -1:
        _initTabs();
        return AppBar(
          title: Text('Carros'),
          bottom: TabBar(
            tabs: _getTabs(),
            controller: _tabController,
          ),
        );
        break;
    }
  }

  _body(int opt) {
    switch (opt) {
      case 1:
        return CarsListView.favorites();
        break;

      case -1:
        return TabBarView(
          controller: _tabController,
          children: <Widget>[
            CarsListView.classics(user: user),
            CarsListView.sportive(user: user),
            CarsListView.lux(user: user),
          ],
        );
        break;
    }
  }

  _getTabs() {
    return [
      Tab(
        text: "Clássicos",
      ),
      Tab(
        text: "Esportivos",
      ),
      Tab(text: "Luxo"),
    ];
  }

  _initTabs() async {
    _tabController = TabController(length: 3, vsync: this);

    // _tabController.index = await SharedPrefs.getPrefInt(TAB_INDEX) ?? 0;

    _tabController.addListener(() {
      print("Tab: ${_tabController.index}");

      // SharedPrefs.setPrefInt(TAB_INDEX, _tabController.index);
    });
  }

  @override
  void dispose() {
    _bloc.dispose();
    super.dispose();
  }
}
