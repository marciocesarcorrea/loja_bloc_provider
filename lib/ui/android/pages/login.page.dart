import 'package:flutter/material.dart';
import 'package:loja_bloc_provider/blocs/user.bloc.dart';
import 'package:loja_bloc_provider/models/user.model.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  var username = "";
  var password = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: ListView(
            children: <Widget>[
              TextFormField(
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: "Usúario",
                  labelStyle: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                  ),
                ),
                style: TextStyle(
                  fontSize: 20,
                  color: Theme.of(context).primaryColor,
                ),
                validator: (value) {
                  if (value.isEmpty) {
                    return "Usuário inválido";
                  }
                  return null;
                },
                onSaved: (val) {
                  username = val;
                },
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                obscureText: true,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: "Senha",
                  labelStyle: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                  ),
                ),
                style: TextStyle(
                  fontSize: 20,
                  color: Theme.of(context).primaryColor,
                ),
                validator: (value) {
                  if (value.isEmpty) {
                    return "Senha inválida";
                  }
                  return null;
                },
                onSaved: (val) {
                  password = val;
                },
              ),
              SizedBox(
                height: 10,
              ),
              FlatButton(
                child: Text("Entrar"),
                onPressed: () {
                  if (_formKey.currentState.validate()) {
                    _formKey.currentState.save();
                    authenticate(context);
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  authenticate(BuildContext context) async {
    var bloc = Provider.of<UserBloc>(context);

    var user = await bloc.authenticate(
      new UserModel(
        username: username,
        password: password,
      ),
    );

    if (user != null) {
      Navigator.pop(context);
      return;
    }

    _scaffoldKey.currentState
        .showSnackBar(SnackBar(content: Text("Usuário ou senha invalidos")));
  }
}
