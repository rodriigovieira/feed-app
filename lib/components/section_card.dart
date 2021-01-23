import 'package:flutter/material.dart';
import 'package:joyjet_test/components/network_image_with_loading.dart';
import 'package:joyjet_test/models/article_page_data_model.dart';
import 'package:joyjet_test/pages/ArticlePage/article_page.dart';

class SectionCard extends StatefulWidget {
  final String title;
  final String subtitle;
  final String category;
  final List<String> listOfImages;

  const SectionCard({
    Key key,
    @required this.title,
    @required this.subtitle,
    @required this.category,
    @required this.listOfImages,
  }) : super(key: key);

  @override
  _SectionCardState createState() => _SectionCardState();
}

class _SectionCardState extends State<SectionCard> {
  void openArticle() {
    ArticlePageDataModel item = ArticlePageDataModel(
      title: widget.title,
      subtitle: widget.subtitle,
      category: widget.category,
      galery: widget.listOfImages,
    );

    Navigator.of(context).pushNamed(
      ArticlePage.pageName,
      arguments: item,
    );
  }

  PageController pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: openArticle,
      child: Stack(
        alignment: Alignment.bottomLeft,
        children: <Widget>[
          Container(
            height: 300,
            child: PageView(
              controller: pageController,
              children: <Widget>[
                ...widget.listOfImages?.map((String imageUrl) {
                  return NetworkImageWithLoading(
                    imageUrl: imageUrl,
                  );
                })
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${widget.title?.toUpperCase()}",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 1.5,
                    fontSize: 14,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 6, bottom: 2),
                  child: Text(
                    "${widget.subtitle}",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w300,
                      fontSize: 14,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            left: 0,
            top: 0,
            bottom: 0,
            child: Align(
              child: InkWell(
                onTap: () {
                  pageController.previousPage(
                    curve: Curves.easeIn,
                    duration: Duration(milliseconds: 400),
                  );
                },
                child: Image.asset(
                  "assets/arrow_left.png",
                  height: 80,
                ),
              ),
            ),
          ),
          Positioned(
            right: 0,
            top: 0,
            bottom: 0,
            child: Align(
              child: InkWell(
                onTap: () {
                  pageController.nextPage(
                    curve: Curves.easeIn,
                    duration: Duration(milliseconds: 400),
                  );
                },
                child: Image.asset(
                  "assets/arrow_right.png",
                  height: 80,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
