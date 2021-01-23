import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:joyjet_test/controllers/favorites_controller.dart';
import 'package:joyjet_test/controllers/home_controller.dart';
import 'package:joyjet_test/models/article_page_data_model.dart';
import 'package:joyjet_test/pages/ArticlePage/article_page.dart';
import 'package:provider/provider.dart';

main() {
  final mockFavorite = ArticlePageDataModel(
    category: "test category",
    subtitle: "test subtitle",
    title: "test title",
  );

  group("testing FavoritesController operations", () {
    test("should add and remove favorite", () {
      final FavoritesController controller = FavoritesController();

      controller.toggleFavorite(mockFavorite);

      expect(controller.favorites.length, 1);

      controller.toggleFavorite(mockFavorite);

      expect(controller.favorites.length, 0);
    });

    test("should check whether article is favorite or not", () {
      final FavoritesController controller = FavoritesController();

      controller.toggleFavorite(mockFavorite);

      expect(controller.isFavorite(mockFavorite), true);

      controller.toggleFavorite(mockFavorite);

      expect(controller.isFavorite(mockFavorite), false);
    });
  });
}
