import 'package:flutter/material.dart';

import '../../theme.dart';

class CardScreen extends StatelessWidget {
  const CardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.panelColor,
      appBar: AppBar(
        title: Text('Cards'),
        backgroundColor: AppTheme.panelColor,
        elevation: 10.0,
      ),
      body: ListView(
        padding: EdgeInsets.all(10.0),
        children: <Widget>[
          _cardTypeOne(),
          SizedBox(height: 30.0),
          _cardTypeTwo(),
          SizedBox(height: 30.0),
          _cardTypeOne(),
          SizedBox(height: 30.0),
          _cardTypeTwo(),
          SizedBox(height: 30.0),
          _cardTypeOne(),
          SizedBox(height: 30.0),
          _cardTypeTwo(),
          SizedBox(height: 30.0),
          _cardTypeOne(),
          SizedBox(height: 30.0),
          _cardTypeTwo(),
          SizedBox(height: 30.0),
          _cardTypeOne(),
          SizedBox(height: 30.0),
          _cardTypeTwo(),
          SizedBox(height: 30.0),
        ],
      ),
    );
  }

  Widget _cardTypeOne() {
    return Card(
      elevation: 10.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      child: Column(
        children: <Widget>[
          ListTile(
            leading: Icon(
              Icons.photo_album,
              color: AppTheme.greenColor4,
            ),
            title: Text('Title of card'),
            subtitle: Text('Description of card'),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              TextButton(
                  onPressed: () {},
                  child: Text(
                    'Cancel',
                    style: TextStyle(color: AppTheme.greenColor4),
                  )),
              TextButton(
                  onPressed: () {},
                  child: Text(
                    'Ok',
                    style: TextStyle(color: AppTheme.greenColor4),
                  )),
            ],
          )
        ],
      ),
    );
  }

  Widget _cardTypeTwo() {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: Colors.white,
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Colors.black26,
                blurRadius: 10.0,
                spreadRadius: 2.0,
                offset: Offset(2.0, 10.0))
          ]),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10.0),
        child: Container(
          child: Column(
            children: <Widget>[
              FadeInImage(
                placeholder: AssetImage('assets/images/jar-loading.gif'),
                image: NetworkImage(
                    'https://i2.wp.com/pcpimpz.com/wp-content/uploads/2020/01/travel-landscape-01.jpg?ssl=1'),
                fadeInDuration: Duration(milliseconds: 200),
                height: 308.0,
                fit: BoxFit.cover,
              ),
              Container(
                padding: EdgeInsets.all(10.0),
                child: Text(
                  'Description of Image',
                  style: TextStyle(color: AppTheme.greenColor4),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
