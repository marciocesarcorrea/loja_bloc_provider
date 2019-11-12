import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loja_bloc_provider/ui/ios/pages/home.page.dart';

class TabsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        backgroundColor: CupertinoColors.lightBackgroundGray,
        items: [
          BottomNavigationBarItem(
            title: Text("Home"),
            icon: Icon(CupertinoIcons.home),
          ),
          BottomNavigationBarItem(
            title: Text("Carrinho"),
            icon: Icon(CupertinoIcons.shopping_cart),
          ),
        ],
      ),
      tabBuilder: (context, index) {
        return CupertinoTabView(
          builder: (context) {
            switch (index) {
              case 0:
                return HomePage();
                break;
              case 1:
                return Container(
                  color: Colors.red,
                );
                break;
              default:
                return Container(
                  color: Colors.green,
                );
            }
          },
        );
      },
    );
  }
}
