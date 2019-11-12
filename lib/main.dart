import 'package:flutter/material.dart';
import 'package:loja_bloc_provider/blocs/cart.bloc.dart';
import 'package:loja_bloc_provider/blocs/home.bloc.dart';
import 'package:loja_bloc_provider/blocs/theme.bloc.dart';
import 'package:loja_bloc_provider/blocs/user.bloc.dart';
import 'package:loja_bloc_provider/ui/android/pages/tabs.page.dart';
import 'package:provider/provider.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<HomeBloc>.value(
          value: HomeBloc(),
        ),
        ChangeNotifierProvider<CartBloc>.value(
          value: CartBloc(),
        ),
        ChangeNotifierProvider<UserBloc>.value(
          value: UserBloc(),
        ),
        ChangeNotifierProvider<ThemeBloc>.value(
          value: ThemeBloc(),
        ),
      ],
      child: Main(),
    );
  }
}

class Main extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ThemeBloc bloc = Provider.of<ThemeBloc>(context);
    return MaterialApp(
      title: 'Loja',
      debugShowCheckedModeBanner: false,
      theme: bloc.theme,
      home: DefaultTabController(
        length: 3,
        child: TabsPage(),
      ),
    );
  }
}
