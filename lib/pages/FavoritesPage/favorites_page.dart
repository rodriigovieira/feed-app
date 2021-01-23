import 'package:flutter/material.dart';
import 'package:joyjet_test/components/custom_app_bar.dart';
import 'package:joyjet_test/components/custom_drawer.dart';
import 'package:joyjet_test/components/section_card.dart';
import 'package:joyjet_test/controllers/favorites_controller.dart';
import 'package:joyjet_test/models/article_page_data_model.dart';
import 'package:provider/provider.dart';

class FavoritesPage extends StatelessWidget {
  static const String pageName = "/favorites_page";

  const FavoritesPage({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: CustomDrawer(),
      appBar: CustomAppBar(title: "Favorites"),
      body: Consumer<FavoritesController>(
        builder: (
          _,
          FavoritesController controller,
          __,
        ) {
          final List<ArticlePageDataModel> favorites = controller.favorites;

          return ListView.builder(
            itemCount: favorites.length,
            itemBuilder: (BuildContext context, int index) {
              return SectionCard(
                category: favorites[index]?.category,
                title: favorites[index]?.title,
                subtitle: favorites[index]?.subtitle,
                listOfImages: favorites[index]?.galery,
              );
            },
          );
        },
      ),
    );
  }
}
