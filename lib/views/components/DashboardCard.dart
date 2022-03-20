import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';
import 'package:immo/controllers/ScreenController.dart';
import 'package:immo/functions.dart' as functions;
import 'package:immo/models/Cache.dart';
import 'package:immo/views/components/CacheValue.dart';
import 'package:immo/views/components/MyText.dart';

class DashboardCard extends StatefulWidget {
  final String value;
  final String title;
  final String subtitle;
  final Color textColor;
  var backgroundColor;
  final String icon;
  final subtitleIcon;
  final double iconSize;
  final double subtitleIconSize;
  final Color iconColor;
  final Color subtitleIconColor;
  final Radius borderRadius;
  final void Function()? onPressed;
  final String cardName;
  DashboardCard({
    Key? key,
    required this.value,
    required this.title,
    required this.subtitle,
    required this.subtitleIcon,
    required this.cardName,
    this.textColor = Colors.white,
    this.backgroundColor = const Color.fromRGBO(60, 141, 188, 1),
    required this.icon,
    this.iconSize = 70,
    this.subtitleIconSize = 20,
    this.iconColor = Colors.black,
    this.subtitleIconColor = Colors.white,
    this.borderRadius = const Radius.circular(20),
    this.onPressed,
    // default card value
  }) : super(key: key);

  @override
  DashboardCardState createState() => DashboardCardState();
}

class DashboardCardState extends State<DashboardCard> {
  @override
  Widget build(BuildContext context) {
    List<double> screenSize = ScreenController.getScreenSize(context);
    return DelayedDisplay(
      delay: Duration(milliseconds: 500),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          gradient: widget.backgroundColor,
        ),
        child: ElevatedButton(
          onPressed: widget.onPressed,
          style: ButtonStyle(
            padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                EdgeInsets.symmetric(horizontal: 0, vertical: 0)),
            backgroundColor:
                MaterialStateProperty.all<Color>(Colors.transparent), // ! debug
            side: MaterialStateProperty.all<BorderSide>(
                BorderSide(color: Colors.transparent)),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          child: Container(
            width: screenSize[0],
            height: 150,
            decoration: BoxDecoration(
              //color: widget.backgroundColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
              child: Stack(
                alignment: Alignment.centerLeft,
                children: [
                  //todo: Icon
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Image.asset(
                        widget.icon,
                        width: widget.iconSize,
                        height: widget.iconSize,
                        fit: BoxFit.contain,
                        color: widget.iconColor,
                        //colorBlendMode: BlendMode.colorBurn,
                      ),
                    ],
                  ),
                  //todo: Texts
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      /*
                      //todo: Value
                      (ScreenController.actualView != "LoginView")
                          ? FutureBuilder<Map<String, int>>(
                              //future: this.getDashboardDatas(),
                              builder: (cardContext, snapshot) {
                                if (snapshot.hasData) {
                                  // ? Check the server dashboard datas
                                  if (Cache.isCached)
                                    print(
                                        '[CACHE] Cache datas get successfully !');
                                  else
                                    print(
                                        '[SERVER] Dashboard datas getting from the server');

                                  return (snapshot.data![widget.cardName] ==
                                          null)
                                      ? CacheValue(cardName: widget.cardName)
                                      : MyText(
                                          text: snapshot.data![widget.cardName]
                                              .toString(),
                                          color: Colors.white,
                                          fontSize: 40,
                                          fontWeight: FontWeight.w800,
                                        );
                                } else if (snapshot.hasError) {
                                  functions.errorSnackbar(
                                    context: context,
                                    message: 'Erreur sur le tableau de bord',
                                  );
                                  //todo: In snapshot error case get cache datas
                                  return CacheValue(cardName: widget.cardName);
                                }
                                //todo: Loading cache indicator
                                return CacheValue(cardName: widget.cardName);
                              },
                            )
                          : Container(),
                          */
                      //todo: Title
                      Text(
                        widget.title,
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          color: widget.textColor,
                          //color: Colors.black,
                          fontSize: 18,
                        ),
                      ),
                      //todo: Value
                      Text(
                        widget.value,
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          color: widget.textColor,
                          fontSize: 24,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      //todo: Change value
                      Row(
                        children: [
                          (widget.subtitleIcon is String)
                              ? Image.asset(
                                  widget.subtitleIcon,
                                  width: widget.subtitleIconSize,
                                  height: widget.subtitleIconSize,
                                  fit: BoxFit.contain,
                                  color: widget.subtitleIconColor,
                                  //colorBlendMode: BlendMode.colorBurn,
                                )
                              : widget.subtitleIcon,
                          SizedBox(width: 10),
                          Text(
                            widget.subtitle,
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              color: widget.textColor,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  //todo: See More Button
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        //todo: Text
                        Text(
                          'Voir',
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            color: widget.textColor,
                            fontSize: 14,
                          ),
                        ),
                        SizedBox(width: 5),
                        //todo: Icon
                        Image.asset(
                          'assets/img/icons/previous.png',
                          width: 20,
                          height: 20,
                          fit: BoxFit.contain,
                          color: widget.iconColor,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
/*
  //todo: Get datas from API
  Future<Map<String, int>> getDashboardDatas() async {
    // ? Load dashboard datas only when the user press reload button
    if (ScreenController.actualView != "LoginView") {
      if (ScreenController.reloadDashboard) {
        print('Getting server datas for the dashboard cards...');
        // init API instance
        Api api = Api();
        // call API method getDashboardDatas
        Map<String, int> dashboardDatas = await api.getDashboardStats(context);
        Cache.isCached = false;
        // return dashboard datas
        return dashboardDatas;
      } else {
        // ? in another case load the cache datas
        print('Getting cache datas for the dashboard cards...');
        Cache.isCached = true;
        return {
          'getClients': Cache.clients!,
          'getArticles': Cache.articles!,
          'getFournisseurs': Cache.fournisseurs!,
          'getCommandes': Cache.commandes!,
        };
      }
    } else {
      return {};
    }
  }
  */
}
