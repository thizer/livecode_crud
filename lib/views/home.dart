import 'package:flutter/material.dart';
import 'package:getflutter/getflutter.dart';
import 'package:livecode_crud/views/criar_page.dart';
import 'package:livecode_crud/views/layout.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Layout.render(
      context,
      child: ListView.builder(
        itemCount: 8,
        itemBuilder: (BuildContext context, int i) {
          return GFListTile(
            avatar: GFAvatar(
              backgroundImage: NetworkImage('https://i.picsum.photos/id/$i/200/300.jpg'),
              shape: GFAvatarShape.standard,
            ),
            color: Colors.white,
            margin: EdgeInsets.fromLTRB(10, (i == 0) ? 10 : 0, 10, 10),
            titleText: 'Um novo item',
            subtitleText: 'Chegou chegando...',
            icon: Row(
              children: <Widget>[
                Icon(
                  Icons.edit,
                  color: Colors.purple[300],
                ),
                Icon(
                  Icons.delete,
                  color: Colors.red[300],
                )
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed(CriarPage.tag);
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
