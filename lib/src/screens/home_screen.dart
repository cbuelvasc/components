import 'package:components/theme.dart';
import 'package:flutter/material.dart';

import 'package:components/src/providers/menu_provider.dart';
import 'package:components/src/utils/icon_string_util.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.panelColor,
      appBar: AppBar(
        title: Row(
          children: [
            Image.asset(
              'assets/images/logo.png',
              fit: BoxFit.contain,
              height: 32,
            ),
            Container(
              padding: EdgeInsets.all(8.0),
              child: Text('Components'),
            ),
          ],
        ),
        backgroundColor: AppTheme.panelColor,
        elevation: 10.0,
      ),
      body: _createList(),
    );
  }

  Widget _createList() {
    return FutureBuilder(
      initialData: [],
      builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
        return ListView(
          children: _createItems(snapshot.data, context),
        );
      },
      future: menuProvider.loadData(),
    );
  }

  List<Widget> _createItems(List<dynamic>? data, BuildContext context) {
    final List<Widget> _list = <Widget>[];
    data!.forEach((item) {
      _list
        ..add(
          ListTile(
            title: Text(item['text']),
            subtitle: Text('Description of: ' + item['text']),
            leading: getIcon(item['icon']),
            trailing: Icon(
              Icons.keyboard_arrow_right_outlined,
              color: AppTheme.greenColor4,
            ),
            onTap: () {
              Navigator.pushNamed(context, item['route']);
            },
          ),
        )
        ..add(Divider());
    });
    return _list;
  }
}
