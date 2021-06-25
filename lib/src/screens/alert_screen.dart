import 'package:flutter/material.dart';

import '../../theme.dart';

class AlertScreen extends StatelessWidget {
  const AlertScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.panelColor,
      appBar: AppBar(
        title: Text('Alert'),
        backgroundColor: AppTheme.panelColor,
        elevation: 10.0,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pop(context);
        },
        child: Icon(Icons.add_location),
      ),
      body: Center(
        child: ElevatedButton(
          child: Text('Show Alert'),
          onPressed: () => _showAlert(context),
          style: ElevatedButton.styleFrom(
            primary: AppTheme.greenColor4,
            shape: StadiumBorder(),
          ),
        ),
      ),
    );
  }

  void _showAlert(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) {
        return AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
          title: Text('Title'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text('This is the content of alert box'),
              FlutterLogo(
                size: 100.0,
              )
            ],
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text(
                'Cancel',
                style: TextStyle(color: AppTheme.greenColor4),
              ),
            ),
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text(
                'Ok',
                style: TextStyle(color: AppTheme.greenColor4),
              ),
            ),
          ],
        );
      },
    );
  }
}
