import 'package:flutter/material.dart';
import 'package:loja_bloc_provider/blocs/cart.bloc.dart';
import 'package:loja_bloc_provider/ui/android/pages/account.page.dart';
import 'package:loja_bloc_provider/ui/android/pages/cart.page.dart';
import 'package:loja_bloc_provider/ui/android/pages/home.page.dart';
import 'package:provider/provider.dart';

class TabsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<CartBloc>(context);

    return Scaffold(
      body: TabBarView(
        children: <Widget>[
          HomePage(),
          CartPage(),
          AccountPage(),
        ],
      ),
      bottomNavigationBar: TabBar(
        tabs: <Widget>[
          Tab(
            icon: Icon(Icons.home),
          ),
          Tab(
            icon: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(Icons.shopping_cart),
                Container(
                  alignment: Alignment.center,
                  width: 18,
                  height: 18,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.all(
                      Radius.circular(5),
                    ),
                  ),
                  child: Text(
                    bloc.cart.length.toString(),
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Tab(
            icon: Icon(Icons.perm_identity),
          )
        ],
        labelColor: Theme.of(context).primaryColor,
        unselectedLabelColor: Colors.black38,
        indicatorSize: TabBarIndicatorSize.label,
        indicatorPadding: EdgeInsets.all(5.0),
        indicatorColor: Theme.of(context).primaryColor,
      ),
    );
  }
}
