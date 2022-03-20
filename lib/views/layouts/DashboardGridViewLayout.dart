import 'package:flutter/material.dart';
import 'package:immo/controllers/ScreenController.dart';
import 'package:immo/views/components/DashboardCard.dart';

class DashboardGridViewLayout extends StatefulWidget {
  final ScrollController gridViewScrollController;
  final EdgeInsets padding;
  final int elementsPerLine;
  final double crossAxisSpacing;
  final double mainAxisSpacing;
  final Axis scrollDirection;
  final double childAspectRatio;

  DashboardGridViewLayout({
    Key? key,
    required this.gridViewScrollController,
    required this.elementsPerLine,
    required this.childAspectRatio,
    this.crossAxisSpacing = 2,
    this.mainAxisSpacing = 2,
    this.scrollDirection = Axis.vertical,
    this.padding = const EdgeInsets.all(0),
  }) : super(key: key);

  @override
  DashboardGridViewLayoutState createState() => DashboardGridViewLayoutState();
}

class DashboardGridViewLayoutState extends State<DashboardGridViewLayout> {
  @override
  Widget build(BuildContext context) {
    List<double> screenSize = ScreenController.getScreenSize(context);
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxWidth: screenSize[0],
      ),
      child: GridView.count(
        controller: widget.gridViewScrollController,
        crossAxisCount: widget.elementsPerLine,
        crossAxisSpacing: widget.crossAxisSpacing,
        mainAxisSpacing: widget.mainAxisSpacing,
        childAspectRatio: widget.childAspectRatio,
        shrinkWrap: true,
        //physics:BouncingScrollPhysics(),
        padding: widget.padding,
        scrollDirection: widget.scrollDirection,
        children: [
          DashboardCard(
            value: '34',
            title: 'Vos biens immobiliers',
            subtitle: '5 Nouveaux biens acquis',
            icon: 'assets/img/icons/bank.png',
            subtitleIcon: 'assets/img/icons/company.png',
            cardName: 'getClients',
            iconColor: Colors.white,
            backgroundColor: LinearGradient(
              colors: [
                Color.fromRGBO(102, 78, 202, 1),
                Color.fromRGBO(151, 130, 233, 1),
              ],
            ),
            onPressed: () {
              print('Dashboard card Client appuyé !');
            },
          ),
          DashboardCard(
            value: '100 000 000 FCFA',
            title: 'Valeur du portefeuille',
            subtitle: '2% de bénéfice',
            icon: 'assets/img/icons/spending.png',
            subtitleIcon: 'assets/img/icons/dollar.png',
            cardName: 'getArticles',
            iconColor: Colors.white,
            backgroundColor: LinearGradient(
              colors: [
                Color.fromRGBO(33, 150, 108, 1),
                Color.fromRGBO(48, 210, 137, 1),
              ],
            ),
            onPressed: () {
              print('Dashboard card Article appuyé !');
            },
          ),
          DashboardCard(
            value: '1 350 000 FCFA',
            title: 'Revenus mensuels',
            subtitle: 'En hausse dans ce mois',
            icon: 'assets/img/icons/spending-movement.png',
            subtitleIcon: Icon(
              Icons.arrow_circle_up_rounded,
              color: Colors.white,
            ),
            cardName: 'getCommandes',
            iconColor: Colors.white,
            backgroundColor: LinearGradient(
              colors: [
                Color.fromRGBO(251, 84, 32, 1),
                Color.fromRGBO(244, 165, 0, 1),
              ],
            ),
            onPressed: () {
              print('Dashboard card Commande appuyé !');
            },
          ),
          DashboardCard(
            value: '99+',
            title: 'Le marché immobilier',
            subtitle: 'Les nouveautés',
            icon: 'assets/img/icons/company.png',
            subtitleIcon: 'assets/img/icons/discount.png',
            cardName: 'getFournisseurs',
            iconColor: Colors.white,
            backgroundColor: LinearGradient(
              colors: [
                Color.fromRGBO(92, 116, 224, 1),
                Color.fromRGBO(69, 194, 250, 1),
              ],
            ),
            onPressed: () {
              print('Dashboard card Fournisseur appuyé !');
            },
          ),
        ],
      ),
    );
  }
}
