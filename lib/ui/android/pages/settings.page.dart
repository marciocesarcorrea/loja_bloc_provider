import 'package:flutter/material.dart';
import 'package:loja_bloc_provider/blocs/theme.bloc.dart';
import 'package:loja_bloc_provider/settings.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ThemeBloc bloc = Provider.of<ThemeBloc>(context);
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: <Widget>[
          SizedBox(
            height: 60,
          ),
          Text(
            "Tema atual: ${Settings.theme}",
            textAlign: TextAlign.center,
          ),
          FlatButton(
            child: Text("Light"),
            onPressed: () {
              save("light");
              bloc.change("light");
            },
          ),
          FlatButton(
            child: Text("Dark"),
            onPressed: () {
              save("dark");
              bloc.change("dark");
            },
          ),
          FlatButton(
            child: Text("Dark Yellow"),
            onPressed: () {
              save("dark-yellow");
              bloc.change("dark-yellow");
            },
          ),
        ],
      ),
    );
  }

  save(theme) async {
    var prefs = await SharedPreferences.getInstance();
    await prefs.setString('theme', theme);
  }
}
