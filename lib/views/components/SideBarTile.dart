import 'package:flutter/material.dart';

class SideBarTile extends StatelessWidget {
  // todo: Properties
  final String title;
  final String icon;
  // todo: Constructor
  SideBarTile({this.title = 'Menu', this.icon = 'assets'});
  // todo: Build method
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.asset(
        this.icon,
        width: 25,
        height: 25,
      ),
      title: Text(
        this.title,
        style: TextStyle(
          fontFamily: 'Montserrat',
        ),
      ),
      onTap: () {},
    );
  }
}
