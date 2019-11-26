import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoppingcartapp/blocs/cart.bloc.dart';
import 'package:shoppingcartapp/blocs/home.bloc.dart';
import 'package:shoppingcartapp/ui/android/pages/tabs.page.dart';

import 'blocs/theme.bloc.dart';
import 'blocs/user.bloc.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
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
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final ThemeBloc bloc = Provider.of<ThemeBloc>(context);

    return MaterialApp(
      title: 'Shopping Cart',
      debugShowCheckedModeBanner: false,
      theme: bloc.theme,
      //home: TabsPage(),//IOS-alterar import de android para ios
      home: DefaultTabController(
        length: 3,
        child: TabsPage(),
      ),
    );
  }
}
