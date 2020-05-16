import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:getflutter/getflutter.dart';
import 'package:livecode_crud/controller/home_controller.dart';
import 'package:livecode_crud/views/criar_page.dart';
import 'package:livecode_crud/views/layout.dart';

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var controller = HomeController();
    controller.loadData();

    return Layout.render(
      context,
      child: Observer(
        builder: (BuildContext context) {
          return RefreshIndicator(
            onRefresh: controller.loadData,
            child: ListView.builder(
              itemCount: controller.data.length == 0 ? 1 : controller.data.length,
              itemBuilder: (BuildContext context, int i) {
                if (controller.data.length == 0) {
                  return Center(
                    child: Text(
                      'Nenhum item',
                      style: Theme.of(context).textTheme.headline6.copyWith(
                            fontSize: 24,
                          ),
                    ),
                  );
                }

                var item = controller.data[i];

                return Dismissible(
                  key: ValueKey(item.id),
                  direction: DismissDirection.endToStart,
                  background: Container(
                    color: Colors.deepPurple[300],
                    margin: EdgeInsets.fromLTRB(10, (i == 0 ? 10 : 0), 10, 10),
                    padding: EdgeInsets.only(right: 20),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Icon(
                        Icons.delete,
                        color: Colors.white,
                        size: 28,
                      ),
                    ),
                  ),
                  confirmDismiss: (direction) async {
                    return await showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('Tem certeza?'),
                          content: Text('O item será deletado e esta ação não poderá ser desfeita.'),
                          actions: <Widget>[
                            FlatButton(
                              onPressed: () => Navigator.of(context).pop(false),
                              child: Text('Cancelar'),
                            ),
                            FlatButton(
                              onPressed: () => Navigator.of(context).pop(true),
                              color: Colors.red,
                              child: Text('OK'),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  onDismissed: (direction) async {
                    await controller.removeItem(item.id);

                    Scaffold.of(context).showSnackBar(SnackBar(
                      content: Text('Item #${item.id} removido pra sempre!'),
                    ));
                  },
                  child: GFListTile(
                    avatar: GFAvatar(
                      backgroundImage: NetworkImage(item.avatar),
                      shape: GFAvatarShape.standard,
                    ),
                    color: Colors.white,
                    margin: EdgeInsets.fromLTRB(10, (i == 0) ? 10 : 0, 10, 10),
                    titleText: item.titulo,
                    subtitleText: '#${item.id}',
                    icon: Icon(
                      Icons.edit,
                      color: Colors.purple[300],
                    ),
                  ),
                );
              },
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
