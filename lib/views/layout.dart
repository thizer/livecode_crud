import 'package:flutter/material.dart';
import 'package:getflutter/getflutter.dart';

class Layout {
  static Widget render(
    BuildContext context, {
    Widget child,
    Widget floatingActionButton,
  }) {
    return Scaffold(
      appBar: GFAppBar(
        leading: GFIconButton(
          icon: Icon(
            Icons.message,
            color: Colors.white,
          ),
          onPressed: () {},
          type: GFButtonType.transparent,
        ),
        searchBar: true,
        title: Text(
          "Livecode Feat. Fluttership",
          style: Theme.of(context).textTheme.headline6.copyWith(
                color: Colors.white,
                fontSize: 16,
              ),
        ),
        actions: <Widget>[
          GFIconButton(
            icon: Icon(
              Icons.favorite,
              color: Colors.white,
            ),
            onPressed: () {},
            type: GFButtonType.transparent,
          ),
        ],
      ),
      backgroundColor: Colors.grey[200],
      body: Center(
        child: child,
      ),
      floatingActionButton: floatingActionButton,
    );
  }
}
