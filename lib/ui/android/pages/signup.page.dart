import 'package:flutter/material.dart';
import 'package:loja_bloc_provider/blocs/user.bloc.dart';
import 'package:loja_bloc_provider/models/user.model.dart';
import 'package:loja_bloc_provider/ui/shared/validators/custom.validators.dart';
import 'package:provider/provider.dart';

class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  var user = new UserModel();

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
                  labelText: "Nome",
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
                    return "Nome inválido";
                  }
                  return null;
                },
                onSaved: (val) => user.name = val,
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelText: "E-mail",
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
                validator: (value) => CustomValidators.isEmail(value),
                onSaved: (val) => user.email = val,
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: "Usuário",
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
                onSaved: (val) => user.password = val,
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
                onSaved: (val) => user.password = val,
              ),
              SizedBox(
                height: 10,
              ),
              FlatButton(
                child: Text("Cadastrar"),
                onPressed: () {
                  if (_formKey.currentState.validate()) {
                    _formKey.currentState.save();
                    create(context);
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  create(BuildContext context) async {
    var bloc = Provider.of<UserBloc>(context);

    var res = await bloc.authenticate(user);

    if (res == null) {
      _scaffoldKey.currentState.showSnackBar(
          SnackBar(content: Text("Não foi possível realizar seu cadastro")));
    } else {
      Navigator.pop(context);
      _scaffoldKey.currentState
          .showSnackBar(SnackBar(content: Text("Bem-vindo! Autentique-se")));
    }
  }
}
