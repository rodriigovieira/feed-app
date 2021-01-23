import 'package:flutter/material.dart';
import 'package:joyjet_test/components/custom_app_bar.dart';
import 'package:joyjet_test/components/custom_drawer.dart';
import 'package:joyjet_test/components/section_card.dart';
import 'package:joyjet_test/components/section_header.dart';
import 'package:joyjet_test/controllers/home_controller.dart';
import 'package:joyjet_test/models/api_response_model.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  static const String pageName = "/home_page";

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: CustomDrawer(),
      appBar: CustomAppBar(title: "Digital Space"),
      body: Consumer<HomeController>(builder: (
        _,
        HomeController controller,
        __,
      ) {
        final List<ApiResponseModel> list = controller.list;

        if (controller.hasError) {
          return Center(
            child: Text(
              "There was an error fetching the data. Please check your network connection or try again later.",
            ),
          );
        }

        if (controller.isLoading) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }

        return ListView.builder(
          padding: EdgeInsets.zero,
          itemCount: list.length,
          itemBuilder: (BuildContext context, int index) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                SectionHeader(label: list[index]?.category),
                ...list[index]?.items?.map(
                  (Items item) {
                    return SectionCard(
                      category: list[index]?.category,
                      title: item?.title,
                      subtitle: item?.description,
                      listOfImages: item?.galery,
                    );
                  },
                )
              ],
            );
          },
        );
      }),
    );
  }
}
