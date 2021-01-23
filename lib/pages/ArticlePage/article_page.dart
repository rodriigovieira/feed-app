import 'package:flutter/material.dart';
import 'package:joyjet_test/components/network_image_with_loading.dart';
import 'package:joyjet_test/controllers/favorites_controller.dart';
import 'package:joyjet_test/models/article_page_data_model.dart';
import 'package:provider/provider.dart';

class ArticlePage extends StatelessWidget {
  static const String pageName = "/article_page";

  const ArticlePage({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ArticlePageDataModel arguments =
        ModalRoute.of(context)?.settings?.arguments as ArticlePageDataModel;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: IconButton(
          icon: new Image.asset("assets/ic_back.png"),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          Consumer<FavoritesController>(builder: (_, controller, __) {
            bool isFavorite = controller.isFavorite(arguments);

            return IconButton(
              icon: isFavorite
                  ? Icon(Icons.star, size: 32)
                  : Image.asset("assets/ic_star.png"),
              onPressed: () {
                controller.toggleFavorite(arguments);
              },
            );
          })
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              NetworkImageWithLoading(
                imageUrl: arguments?.galery[0],
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 15,
                  top: 10,
                  bottom: 5,
                ),
                child: Text(
                  "${arguments?.title?.toUpperCase()}",
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    color: Color(0xff434343),
                    fontSize: 20,
                    letterSpacing: 3,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 15,
                ),
                child: Text(
                  "${arguments?.category}",
                  style: TextStyle(
                    color: Color(0xff4A90E2),
                    fontSize: 14,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 15,
                ),
                child: Text(
                  "${arguments?.subtitle}",
                  style: TextStyle(
                    color: Color(0xff67686D),
                    fontSize: 16,
                    fontWeight: FontWeight.w300,
                    height: 1.5,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
