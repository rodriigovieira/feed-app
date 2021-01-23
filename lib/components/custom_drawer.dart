import 'package:flutter/material.dart';
import 'package:joyjet_test/pages/FavoritesPage/favorites_page.dart';
import 'package:joyjet_test/pages/HomePage/home_page.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String currentRouteName = ModalRoute.of(context)?.settings?.name;

    return Drawer(
      child: Container(
        color: Color(0xff434343),
        child: SafeArea(
          bottom: false,
          child: Column(
            children: [
              Expanded(
                child: Column(
                  children: [
                    ListTile(
                      title: Text(
                        "Home",
                        style: TextStyle(
                          fontSize: 24,
                          fontFamily: "Helvetica",
                          color: Colors.white,
                        ),
                      ),
                      onTap: () {
                        if (currentRouteName == HomePage.pageName) {
                          Navigator.pop(context);
                          return;
                        }

                        Navigator.of(context).pushReplacementNamed(
                          HomePage.pageName,
                        );
                      },
                    ),
                    ListTile(
                      title: Text(
                        "Favorites",
                        style: TextStyle(
                          fontSize: 24,
                          fontFamily: "Helvetica",
                          color: Colors.white,
                        ),
                      ),
                      onTap: () {
                        if (currentRouteName == FavoritesPage.pageName) {
                          Navigator.pop(context);
                          return;
                        }

                        Navigator.of(context).pushReplacementNamed(
                          FavoritesPage.pageName,
                        );
                      },
                    ),
                  ],
                ),
              ),
              Container(
                height: 180,
                child: DrawerHeader(
                  margin: EdgeInsets.zero,
                  decoration: BoxDecoration(
                    border: Border(
                      top: BorderSide(
                        color: Colors.black.withOpacity(0.5),
                        width: 0.5,
                      ),
                    ),
                  ),
                  child: Container(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.centerRight,
                          child: Image.asset("assets/ic_joyjet.png"),
                        ),
                        Expanded(
                          child: Align(
                            alignment: Alignment.bottomLeft,
                            child: Text(
                              "JOYJET",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                                fontSize: 24,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
