import 'package:flutter/material.dart';

import '../../theme.dart';

class AvatarScreen extends StatelessWidget {
  const AvatarScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.panelColor,
      appBar: AppBar(
        title: Text('Avatar'),
        backgroundColor: AppTheme.panelColor,
        elevation: 10.0,
        actions: <Widget>[
          Container(
            margin: EdgeInsets.only(right: 10.0),
            padding: EdgeInsets.all(5.0),
            child: CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://pbs.twimg.com/profile_images/1018943227791982592/URnaMrya.jpg'),
              radius: 25.0,
            ),
          ),
          Container(
            margin: EdgeInsets.only(right: 10.0),
            child: CircleAvatar(
              child: Text('SL'),
              backgroundColor: Colors.white,
            ),
          )
        ],
      ),
      body: Center(
        child: FadeInImage(
          image:
              NetworkImage('https://pbs.twimg.com/media/CItrBITWgAABe4c.jpg'),
          placeholder: AssetImage('assets/images/jar-loading.gif'),
          fadeInDuration: Duration(milliseconds: 200),
        ),
      ),
    );
  }
}
