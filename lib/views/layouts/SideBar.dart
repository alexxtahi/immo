import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:immo/controllers/ScreenController.dart';
import 'package:immo/views/components/SideBarTile.dart';

class SideBar extends StatefulWidget {
  // todo: Constructor
  SideBar();

  @override
  SideBarState createState() => SideBarState();
}

class SideBarState extends State<SideBar> {
  @override
  Widget build(BuildContext context) {
    List<double> screenSize = ScreenController.getScreenSize(context);
    return SizedBox(
      width: screenSize[0] * 0.8,
      //height: hauteur,
      child: Drawer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              height: 200.0,
              child: DrawerHeader(
                //duration: Duration(milliseconds: 1000),
                decoration: BoxDecoration(
                  color: Color.fromRGBO(111, 50, 50, 1),
                ),
                child: TextButton(
                  onPressed: () {},
                  child: Row(
                    children: <Widget>[
                      Container(
                        width: 150.0,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'Utilisateur',
                              style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontSize: 20.0,
                                fontWeight: FontWeight.w800,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              'Acheteur',
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontSize: 16.0,
                                //fontWeight: FontWeight.w800,
                                color: Color.fromRGBO(161, 100, 100, 1),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            SideBarTile(
              title: 'Menu du restaurant',
              icon: 'sidebarMenuIcon',
            ),
            SideBarTile(
              title: 'Planning des employés',
              icon: 'sidebarPlanningIcon',
            ),
            SideBarTile(
              title: 'Assistance',
              icon: 'sidebarAssistIcon',
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Align(
                alignment: Alignment.bottomCenter,
                heightFactor: 10,
                child: OutlinedButton(
                  onPressed: () {
                    print("Vous allez quitter l'application");
                    SystemNavigator.pop();
                  },
                  child: const Text(
                    "Quitter",
                    style: TextStyle(
                        color: Colors.red,
                        fontFamily: 'Montserrat',
                        fontSize: 14,
                        fontWeight: FontWeight.bold),
                  ),
                  style: ButtonStyle(
                    minimumSize: MaterialStateProperty.all<Size>(
                        Size(screenSize[0], 40.0)),
                    foregroundColor:
                        MaterialStateProperty.all<Color>(Colors.white),
                    backgroundColor: MaterialStateProperty.all<Color>(
                        Color.fromRGBO(255, 0, 0, 0.1)),
                    side: MaterialStateProperty.all<BorderSide>(
                        BorderSide(color: Colors.red)),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
