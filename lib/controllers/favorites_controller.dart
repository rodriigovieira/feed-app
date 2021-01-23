import 'package:flutter/material.dart';
import 'package:joyjet_test/models/article_page_data_model.dart';

class FavoritesController extends ChangeNotifier {
  List<ArticlePageDataModel> favorites = [];

  void toggleFavorite(ArticlePageDataModel favorite) {
    if (isFavorite(favorite)) {
      favorites =
          favorites.where((value) => value.title != favorite.title).toList();
    } else {
      List<ArticlePageDataModel> newList = [...favorites, favorite];
      favorites = newList;
    }

    notifyListeners();
  }

  bool isFavorite(ArticlePageDataModel articleData) {
    bool isArticleFavorite = favorites
        .where((value) => value.title == articleData.title)
        ?.isNotEmpty;

    return isArticleFavorite;
  }
}
