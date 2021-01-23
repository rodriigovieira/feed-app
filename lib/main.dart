import 'package:flutter/material.dart';
import 'package:joyjet_test/controllers/favorites_controller.dart';
import 'package:joyjet_test/controllers/home_controller.dart';
import 'package:joyjet_test/pages/ArticlePage/article_page.dart';
import 'package:joyjet_test/pages/FavoritesPage/favorites_page.dart';
import 'package:joyjet_test/pages/HomePage/home_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<FavoritesController>(
          create: (_) => FavoritesController(),
        ),
        ChangeNotifierProvider<HomeController>(
          create: (_) => HomeController(),
        ),
      ],
      child: MaterialApp(
        theme: ThemeData(fontFamily: 'Montserrat'),
        routes: {
          HomePage.pageName: (_) => HomePage(),
          FavoritesPage.pageName: (_) => FavoritesPage(),
          ArticlePage.pageName: (_) => ArticlePage(),
        },
        debugShowCheckedModeBanner: false,
        home: HomePage(),
      ),
    );
  }
}
