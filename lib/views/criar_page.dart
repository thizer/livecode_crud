import 'package:flutter/material.dart';
import 'package:livecode_crud/views/layout.dart';

class CriarPage extends StatelessWidget {
  static String tag = 'criar-page';

  @override
  Widget build(BuildContext context) {
    var content = Column(
      children: <Widget>[
        Container(
          height: 100,
          color: Colors.deepPurple[300],
          child: Center(
            child: Text(
              'Criar novo item',
              style: Theme.of(context).textTheme.headline6.copyWith(
                    color: Colors.white,
                  ),
            ),
          ),
        ),
        TextFormField(),
      ],
    );

    return Layout.render(
      context,
      child: content,
    );
  }
}
