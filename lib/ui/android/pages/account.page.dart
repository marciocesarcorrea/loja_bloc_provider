import 'package:flutter/material.dart';
import 'package:loja_bloc_provider/blocs/user.bloc.dart';
import 'package:loja_bloc_provider/ui/android/pages/settings.page.dart';
import 'package:loja_bloc_provider/ui/shared/widgets/account/authenticated-user-card.widget.dart';
import 'package:loja_bloc_provider/ui/shared/widgets/account/unauthenticated-user-card.widget.dart';
import 'package:provider/provider.dart';

class AccountPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var bloc = Provider.of<UserBloc>(context);
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          FlatButton(
            child: Icon(
              Icons.settings,
            ),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SettingsPage()));
            },
          ),
        ],
      ),
      body: bloc.user == null
          ? UnauthenticatedUserCard()
          : AuthenticatedUserCard(),
    );
  }
}
