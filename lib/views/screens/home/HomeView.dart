import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:immo/controllers/ScreenController.dart';
import 'package:immo/views/components/MyText.dart';
import 'package:immo/views/layouts/DashboardGridViewLayout.dart';

class HomeView extends StatefulWidget {
  HomeView({Key? key}) : super(key: key);
  @override
  HomeViewState createState() => HomeViewState();
}

class HomeViewState extends State<HomeView> {
  ///The controller of sliding up panel
  GlobalKey scaffold = GlobalKey();
  ScrollController scrollController = ScrollController();
  ScrollController gridViewScrollController = ScrollController();

  //todo: Method called when the view is launching
  @override
  void initState() {
    super.initState();
    /*
    // ? Set isConnected variable to true
    if (Auth.user != null)
      Auth.user!.isConnected = true;
    else
      print("[LOG] HomeView -> User not connected");
      */
    // ? Launching configs
    if (ScreenController.actualView != "LoginView") {
      ScreenController.actualView = "HomeView";
      ScreenController.isChildView = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    List<double> screenSize = ScreenController.getScreenSize(context);
    // Change system UI properties
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarBrightness: Brightness.dark,
        statusBarColor: Colors.transparent,
        systemNavigationBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
    );
    // lock screen orientation
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    // Return building Scaffold
    return Scaffold(
      key: scaffold,
      appBar: AppBar(
        title: MyText(
          text: 'iMMo',
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
        centerTitle: true,
        backgroundColor: Theme.of(context).primaryColor,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.menu_rounded),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.settings_outlined),
            onPressed: () {},
          ),
          SizedBox(width: 10),
        ],
      ),
      drawer: Sidebar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            children: [
              Expanded(
                child: Container(
                  width: screenSize[0],
                  child: SingleChildScrollView(
                    controller: this.scrollController,
                    scrollDirection: Axis.vertical,
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              //todo: Dashboard
                              DashboardGridViewLayout(
                                elementsPerLine: 1,
                                gridViewScrollController:
                                    this.gridViewScrollController,
                                childAspectRatio: 3,
                                mainAxisSpacing: 10,
                              ),
                            ],
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
